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

import kr.co.useful.manager.domain.CommuteVO;
import kr.co.useful.manager.persistence.ManagerDAO;
import kr.co.useful.manager.service.ManagerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class DAOTest {
	private static final Logger logger = LoggerFactory.getLogger(DAOTest.class);
	
	@Inject
	private ManagerDAO dao;
	
	@Inject
	private ManagerService service;
	//@Test
	public void list()throws Exception{
		System.out.println(dao.emplist());
	}
	@Test
	public void listSearch()throws Exception{
		//System.out.println(dao.emplistSearch("dept", "10"));
//		System.out.println(dao.emp_select(1000));
//		dao.emp_delete(2000);
//		
		Map<String, Object> map = new HashMap<>();
<<<<<<< HEAD
//		map.put("deptno", 10);
		map.put("startdate", "20161128");
		map.put("enddate", "20161129");
//		
//		List<CommuteVO> vo = dao.commute_emplist(map);
//		System.out.println(vo.get(0).toString());
//		
//		System.out.println(dao.search_empno_fromEname("ÀÌ±æÀç"));
//		System.out.println(dao.search_empnolist(10));
=======
		map.put("empno", 1002);

		map.put("startdate", "20161128"); 

		map.put("enddate", "20161128");
>>>>>>> branch 'master' of https://github.com/korea600/useful.git
		
		
//		System.out.println( dao.commute_emplist_deptno(map));
		
		System.out.println(service.commute_list_all(map));
		
	}
	
	
}
