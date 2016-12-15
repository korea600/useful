package kr.co.useful.meeting.persistence;

import java.util.List;

import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.domain.MeetingVO;
import kr.co.useful.meeting.domain.SearchCriteria;



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
	//�ϳ�����
		public MeetingVO oneBooking(int serial)throws Exception;
	//����
		public void deleteBooking(int serial)throws Exception;
		
	// �� �� �� �ִ� ����Ʈ
		public List<MeetingVO> bookingOK(SearchCriteria cri, int roomno) throws Exception;
		
	    //-��ü����Ʈ ��
	    public int totalBookngOK() throws Exception;	
	    
	    public int okListSearchCount(SearchCriteria cri, int roomno)throws Exception;
	    public int myListSearchCount(String checked,int empno)throws Exception;
	    public int allListSearchCount(String checked)throws Exception;
		
	/*    //�˻�����Ʈ ��
	    public int myListSearchCount(SearchCriteria cri, int empno)throws Exception;
	    public int okListSearchCount(SearchCriteria cri, int roomno)throws Exception;
	    public int allListSearchCount(SearchCriteria cri)throws Exception;
		*/
		public List<MeetingVO> myBooking2(SearchCriteria cri, int empno, String checked) throws Exception;
		
		// ������ �� �� �ִ� ����Ʈ
		public List<MeetingVO> allBooking2(String checked, SearchCriteria cri) throws Exception;
}
