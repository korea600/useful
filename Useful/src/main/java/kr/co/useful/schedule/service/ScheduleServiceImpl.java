package kr.co.useful.schedule.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.schedule.domain.ScheduleVO;
import kr.co.useful.schedule.domain.SearchCriteria;
import kr.co.useful.schedule.persistence.ScheduleDAO;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Inject
	private ScheduleDAO dao;

	@Override
	public void regist(ScheduleVO vo) throws Exception {
		
		dao.create(vo);

	}

	@Override
	public void change(ScheduleVO vo) throws Exception {
		
		dao.update(vo);

	}

	@Override
	public void remove(int serial) throws Exception {
		dao.delete(serial);

	}

	@Override
	public ScheduleVO read(int serial) throws Exception {
		return dao.read(serial);
	}

	@Override
	public List<ScheduleVO> listCo() throws Exception {
		
		return dao.listCo();
	}

	@Override
	public int totalListCount() throws Exception {
		
		return dao.totalListCount();
	}

	@Override
	public List<ScheduleVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}

}
