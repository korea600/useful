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
 
	//���
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public List<ScheduleVO> list(){
		//@PathVariable ==> ��ûURL��ο� ���޵� �Ķ���� ������ ���
		  
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
	

