package kr.co.useful.schedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;



import kr.co.useful.schedule.domain.PageMaker;
import kr.co.useful.schedule.domain.ScheduleVO;
import kr.co.useful.schedule.domain.SearchCriteria;
import kr.co.useful.schedule.service.ScheduleService;

@RestController
@RequestMapping("/scheduleList")
public class ScheduleListController {

    @Inject
	private ScheduleService service;
 
/*	//특정게시물에 대한 모든 댓글 목록요청
	@RequestMapping(value="", method=RequestMethod.GET)
	public Map<String, Object> pageMap(SearchCriteria cri){
		//@PathVariable ==> 요청URL경로에 전달된 파라미터 데이터 얻기
	   System.out.println("cri: "+ cri);
	   
        
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
	   Map<String,Object> map = new HashMap<>();
	   List<ScheduleVO> list=null;
	   try {
		  list = service.listSearchCriteria(cri);
		   map.put("pageMaker", pageMaker);
		   map.put("list", list);
	   
	   } catch (Exception e) {
		e.printStackTrace();
	   }
	   return map;
	}*/
	
	
	//모두
		@RequestMapping(value="/all", method=RequestMethod.GET)
		public List<ScheduleVO> list(){
			//@PathVariable ==> 요청URL경로에 전달된 파라미터 데이터 얻기
		  
		   List<ScheduleVO> list=null;
		   try {
			  list = service.listCo();
		   } catch (Exception e) {
			e.printStackTrace();
		   }
		   return list;
		}
		
	
	
    
}
	

