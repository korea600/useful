package kr.co.useful.schedule.persistence;

import java.util.List;

import kr.co.useful.schedule.domain.ScheduleVO;
import kr.co.useful.schedule.domain.SearchCriteria;



public interface ScheduleDAO {
	
	// 전체리스트
	public List<ScheduleVO> listCo() throws Exception;
	
	//조회
	public ScheduleVO read(int serial)throws Exception;
	
	//입력
	public void create(ScheduleVO vo) throws Exception;
	
	//수정
	public void update(ScheduleVO vo)throws Exception;
	
	//삭제
    public void delete(int serial)throws Exception;
    
    //전체리스트 수
    public int totalListCount() throws Exception;
	
	//검색리스트
	public List<ScheduleVO> listSearch(SearchCriteria cri) throws Exception;
	
	
	//검색리스트 수
	public int listSearchCount(SearchCriteria cri)throws Exception;

}
