package kr.co.useful.meeting.persistence;

import java.util.List;

import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.domain.MeetingVO;
import kr.co.useful.meeting.domain.SearchCriteria;



public interface MeetingDAO {

	// 회의실 전체
		public List<MeetingRoomVO> rooms() throws Exception;
		
		//방만들기
		public void create(MeetingRoomVO vo) throws Exception;
		
		//방수정
		public void update(MeetingRoomVO vo)throws Exception;
		
		public void delete(int roomno)throws Exception;
		
		
		
	//예약등록
		public void updateBooking(MeetingVO vo)throws Exception;
	//예약취소
		public void removeBooking(int serial)throws Exception;
	//예약승인
		public void checkYes(int serial)throws Exception;
	//예약거절
		public void checkNo(int serial)throws Exception;
	//관리자 리스트	
		public List<MeetingVO> allBooking()throws Exception;
		
    //내가 예약한 리스트
		public List<MeetingVO> myBooking(int empno)throws Exception;
	//다 볼 수 있는 리스트 : 예약이 다 된 것
		public List<MeetingVO> bookingEnd(int roomno)throws Exception;
	//하나보기
		public MeetingVO oneBooking(int serial)throws Exception;
	//삭제
		public void deleteBooking(int serial)throws Exception;
		
	// 다 볼 수 있는 리스트
		public List<MeetingVO> bookingOK(SearchCriteria cri, int roomno) throws Exception;
		
	    //-전체리스트 수
	    public int totalBookngOK() throws Exception;	
	    
	    public int okListSearchCount(SearchCriteria cri, int roomno)throws Exception;
	    public int myListSearchCount(String checked,int empno)throws Exception;
	    public int allListSearchCount(String checked)throws Exception;
		
	/*    //검색리스트 수
	    public int myListSearchCount(SearchCriteria cri, int empno)throws Exception;
	    public int okListSearchCount(SearchCriteria cri, int roomno)throws Exception;
	    public int allListSearchCount(SearchCriteria cri)throws Exception;
		*/
		public List<MeetingVO> myBooking2(SearchCriteria cri, int empno, String checked) throws Exception;
		
		// 관리자 볼 수 있는 리스트
		public List<MeetingVO> allBooking2(String checked, SearchCriteria cri) throws Exception;
}
