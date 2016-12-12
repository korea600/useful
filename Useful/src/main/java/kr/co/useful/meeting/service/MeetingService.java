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

	// ������
	public void updateBooking(MeetingVO vo) throws Exception;

	// �������
	public void removeBooking(int serial) throws Exception;

	// �������
	public void checkYes(int serial) throws Exception;

	// �������
	public void checkNo(int serial) throws Exception;

	// ������ ����Ʈ
	public List<MeetingVO> allBooking() throws Exception;

	// ���� ������ ����Ʈ
	public List<MeetingVO> myBooking(int empno) throws Exception;

	// �� �� �� �ִ� ����Ʈ : ������ �� �� ��
	public List<MeetingVO> bookingEnd(int roomno) throws Exception;

	public MeetingVO oneBooking(int serial) throws Exception;

	public void deletBooking(int serial) throws Exception;

	// �� �� �� �ִ� ����Ʈ
	public List<MeetingVO> bookingOK(SearchCriteria cri, int roomno) throws Exception;

	// -��ü����Ʈ ��
	public int totalBookngOK() throws Exception;

	// �˻�����Ʈ ��
	public int listSearchCount(SearchCriteria cri) throws Exception;

	public List<MeetingVO> myBooking2(SearchCriteria cri, int empno, String checked) throws Exception;

	// ������ �� �� �ִ� ����Ʈ
	public List<MeetingVO> allBooking2(String checked, SearchCriteria cri) throws Exception;

}
