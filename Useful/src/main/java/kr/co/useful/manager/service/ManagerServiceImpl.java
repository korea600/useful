package kr.co.useful.manager.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.manager.persistence.ManagerDAO;

@Service
class ManagerServiceImpl implements ManagerService {
	
	@Inject
	private ManagerDAO dao;
	
	@Override
	public List<Map<String, Object>> listAll() throws Exception {
		return dao.emplist();
	}

	@Override
	public List<Map<String, Object>> listSearch(String searchType,String keyword) throws Exception {
		return dao.emplistSearch(searchType, keyword);
	}
}
