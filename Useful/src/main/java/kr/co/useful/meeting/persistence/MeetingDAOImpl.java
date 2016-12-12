package kr.co.useful.meeting.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.domain.MeetingVO;
import kr.co.useful.meeting.domain.SearchCriteria;


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


	@Override
	public int totalBookngOK() throws Exception {
		// TODO Auto-generated method stub
		return sqs.selectOne("booking.countOKlist");
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqs.selectOne("booking.listSearchCount", cri);
	}

	@Override
	public List<MeetingVO> bookingOK(SearchCriteria cri, int roomno) throws Exception {
        Map<String, Object> map = new HashMap<>();
		map.put("roomno", roomno);
		map.put("keyword", cri.getKeyword());
		map.put("searchType",cri.getSearchType());
		return sqs.selectList("booking.listOfNum2", map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public MeetingVO oneBooking(int serial) throws Exception {
		
		return sqs.selectOne("booking.oneBooking", serial);
	}

	@Override
	public void deleteBooking(int serial) throws Exception {
		sqs.delete("booking.delete", serial);
		
	}

	@Override
	public List<MeetingVO> myBooking2(SearchCriteria cri, int empno, String checked) throws Exception {
		   Map<String, Object> map = new HashMap<>();
			map.put("empno", empno);
			map.put("checked", checked);
			return sqs.selectList("booking.myBooking2", map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public List<MeetingVO> allBooking2(String checked, SearchCriteria cri) throws Exception {
		   Map<String, Object> map = new HashMap<>();
			
			map.put("checked", checked);
			map.put("searchType",cri.getSearchType());
			return sqs.selectList("booking.allBooking2", map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}


	
}
