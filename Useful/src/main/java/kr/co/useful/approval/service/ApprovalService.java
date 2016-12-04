package kr.co.useful.approval.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.useful.approval.domain.ApprovalCriteria;
import kr.co.useful.approval.domain.ApprovalProgressVO;
import kr.co.useful.approval.domain.ApprovalVO;

public interface ApprovalService {
	public void create(ApprovalVO vo, MultipartFile file, HttpServletRequest request)
																throws Exception;	// 결재문서 등록
	public void update(ApprovalVO vo, MultipartFile file,
				HttpServletRequest request,String oldfilename) throws Exception;	// 수정하기 (반려된 문서)
	public void delete(ApprovalVO vo,HttpServletRequest request) throws Exception;	// 삭제하기 (반려된 문서)
	public ApprovalVO select(int no) throws Exception;								// 특정문서 조회
	public List<ApprovalVO> list(ApprovalVO vo, ApprovalCriteria cri)
																throws Exception;	// 조건에 따른 문서 리스트 조회
	public List<ApprovalVO> listStatus(Map<String, Object> map,
										ApprovalCriteria cri) 	throws Exception;	// 우리부서내에서 결재 진행중인 문서 조회
	public void do_approval(ApprovalVO vo,ApprovalProgressVO progressVO)
																throws Exception;	// 결재/반려 하기 (코멘트 달기)
	public int getMyDeptno(int empno) throws Exception;								// 자신의 부서번호 조회
	public int listCount(ApprovalVO vo, ApprovalCriteria cri)	throws Exception;	// 조건에 따른 문서 리스트 조회
	public int listStatusCount(Map<String, Object> map, ApprovalCriteria cri)	throws Exception;	// 우리부서내에서 결재 진행중인 문서 조회
	// 메인페이지 출력용
	public List<ApprovalVO> listMyTurn_forMain(int empno) throws Exception;			// 내가 결재 차례인 문서 조회
	public List<ApprovalVO> listMine_forMain(int empno) throws Exception;			// 내가 작성한 문서 조회
	
}
