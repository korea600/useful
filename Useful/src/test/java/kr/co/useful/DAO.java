package kr.co.useful;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.helpers.Loader;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.useful.board.domain.SearchCriteria;
import kr.co.useful.manager.domain.CommuteVO;
import kr.co.useful.manager.persistence.ManagerDAO;
import kr.co.useful.manager.service.ManagerService;
import kr.co.useful.note.persistence.SendDAO;
import kr.co.useful.note.service.SendService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class DAO {
	private static final Logger logger = LoggerFactory.getLogger(DAO.class);
	
	@Inject
	private SendDAO dao;
	
	@Inject
	private SendService service;
	@Test
	public void list()throws Exception{
		SearchCriteria cri=new SearchCriteria();
		cri.setKeyword("전성원");
		cri.setSearchType("ename");
		System.out.println(dao.find_user_note(cri));
	};

		
		

	
}
