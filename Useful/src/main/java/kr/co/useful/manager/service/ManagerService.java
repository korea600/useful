package kr.co.useful.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

public interface ManagerService {
	public List<Map<String, Object>> listAll()throws Exception;
	public List<Map<String, Object>> listSearch(String searchType,String keyword)throws Exception;
}
