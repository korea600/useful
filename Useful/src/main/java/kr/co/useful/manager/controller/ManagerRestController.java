package kr.co.useful.manager.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.manager.persistence.ManagerDAO;
import kr.co.useful.manager.service.ManagerService;


@RestController
@RequestMapping("/manager")
public class ManagerRestController {
	
	@Inject
	private ManagerDAO dao;
	
	@RequestMapping("/list")
	public List<EmpVO> list(){
		List<EmpVO> list1 =null;
		try {
			list1=dao.emplist();
		} catch (Exception e) {
			
		}
		return list1;
	}
	@RequestMapping("/list2")
	public EmpVO list2(){
			EmpVO vo = new EmpVO();
			vo.setEmpno(1111);
			vo.setEname("È«±æµ¿");
			vo.setDeptno(1);
			vo.setPosition("»ç¿ø");
			vo.setPhone("01012345678");
		return vo;
	}
}
