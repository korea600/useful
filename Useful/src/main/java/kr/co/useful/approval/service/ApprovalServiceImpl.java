package kr.co.useful.approval.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.useful.approval.domain.ApprovalCommentVO;
import kr.co.useful.approval.domain.ApprovalCriteria;
import kr.co.useful.approval.domain.ApprovalProgressVO;
import kr.co.useful.approval.domain.ApprovalRestVO;
import kr.co.useful.approval.domain.ApprovalVO;
import kr.co.useful.approval.domain.PathMaker;
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
	public void create(ApprovalVO vo, MultipartFile file, HttpServletRequest request) throws Exception {
		vo.setCurr_approval(vo.getWriter());					// 작성자를 최근 결재자로 지정
		vo.setReceiver_dname(dao.getDname(vo.getReceiver()));	// 수신처 부서번호를 이용하여 수신부서명 지정
		// 다음 결재자가 있는지 확인
		ApprovalRestVO restVO = new ApprovalRestVO(); 
		restVO.setDeptno(vo.getReceiver());				
		restVO.setEmpno(vo.getWriter());
		if(restdao.getLine(restVO).size()>0){					// 다음 결재자가 있으면 다음 결재자로 직속상사 지정
			vo.setNext_approval(dao.getManager(vo.getWriter()));
			vo.setStatus("진행");
		}
		else{
			vo.setNext_approval(vo.getWriter());	// 다음 결재자가 없으면 작성자가 다음 결재자가 됨
			vo.setStatus("완료");
		}
		// 업로드 폴더 정보 + 현재시간 정보 얻기
		String uploadpath = PathMaker.getUploadPath(request);
		String realpath = PathMaker.getRealPath(request);
		String time = PathMaker.getTime();
		
		// 지정된 파일업로드 폴더가 없을경우 생성 
		File uploadLocation = new File(uploadpath);
		if(!uploadLocation.exists()) uploadLocation.mkdir();
		String filename = file.getOriginalFilename();
		
		// 업로드된 파일이 있을경우 업로드 처리
		if(filename!=null && filename.length()>0){
			File realfile = new File(realpath+"/"+filename);
			filename=time+"_"+filename;					// 파일명 앞에 업로드 시간정보 붙이기
			realfile.renameTo(new File(realpath+"/"+filename));
			File out = new File(uploadpath+"/"+filename);
			FileCopyUtils.copy(file.getBytes(), out);	// 지정된 경로로 업로드 파일 복사
		}
		vo.setFilename(filename);						// 업로드된 파일명을 DB에 저장하기 위해 VO에 값 저장
		dao.create(vo);
	}
	
	public int getMyDeptno(int empno) throws Exception {
		return dao.getMyDeptno(empno);
	}

	@Transactional
	public void update(ApprovalVO vo, MultipartFile file, 
								HttpServletRequest request,String oldfilename)	throws Exception {
		String uploadpath = PathMaker.getUploadPath(request);
		String uploadrealpath = PathMaker.getRealPath(request);
		String time = PathMaker.getTime();
		
		// 기존에 업로드 되었던 파일 삭제 (GIT폴더내의 upload폴더와 실제 upload폴더(realpath)에 있는 두 파일)
		File deluploadfile = new File(uploadpath+"/"+oldfilename);
		File deluploadrealfile = new File(uploadrealpath+"/"+oldfilename);
		if(deluploadfile!=null && deluploadfile.exists()) deluploadfile.delete();
		if(deluploadrealfile!=null && deluploadrealfile.exists()) deluploadrealfile.delete();
		
		// 업로드된 파일이 있을경우 업로드 처리
		String filename = file.getOriginalFilename();
		if(filename!=null && filename.length()>0){
			File realfile = new File(uploadrealpath+"/"+filename);
			filename=time+"_"+filename;					// 파일명 앞에 업로드 시간정보 붙이기
			realfile.renameTo(new File(uploadrealpath+"/"+filename));
			File out = new File(uploadpath+"/"+filename);
			FileCopyUtils.copy(file.getBytes(), out);	// 지정된 경로로 업로드 파일 복사
			vo.setFilename(filename);		
		}

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

	public List<ApprovalVO> list(ApprovalVO vo, ApprovalCriteria cri) throws Exception {
		return dao.list(vo,cri);
	}

	public ApprovalVO select(int no) throws Exception {
		return dao.select(no);
	}

	public List<ApprovalVO> listStatus(Map<String, Object> map, ApprovalCriteria cri) throws Exception {
		return dao.listStatus(map,cri);
	}
	
	@Transactional
	public void delete(ApprovalVO vo,HttpServletRequest request) throws Exception {
		// DB처리 (결재문서 삭제 + 결재에 달린 코멘트 삭제)
		dao.delete(vo.getNo());
		commentdao.delete(vo.getNo());
		
		// 업로드된 파일이 있는지 확인후 삭제
		File uploadfile = new File(PathMaker.getUploadPath(request)+"/"+vo.getFilename());
		File uploadrealfile = new File(PathMaker.getRealPath(request)+"/"+vo.getFilename());
		if(uploadfile!=null && uploadfile.exists()) uploadfile.delete();
		if(uploadrealfile!=null && uploadrealfile.exists()) uploadrealfile.delete();
	}

	public int listCount(ApprovalVO vo, ApprovalCriteria cri) throws Exception {
		return dao.listCount(vo, cri);
	}

	public int listStatusCount(Map<String, Object> map, ApprovalCriteria cri) throws Exception {
		return dao.listStatusCount(map, cri);
	}
}
