package kr.co.useful.meeting.persistence;

import java.util.List;

import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.domain.MeetingVO;


public interface MeetingDAO {

	// ȸ�ǽ� ��ü
		public List<MeetingRoomVO> rooms() throws Exception;
		
		//�游���
		public void create(MeetingRoomVO vo) throws Exception;
		
		//�����
		public void update(MeetingRoomVO vo)throws Exception;
		
		public void delete(int roomno)throws Exception;
		
		
		
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
