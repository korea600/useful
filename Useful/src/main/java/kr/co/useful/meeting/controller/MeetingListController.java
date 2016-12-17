package kr.co.useful.meeting.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.useful.meeting.domain.MeetingVO;
import kr.co.useful.meeting.service.MeetingService;


@RestController
@RequestMapping("/meeting")
public class MeetingListController {
	
	@Inject
	private MeetingService service;
	
	@RequestMapping(value="/all/{roomno}", method=RequestMethod.GET)
	public List<MeetingVO> list(@PathVariable("roomno") int roomno, Model model){
		//@PathVariable ==> ��ûURL��ο� ���޵� �Ķ���� ������ ���
	  
	   List<MeetingVO> list=null;
	   try {
		 list = service.bookingEnd(roomno);
		 System.out.println("ȸ�ǽǿ��� �޷�="+roomno);
		  
	   } catch (Exception e) {
		e.printStackTrace();
	   }
	   return list;
	}

}
