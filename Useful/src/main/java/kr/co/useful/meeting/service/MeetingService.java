package kr.co.useful.meeting.service;

import java.util.List;

import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.domain.MeetingVO;
import kr.co.useful.meeting.domain.SearchCriteria;

public interface MeetingService {
	public void regist(MeetingRoomVO vo) throws Exception;

	public void change(MeetingRoomVO vo) throws Exception;

	public void remove(int serial) throws Exception;

	public List<MeetingRoomVO> rooms() throws Exception;

	// 예약등록
	public void updateBooking(MeetingVO vo) throws Exception;

	// 예약취소
	public void removeBooking(int serial) throws Exception;

	// 예약승인
	public void checkYes(int serial) throws Exception;

	// 예약거절
	public void checkNo(int serial) throws Exception;

	// 관리자 리스트
	public List<MeetingVO> allBooking() throws Exception;

	// 내가 예약한 리스트
	public List<MeetingVO> myBooking(int empno) throws Exception;

	// 다 볼 수 있는 리스트 : 예약이 다 된 것
	public List<MeetingVO> bookingEnd(int roomno) throws Exception;

	public MeetingVO oneBooking(int serial) throws Exception;

	public void deletBooking(int serial) throws Exception;

	// 다 볼 수 있는 리스트
	public List<MeetingVO> bookingOK(SearchCriteria cri, int roomno) throws Exception;

	// -전체리스트 수
	public int totalBookngOK() throws Exception;

	// 검색리스트 수
	public int listSearchCount(SearchCriteria cri) throws Exception;

	public List<MeetingVO> myBooking2(SearchCriteria cri, int empno, String checked) throws Exception;

	// 관리자 볼 수 있는 리스트
	public List<MeetingVO> allBooking2(String checked, SearchCriteria cri) throws Exception;

}
