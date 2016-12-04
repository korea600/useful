package kr.co.useful.approval.persistence;

import java.util.List;
import java.util.Map;

import kr.co.useful.approval.domain.ApprovalCriteria;
import kr.co.useful.approval.domain.ApprovalVO;

public interface ApprovalDAO {
	public void create(ApprovalVO vo) throws Exception;				// 결재문서 등록
	public void update(ApprovalVO vo) throws Exception;				// 수정하기 (반려된 문서)
	public void delete(int no) throws Exception;					// 수정하기 (반려된 문서)
	public ApprovalVO select(int no) throws Exception;				// 특정문서 조회
	public List<ApprovalVO> list(ApprovalVO vo, ApprovalCriteria cri)
											throws Exception;		// 조건에 따른 문서리스트 조회
	public List<ApprovalVO> listStatus(Map<String, Object> map, ApprovalCriteria cri)
											throws Exception;		// 우리부서내에서 결재 진행중인 문서 조회
	public int listCount(ApprovalVO vo, ApprovalCriteria cri)
											throws Exception;		// 조건에 따른 문서리스트의 갯수조회
	public int listStatusCount(Map<String, Object> map, ApprovalCriteria cri)
											throws Exception;		// 우리부서내에서 결재 진행중인 문서의 갯수 조회
	public void change_approval(ApprovalVO vo) throws Exception;	// 결재(승인/반려)에 따른 결재자 정보 변경
	public void change_status(ApprovalVO vo) throws Exception;		// 결재(승인/반려)에 따른 결재진행상태 변경
	public int getManager(int empno)throws Exception;				// 직속상사 사번 정보 조회
	public int getMyDeptno(int empno) throws Exception;				// 자신의 부서번호 조회
	public String getDname(int deptno) throws Exception;			// 특정 부서번호의 부서명 조회
	
	// 메인페이지용 리스트 조회
	public List<ApprovalVO> listMyTurn_forMain(int empno) throws Exception;
	public List<ApprovalVO> listMine_forMain(int empno) throws Exception;
	
}
