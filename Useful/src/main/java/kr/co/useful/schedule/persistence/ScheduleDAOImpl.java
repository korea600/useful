package kr.co.useful.schedule.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.schedule.domain.ScheduleVO;
import kr.co.useful.schedule.domain.SearchCriteria;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {
	
	@Inject
	private SqlSession sqs;

	public List<ScheduleVO> listCo() throws Exception {
		RowBounds bound = new RowBounds(0,10);
		return sqs.selectList("schedule.listCo", bound);
	}

	public ScheduleVO read(int serial) throws Exception {
	  return sqs.selectOne("schedule.oneRead", serial);
	}

	public void create(ScheduleVO vo) throws Exception {
		sqs.insert("schedule.create", vo);
	}

	public void update(ScheduleVO vo) throws Exception {
		sqs.update("schedule.update", vo);
	}

	public void delete(int serial) throws Exception {
		sqs.delete("schedule.delete", serial);
	}

	public int totalListCount() throws Exception {
		return sqs.selectOne("schedule.scheduleListCount");
	}

	public List<ScheduleVO> listSearch(SearchCriteria cri) throws Exception {
		return sqs.selectList("schedule.listSearch", cri, 
	               new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqs.selectOne("schedule.listSearchCount", cri);
	}

}
