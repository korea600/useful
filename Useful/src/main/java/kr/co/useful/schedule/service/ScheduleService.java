package kr.co.useful.schedule.service;

import java.util.List;

import kr.co.useful.schedule.domain.ScheduleVO;
import kr.co.useful.schedule.domain.SearchCriteria;

public interface ScheduleService {
	
	public void regist(ScheduleVO vo)throws Exception;
	public void change(ScheduleVO vo)throws Exception;
	public void remove(int serial)throws Exception;
	public ScheduleVO read(int serial)throws Exception;
	public List<ScheduleVO> listCo()throws Exception;
	public int totalListCount() throws Exception;
	
    //�˻�� ���� ����Ʈ ��ȸ
    public List<ScheduleVO> listSearchCriteria(SearchCriteria cri)throws Exception;
    public int listSearchCount(SearchCriteria cri)throws Exception;
	

}
