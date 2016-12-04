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

	@Override
	public List<ScheduleVO> listCo() throws Exception {
		
		RowBounds bound = new RowBounds(0,10);
		return sqs.selectList("schedule.listCo", bound);
	}

	@Override
	public ScheduleVO read(int serial) throws Exception {
	  return sqs.selectOne("schedule.oneRead", serial);

	}

	@Override
	public void create(ScheduleVO vo) throws Exception {
		sqs.insert("schedule.create", vo);

	}

	@Override
	public void update(ScheduleVO vo) throws Exception {
		sqs.update("schedule.update", vo);

	}

	@Override
	public void delete(int serial) throws Exception {
		sqs.delete("schedule.delete", serial);

	}

	@Override
	public int totalListCount() throws Exception {
		
		return sqs.selectOne("schedule.scheduleListCount");
	}

	@Override
	public List<ScheduleVO> listSearch(SearchCriteria cri) throws Exception {
		
		return sqs.selectList("schedule.listSearch", cri, 
	               new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return sqs.selectOne("schedule.listSerchCount", cri);
	}

}
