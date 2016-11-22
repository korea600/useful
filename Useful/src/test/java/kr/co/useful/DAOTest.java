package kr.co.useful;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.helpers.Loader;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.useful.manager.persistence.ManagerDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class DAOTest {
	private static final Logger logger = LoggerFactory.getLogger(DAOTest.class);
	@Inject
	private ManagerDAO dao;
	
	@Test
	public void list()throws Exception{
		System.out.println(dao.emplist());
	}
	
}
