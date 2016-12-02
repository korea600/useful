package kr.co.useful.approval.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.useful.approval.domain.ApprovalCommentVO;
import kr.co.useful.approval.domain.ApprovalProgressVO;
import kr.co.useful.approval.domain.ApprovalRestVO;
import kr.co.useful.approval.domain.ApprovalVO;
import kr.co.useful.approval.persistence.ApprovalCommentDAO;
import kr.co.useful.approval.persistence.ApprovalDAO;
import kr.co.useful.approval.persistence.ApprovalRestDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	@Inject
	private ApprovalDAO dao;
	@Inject
	private ApprovalRestDAO restdao;
	@Inject
	private ApprovalCommentDAO commentdao;
	
	@Transactional
	public void create(ApprovalVO vo) throws Exception {
		vo.setCurr_approval(vo.getWriter());			// 작성자를 최근 결재자로 지정
		
		// 다음 결재자가 있는지 확인
		ApprovalRestVO restVO = new ApprovalRestVO(); 
		restVO.setDeptno(vo.getReceiver());				
		restVO.setEmpno(vo.getWriter());
		if(restdao.getLine(restVO).size()>0){		// 다음 결재자가 있으면 다음 결재자로 직속상사 지정
			vo.setNext_approval(dao.getManager(vo.getWriter()));
			vo.setStatus("진행");
		}
		else{
			vo.setNext_approval(vo.getWriter());	// 다음 결재자가 없으면 작성자가 다음 결재자가 됨
			vo.setStatus("완료");
		}
		dao.create(vo);
	}
	
	public int getMyDeptno(int empno) throws Exception {
		return dao.getMyDeptno(empno);
	}

	@Transactional
	public void update(ApprovalVO vo) throws Exception {
		// 다음 결재자가 있는지 확인
		ApprovalRestVO restVO = new ApprovalRestVO(); 
		restVO.setDeptno(vo.getReceiver());				
		restVO.setEmpno(vo.getWriter());
		if(restdao.getLine(restVO).size()>0){		// 다음 결재자가 있으면 다음 결재자로 직속상사 지정
			vo.setNext_approval(dao.getManager(vo.getWriter()));
			vo.setStatus("진행");
		}
		else{
			vo.setNext_approval(vo.getWriter());	// 다음 결재자가 없으면 작성자가 다음 결재자가 됨
			vo.setStatus("완료");
		}
		dao.update(vo);
	}

	@Transactional
	public void do_approval(ApprovalVO vo,ApprovalProgressVO progressVO) throws Exception {
		ApprovalVO newVO = new ApprovalVO();						// 결재처리 SQL에 전달할 VO
		ApprovalCommentVO commentVO = new ApprovalCommentVO();		// 코멘트처리 SQL에 전달할 VO
		newVO.setStatus("진행");							// 결재진행상태 기본값 지정 (조건문에 따라 변경됨)
		newVO.setNo(vo.getNo());
		newVO.setNext_approval(progressVO.getNo());		// 결재 승인/반려할 문서의 번호 저장
		int manager_empno=dao.getManager(progressVO.getEmpno());	// 직속상사의 사번정보 조회
		// 결재 승인
		if(progressVO.isSign()){
			commentVO.setChecked("결재");
			// 내부문서, 타부서 발신용 문서
			if(vo.getReceiver()!=0){
				/* next_approval의 직책이 부장이었다 (=결재자의 직급이 부장이다)
				 				-> status : 완료, curr/next : 0	*/
				if(manager_empno==1000){
					newVO.setStatus("완료");
					newVO.setCurr_approval(0);
					newVO.setNext_approval(0);
					dao.change_status(newVO);
				}
				
				/* next_approval의 직책이 부장이 아니었다(결재자의 직급이 부장미만이다)
								-> curr : 현재결재자, next : 현재결재자의 상사	*/
				else{
					newVO.setCurr_approval(progressVO.getEmpno());
					newVO.setNext_approval(manager_empno);
				}
			}
			// 전체문서
			else{
				if(manager_empno!=0){	// 결재자의 직책이 사장(manager!=0)이 아니었다 
					newVO.setCurr_approval(progressVO.getEmpno());
					newVO.setNext_approval(manager_empno);
				}
				else{					// 결재자의 직책이 사장(manager==0)이었다 -> 결재완료처리
					newVO.setStatus("완료");
					newVO.setCurr_approval(0);
					newVO.setNext_approval(0);
					dao.change_status(newVO);
				}
			}
		}
		// 결재 반려 : 현재와 다음결재자 모두 작성자로 바꿈
		else{
			commentVO.setChecked("반려");
			newVO.setStatus("반려");
			newVO.setCurr_approval(vo.getWriter());
			newVO.setNext_approval(0);
			dao.change_status(newVO);
		}
		
		dao.change_status(newVO);
		dao.change_approval(newVO);

		// 코멘트 처리 (결재시에는 코멘트 입력이 없을수 있음)
		if(progressVO.getComments()!=null){
			commentVO.setNo(progressVO.getNo());
			commentVO.setWriter(progressVO.getEmpno());
			commentVO.setWriter_name(progressVO.getEname());
			commentVO.setComments(progressVO.getComments());
			commentdao.insert(commentVO);
		}
	}

	public List<ApprovalVO> list(ApprovalVO vo) throws Exception {
		return dao.list(vo);
	}

	public ApprovalVO select(int no) throws Exception {
		return dao.select(no);
	}

	public List<ApprovalVO> listStatus(Map<String, Object> map) throws Exception {
		return dao.listStatus(map);
	}

	public String getDname(int deptno) throws Exception {
		return dao.getDname(deptno);
	}
	
	@Transactional
	public void delete(int no) throws Exception {
		dao.delete(no);
		commentdao.delelte(no);
	}
}
