package kr.co.useful.meeting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/meetingroom")
@Controller
public class MeetingController {
	

	@RequestMapping(value ="/booking", method=RequestMethod.GET)
	public void bookingList() {
		System.out.println("¿¹¾à");
	}
	

}
