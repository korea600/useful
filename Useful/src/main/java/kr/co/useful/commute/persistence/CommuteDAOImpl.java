package kr.co.useful.commute.persistence;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.useful.manager.domain.CommuteVO;

@Repository
public class CommuteDAOImpl implements CommuteDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	public void insert(int empno) throws Exception {
		String checked;
		
		Calendar now = Calendar.getInstance( );
		now.get(Calendar.HOUR_OF_DAY);
			
		Map<String, Object> map = new HashMap<>();
			if(now.get(Calendar.HOUR_OF_DAY) < 9){
				checked = "출근";
			}
			else{
				checked = "지각";
			}
		map.put("empno", empno);
		map.put("checked",checked);
		
		sqlSession.insert("commute.insert", map);
	}

	public void update(int empno) throws Exception {
		sqlSession.update("commute.update", empno);
	}

	public int select(int empno) throws Exception {
		return sqlSession.selectOne("commute.select", empno);
	}

	public List<CommuteVO> commuteselect(int empno) throws Exception {
		return sqlSession.selectList("commute.commuteselect",empno);
	}

	public List<CommuteVO> commuteToday(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("commute.commuteToday", map);
	}

}
