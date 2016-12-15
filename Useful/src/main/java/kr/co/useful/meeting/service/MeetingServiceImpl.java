package kr.co.useful.meeting.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.domain.MeetingVO;
import kr.co.useful.meeting.domain.SearchCriteria;
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
	
		return dao.myBooking(empno);
	}

	@Override
	public List<MeetingVO> bookingEnd(int roomno) throws Exception {
		
		return dao.bookingEnd(roomno);
	}

	@Override
	public List<MeetingVO> bookingOK(SearchCriteria cri, int roomno) throws Exception {
		
		return dao.bookingOK(cri, roomno);
	}

	@Override
	public int totalBookngOK() throws Exception {
		
		return dao.totalBookngOK();
	}


	@Override
	public MeetingVO oneBooking(int serial) throws Exception {
		
		return dao.oneBooking(serial);
	}

	@Override
	public void deletBooking(int serial) throws Exception {
		dao.deleteBooking(serial);
		
	}

	@Override
	public List<MeetingVO> myBooking2(SearchCriteria cri, int empno, String checked) throws Exception {
		
		return dao.myBooking2(cri, empno, checked);
	}

	@Override
	public List<MeetingVO> allBooking2(String checked, SearchCriteria cri) throws Exception {
		
		return dao.allBooking2(checked, cri);
	}

	@Override
	public int okListSearchCount(SearchCriteria cri, int roomno) throws Exception {
		
		return dao.okListSearchCount(cri, roomno);
	}

	@Override
	public int myListSearchCount(String checked, int empno) throws Exception {
	
		return dao.myListSearchCount(checked, empno);
	}

	@Override
	public int allListSearchCount(String checked) throws Exception {
		// TODO Auto-generated method stub
		return dao.allListSearchCount(checked);
	}



}
