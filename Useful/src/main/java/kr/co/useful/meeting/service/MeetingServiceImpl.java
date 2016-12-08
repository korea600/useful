package kr.co.useful.meeting.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.domain.MeetingVO;
import kr.co.useful.meeting.persistence.MeetingDAO;

@Service
public class MeetingServiceImpl implements MeetingService {

	
	@Inject
     private MeetingDAO dao;
	
	@Override
	public void regist(MeetingRoomVO vo) throws Exception {
		
		dao.create(vo);
		
	}

	@Override
	public void change(MeetingRoomVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(int roomno) throws Exception {
		dao.delete(roomno);
		
	}

	@Override
	public List<MeetingRoomVO> rooms() throws Exception {
		
		return dao.rooms();
	}

	@Override
	public void updateBooking(MeetingVO vo) throws Exception {
	     dao.updateBooking(vo);
		
	}

	@Override
	public void removeBooking(int serial) throws Exception {
		// TODO Auto-generated method stub
		dao.removeBooking(serial);
	}

	@Override
	public void checkYes(int serial) throws Exception {
		dao.checkYes(serial);
		
	}

	@Override
	public void checkNo(int serial) throws Exception {
		dao.checkNo(serial);
	}

	@Override
	public List<MeetingVO> allBooking() throws Exception {
		
		return dao.allBooking();
	}

	@Override
	public List<MeetingVO> myBooking(int empno) throws Exception {
		// TODO Auto-generated method stub
		return dao.myBooking(empno);
	}

	@Override
	public List<MeetingVO> bookingEnd(int roomno) throws Exception {
		// TODO Auto-generated method stub
		return dao.bookingEnd(roomno);
	}

}
