package kr.co.useful.organization.controller;

import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.useful.organization.domain.OrganizationVO;
import kr.co.useful.organization.service.OrganizationService;
@Controller
@RequestMapping("/organization")
public class OrganizationController {
	
	@Inject
	private OrganizationService service;
	
	@RequestMapping(value="/view")
	public void view_organization(Model m){
		List<List<OrganizationVO>> list = new ArrayList<>();
		List<OrganizationVO> dept = null;
		try {
			dept = service.getDeptList();
			for(int i=0;i<dept.size();i++){
				int deptno = dept.get(i).getDeptno();
				list.add(service.list_by_deptno(deptno));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		m.addAttribute("dept", dept);
		m.addAttribute("list", list);
	}
	
	@RequestMapping("/{empno}")
	public String view_details(@PathVariable int empno, Model m){
		OrganizationVO vo = null;
		try {
			vo = service.getDetails(empno);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		m.addAttribute("detail",vo);
		return "/organization/detail";
	}
}
