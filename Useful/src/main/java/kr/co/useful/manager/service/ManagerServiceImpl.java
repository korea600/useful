package kr.co.useful.manager.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.manager.domain.CommuteVO;
import kr.co.useful.manager.domain.Commute_DeptVO;
import kr.co.useful.manager.domain.Commute_MonthlyVO;
import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.manager.domain.LeaveVO;
import kr.co.useful.manager.domain.SalaryVO;
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
	
	@Override
	public void emp_Insert(EmpVO vo) throws Exception {
		dao.emp_Insert(vo);
	}
	
	@Override
	public EmpVO emp_select(int empno) throws Exception {
		return dao.emp_select(empno);
	}
	
	@Override
	public void emp_update(EmpVO vo) throws Exception {
		dao.emp_update(vo);
	}
	
	@Override
	public void emp_delete(int empno) throws Exception {
		dao.emp_delete(empno);
	}
	@Override
	public List<CommuteVO> commute_list_all(Map<String, Object> map) throws Exception {
		
		return  time_Division(dao.commute_emplist_all(map));
	}
	
	@Override
	public List<CommuteVO> commute_list_empno(Map<String,Object> map) throws Exception {

		return  time_Division(dao.commute_emplist_empno(map));
	}
	
	@Override
	public List<CommuteVO> commute_list_dept(Map<String,Object> map) throws Exception {
		return  time_Division(dao.commute_emplist_deptno(map));
	}
	
	@Override
	public List<CommuteVO> commute_list_ename(Map<String,Object> map) throws Exception {
		return  time_Division(dao.commute_emplist_ename(map));
	}
	@Override
	public void commute_update(Map<String, Object> map) throws Exception {
		dao.commute_update(map);
	}
	

	@Override
	public List<Commute_DeptVO> commute_dept_list(Map<String, Object> map) throws Exception {
		List<Integer> list2 = dao.search_ename_from_dept(Integer.parseInt((String) map.get("deptno")));
		List<Commute_DeptVO> dept_List = new ArrayList<>();

		for(int i=0;i<list2.size();i++){
			Map<String,Object> newMap = new HashMap<>();
			newMap.put("login", map.get("login"));
			newMap.put("empno",list2.get(i));
			System.out.println(newMap);
			List<CommuteVO> list = dao.commute_dept_list(newMap);
			int attendance=0,late=0,absence=0,vacation=0,businessTrip=0,earlyLeave=0;
			for(int j=0;j<list.size();j++){
				switch (list.get(j).getChecked()) {
					case "Ãâ¼®":
						attendance++;
						break;
					case "Áö°¢":
						late++;
						break;
					case "°á±Ù":
						absence++;
						break;
					case "ÈÞ°¡":
						vacation++;
						break;
					case "ÃâÀå":
						businessTrip++;
						break;
					case "Á¶Åð":
						earlyLeave++;
						break;
					default:
						break;
					}
			}
			EmpVO empvo = dao.emp_select_include_dname(list2.get(i));
			Commute_DeptVO vo = new Commute_DeptVO(empvo.getDname(),empvo.getEname(), attendance, late, absence, vacation, businessTrip, earlyLeave); 
			dept_List.add(vo);

		}
		return dept_List;
	}
	
	@Override
	public List<Commute_MonthlyVO> commute_monthly_list(Map<String, Object> map) throws Exception {
//		List<Integer> dept_member_list = dao.search_ename_from_dept(Integer.parseInt((String)map.get("deptno")));
		List<Commute_MonthlyVO> Monthly_List = new ArrayList<>();
		 Calendar cal= Calendar.getInstance ();
		 SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
//		System.out.println(dept_member_list);
		String login_yyyydd= (String) map.get("login");
		String login_month= login_yyyydd.substring(4,6);
		int login_day=0;
		if(login_month.equals("01")||login_month.equals("03")||login_month.equals("05")||login_month.equals("07")||login_month.equals("08")||login_month.equals("10")||login_month.equals("12")){
			login_day=31;
		}else{
			login_day=30;
		}
		
			for(int i=1;i<=login_day;i++){
				Map<String,Object> newMap = new HashMap<>();
				String login="";
				if(i<10){
					login=login_yyyydd+"0"+i;
				}else{
					login=login_yyyydd+i+"";
				}
			
				newMap.put("login", login);
				newMap.put("deptno",Integer.parseInt((String)map.get("deptno")));
				List<CommuteVO> list = dao.commute_monthly_list(newMap);
//				System.out.println(login);
//				System.out.println(list);
				int attendance=0,late=0,absence=0,vacation=0,businessTrip=0,earlyLeave=0;
				for(int j=0;j<list.size();j++){
					switch (list.get(j).getChecked()) {
					case "Ãâ¼®":
						attendance++;
						break;
					case "Áö°¢":
						late++;
						break;
					case "°á±Ù":
						absence++;
						break;
					case "ÈÞ°¡":
						vacation++;
						break;
					case "ÃâÀå":
						businessTrip++;
						break;
					case "Á¶Åð":
						earlyLeave++;
						break;
					default:
							break;
						}
				}
				Date to= transFormat.parse(login);
				cal.setTime(to);
				int whatday = cal.get(Calendar.DAY_OF_WEEK) ;
				 
				int total=attendance+late+absence+vacation+businessTrip+earlyLeave;
				int acc=absence+vacation+businessTrip+earlyLeave;
				Commute_MonthlyVO vo = new Commute_MonthlyVO(login, whatday, attendance, late, absence, vacation, businessTrip, earlyLeave, total, acc);
				Monthly_List.add(vo);
		}
		return Monthly_List;
	}
	
	@Override
	public List<LeaveVO> leave_list_search(Map<String, Object> map) throws Exception {
		return dao.leave_list_search(map);
	}
	
	@Override
	public void leave_List_Update(Map<String, Object> map) throws Exception {
		dao.leave_List_Update(map);
	}
	
	@Override
	public List<CommuteVO> commute_Monthly_search_oneday(Map<String, Object> map) throws Exception {
		return time_Division(dao.commute_Monthly_search_oneday(map));
	}
	
	@Override
	public List<EmpVO> emp_search(Map<String, Object> map) throws Exception {
		return dao.emp_search(map);
	}

	
	@Override
	public List<SalaryVO> salary_List(Map<String, Object> map) throws Exception {
		return dao.salary_List(map);
	}
	
	@Override
	public void salary_Insert(SalaryVO vo) throws Exception {
		dao.salary_Insert(vo);
	}
	@Override
	public SalaryVO salary_update_form(int serial) throws Exception {
		return dao.salary_update_form(serial);
	}
	@Override
	public void salary_Update(SalaryVO vo) throws Exception {
		dao.salary_Update(vo);
	}
	
	@Override
	public void salary_Delete(int serial) throws Exception {
		dao.salary_Delete(serial);
	}
	@Override
	public void add_Sal_NextMonth() throws Exception {
		dao.add_Sal_NextMonth();
	} 
	
	public List<CommuteVO> time_Division(List<CommuteVO> list){
		 for(int i=0;i<list.size();i++){
			 list.get(i).setLogin_Time(list.get(i).getLogin().substring(11, 16));
			 list.get(i).setLogin(list.get(i).getLogin().substring(0, 10));
			 if(list.get(i).getLogout()!=null&&list.get(i).getLogout()!=""){
				 list.get(i).setLogout_Time(list.get(i).getLogout().substring(11, 16));
				 list.get(i).setLogout(list.get(i).getLogout().substring(0, 10));
			 }
		 }
		return list;
	}
	
}
