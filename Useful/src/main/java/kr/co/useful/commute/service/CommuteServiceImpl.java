package kr.co.useful.commute.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.useful.manager.domain.CommuteVO;
import kr.co.useful.commute.persistence.CommuteDAO;

@Service
public class CommuteServiceImpl implements CommuteService{
	
	@Inject
	private CommuteDAO dao;
	
	public boolean insert(int empno) throws Exception {
		if(dao.select(empno) == 0){	
			dao.insert(empno);
			return true;
		}
		return false;
	}

	public boolean update(int empno) throws Exception {
		if(dao.select(empno) != 0){
			dao.update(empno);
			return true;
		}
		return false;
	}

	public List<CommuteVO> commuteselect(int empno) throws Exception {
		return time_Division(dao.commuteselect(empno));
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

	public List<CommuteVO> commuteToday(Map<String, Object> map) throws Exception {
		return time_Division(dao.commuteToday(map));
	}

}
