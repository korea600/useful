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

	public void regist(ScheduleVO vo) throws Exception {
		dao.create(vo);
	}

	public void change(ScheduleVO vo) throws Exception {
		dao.update(vo);
	}

	public void remove(int serial) throws Exception {
		dao.delete(serial);
	}

	public ScheduleVO read(int serial) throws Exception {
		return dao.read(serial);
	}

	public List<ScheduleVO> listCo() throws Exception {
		return dao.listCo();
	}

	public int totalListCount() throws Exception {
		return dao.totalListCount();
	}

	public List<ScheduleVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
