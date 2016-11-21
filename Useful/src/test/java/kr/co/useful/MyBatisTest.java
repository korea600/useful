package kr.co.useful;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

// SqlSession객체 확인 (iBatis의 SqlMapClient 역할)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context-l.xml"})
public class MyBatisTest {
	// 주입을 통한 멤버 초기화 (from root-context.xml)
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory(){
		System.out.println("SqlSessionFactory : "+sqlFactory);
	}
	@Test
	public void testSession(){
		try(SqlSession session = sqlFactory.openSession()){
			System.out.println("Session : "+session);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
