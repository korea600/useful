package kr.co.useful.schedule.persistence;

import java.util.List;

import kr.co.useful.schedule.domain.ScheduleVO;
import kr.co.useful.schedule.domain.SearchCriteria;

public interface ScheduleDAO {
	
	// ��ü����Ʈ
	public List<ScheduleVO> listCo() throws Exception;
	
	//��ȸ
	public ScheduleVO read(int serial)throws Exception;
	
	//�Է�
	public void create(ScheduleVO vo) throws Exception;
	
	//����
	public void update(ScheduleVO vo)throws Exception;
	
	//����
    public void delete(int serial)throws Exception;
    
    //��ü����Ʈ ��
    public int totalListCount() throws Exception;
	
	//�˻�����Ʈ
	public List<ScheduleVO> listSearch(SearchCriteria cri) throws Exception;
	
	//�˻�����Ʈ ��
	public int listSearchCount(SearchCriteria cri)throws Exception;

}
