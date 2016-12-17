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

	public void regist(MeetingRoomVO vo) throws Exception {
		dao.create(vo);
	}

	public void change(MeetingRoomVO vo) throws Exception {
		dao.update(vo);
	}

	public void remove(int roomno) throws Exception {
		dao.delete(roomno);
	}

	public List<MeetingRoomVO> rooms() throws Exception {
		return dao.rooms();
	}

	public void updateBooking(MeetingVO vo) throws Exception {
	    dao.updateBooking(vo);
	}

	public void removeBooking(int serial) throws Exception {
		dao.removeBooking(serial);
	}

	public void checkYes(int serial) throws Exception {
		dao.checkYes(serial);
	}

	public void checkNo(int serial) throws Exception {
		dao.checkNo(serial);
	}

	public List<MeetingVO> allBooking() throws Exception {
		return dao.allBooking();
	}

	public List<MeetingVO> myBooking(int empno) throws Exception {
		return dao.myBooking(empno);
	}

	public List<MeetingVO> bookingEnd(int roomno) throws Exception {
		return dao.bookingEnd(roomno);
	}

	public List<MeetingVO> bookingOK(SearchCriteria cri, int roomno) throws Exception {
		return dao.bookingOK(cri, roomno);
	}

	public int totalBookngOK() throws Exception {
		return dao.totalBookngOK();
	}

	public MeetingVO oneBooking(int serial) throws Exception {
		return dao.oneBooking(serial);
	}

	public void deletBooking(int serial) throws Exception {
		dao.deleteBooking(serial);
	}

	public List<MeetingVO> myBooking2(SearchCriteria cri, int empno, String checked) throws Exception {
		return dao.myBooking2(cri, empno, checked);
	}

	public List<MeetingVO> allBooking2(String checked, SearchCriteria cri) throws Exception {
		return dao.allBooking2(checked, cri);
	}

	public int okListSearchCount(SearchCriteria cri, int roomno) throws Exception {
		return dao.okListSearchCount(cri, roomno);
	}

	public int myListSearchCount(String checked, int empno) throws Exception {
		return dao.myListSearchCount(checked, empno);
	}

	public int allListSearchCount(String checked) throws Exception {
		return dao.allListSearchCount(checked);
	}

}
