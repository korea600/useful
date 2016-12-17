package kr.co.useful.schedule.controller;

import java.util.List;
import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import kr.co.useful.schedule.domain.ScheduleVO;
import kr.co.useful.schedule.service.ScheduleService;

@RestController
@RequestMapping("/scheduleList")
public class ScheduleListController {

    @Inject
	private ScheduleService service;
 
	//모두
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public List<ScheduleVO> list(){
		//@PathVariable ==> 요청URL경로에 전달된 파라미터 데이터 얻기
		  
		List<ScheduleVO> list=null;
		try {
			list = service.listCo();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
	

