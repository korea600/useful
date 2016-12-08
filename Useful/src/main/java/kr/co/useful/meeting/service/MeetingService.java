package kr.co.useful.meeting.service;

import java.util.List;

import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.domain.MeetingVO;



public interface MeetingService {
	public void regist(MeetingRoomVO vo)throws Exception;
	public void change(MeetingRoomVO vo)throws Exception;
	public void remove(int serial)throws Exception;
	public List<MeetingRoomVO> rooms()throws Exception;

	
	
	//������
		public void updateBooking(MeetingVO vo)throws Exception;
	//�������
		public void removeBooking(int serial)throws Exception;
	//�������
		public void checkYes(int serial)throws Exception;
	//�������
		public void checkNo(int serial)throws Exception;
	//������ ����Ʈ	
		public List<MeetingVO> allBooking()throws Exception;
    //���� ������ ����Ʈ
		public List<MeetingVO> myBooking(int empno)throws Exception;
	//�� �� �� �ִ� ����Ʈ : ������ �� �� ��
		public List<MeetingVO> bookingEnd(int roomno)throws Exception;

	
}
