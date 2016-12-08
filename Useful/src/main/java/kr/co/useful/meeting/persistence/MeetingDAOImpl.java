package kr.co.useful.meeting.persistence;

import java.util.List;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.domain.MeetingVO;


@Repository
public class MeetingDAOImpl implements MeetingDAO {
	
	@Inject
	private SqlSession sqs;

	@Override
	public List<MeetingRoomVO> rooms() throws Exception {
		
		return sqs.selectList("meeting.rooms");
	}

	@Override
	public void create(MeetingRoomVO vo) throws Exception {
		
		sqs.insert("meeting.roominput",vo);
		
	}

	@Override
	public void update(MeetingRoomVO vo) throws Exception {
		
		sqs.update("meeting.update", vo);
		
	}

	@Override
	public void delete(int roomno) throws Exception {
		sqs.delete("meeting.delete", roomno);		
	}

	@Override
	public void updateBooking(MeetingVO vo) throws Exception {
		sqs.update("booking.insert", vo);
		
	}

	@Override
	public void removeBooking(int serial) throws Exception {
		sqs.delete("booking.cancel", serial);
		
	}

	@Override
	public void checkYes(int serial) throws Exception {
		sqs.update("booking.checkYes", serial);
		
	}

	@Override
	public void checkNo(int serial) throws Exception {
		sqs.update("booking.checkNo", serial);
	}

	@Override
	public List<MeetingVO> allBooking() throws Exception {
		
		return sqs.selectList("booking.allBooking");
	}

	@Override
	public List<MeetingVO> myBooking(int empno) throws Exception {
	
		return sqs.selectList("booking.myBooking",  empno);
	}

	@Override
	public List<MeetingVO> bookingEnd(int roomno) throws Exception {
	
		return sqs.selectList("booking.listOfNum", roomno);
	}

	
}
