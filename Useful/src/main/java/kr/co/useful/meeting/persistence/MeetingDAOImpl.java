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

	public List<MeetingRoomVO> rooms() throws Exception {
		return sqs.selectList("meeting.rooms");
	}

	public void create(MeetingRoomVO vo) throws Exception {
		sqs.insert("meeting.roominput",vo);
	}

	public void update(MeetingRoomVO vo) throws Exception {
		sqs.update("meeting.update", vo);
	}

	public void delete(int roomno) throws Exception {
		sqs.delete("meeting.delete", roomno);		
	}

	public void updateBooking(MeetingVO vo) throws Exception {
		sqs.update("booking.insert", vo);
	}

	public void removeBooking(int serial) throws Exception {
		sqs.delete("booking.cancel", serial);
	}

	public void checkYes(int serial) throws Exception {
		sqs.update("booking.checkYes", serial);
	}

	public void checkNo(int serial) throws Exception {
		sqs.update("booking.checkNo", serial);
	}

	public List<MeetingVO> allBooking() throws Exception {
		return sqs.selectList("booking.allBooking");
	}

	public List<MeetingVO> myBooking(int empno) throws Exception {
		return sqs.selectList("booking.myBooking",  empno);
	}

	public List<MeetingVO> bookingEnd(int roomno) throws Exception {
		return sqs.selectList("booking.listOfNum", roomno);
	}

	public int totalBookngOK() throws Exception {
		return sqs.selectOne("booking.countOKlist");
	}

	public MeetingVO oneBooking(int serial) throws Exception {
		return sqs.selectOne("booking.oneBooking", serial);
	}

	public void deleteBooking(int serial) throws Exception {
		sqs.delete("booking.delete", serial);
	}

	public List<MeetingVO> allBooking2(String checked, SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("checked", checked);
		map.put("searchType",cri.getSearchType());
		return sqs.selectList("booking.allBooking2", map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public List<MeetingVO> bookingOK(SearchCriteria cri, int roomno) throws Exception {
        Map<String, Object> map = new HashMap<>();
		map.put("roomno", roomno);
		map.put("keyword", cri.getKeyword());
		map.put("searchType",cri.getSearchType());
		return sqs.selectList("booking.listOfNum2", map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int okListSearchCount(SearchCriteria cri, int roomno) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("roomno", roomno);
		map.put("serchType", cri.getSearchType());
		return sqs.selectOne("booking.countOKlist", map);
	}

	public List<MeetingVO> myBooking2(SearchCriteria cri, int empno, String checked) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("empno", empno);
		map.put("checked", checked);
		return sqs.selectList("booking.myBooking2", map, new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int myListSearchCount(String checked, int empno) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("checked", checked);
		map.put("empno", empno);
		 
		return sqs.selectOne("booking.countMylist", map);
	}

	public int allListSearchCount(String checked) throws Exception {
		Map<String,String> map = new HashMap<>();
		map.put("checked", checked);
		return sqs.selectOne("booking.prelist", map);
	}

}
