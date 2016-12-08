package kr.co.useful.meeting.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.service.MeetingService;

@RequestMapping("/meetingroom")
@Controller
public class MeetingController {

	@Inject
	private MeetingService service;

	// 첫화면---회의실 선택
	@RequestMapping(value = "/meetingroom", method = RequestMethod.GET)
	public void RoomList(Model model) throws Exception {
		model.addAttribute("list", service.rooms());
		// System.out.println(service.rooms());
	}

	// 회의실 등록폼
	@RequestMapping(value = "/room_Input", method = RequestMethod.GET)
	public void roomMakeGet() {

	}

	// 회의실 등록
	@RequestMapping(value = "/makeroom", method = RequestMethod.POST)
	public String roomMakePost(MeetingRoomVO vo, RedirectAttributes attr) throws Exception {
		service.regist(vo);
		// System.out.println("방 만들기");
		System.out.println("방 만들기" + vo);
		return "redirect:/meetingroom/meetingroom";
	}

	// 상세에서 수정
	@RequestMapping(value = "/roomchange", method = RequestMethod.POST)
	public String modifyPagePost(MeetingRoomVO vo, RedirectAttributes attr) throws Exception {

		System.out.println("수정진행 = " + vo);
		service.change(vo);

		return "redirect:/meetingroom/meetingroom";
	}

	// 회의실 삭제
	@RequestMapping("/removeroom")
	public String roomDelete(int roomno, RedirectAttributes attr) throws Exception {
		System.out.println(roomno);
		service.remove(roomno);
		return "redirect:/meetingroom/meetingroom";
	}

	// 각 회의실에 대한 리스트 ---> 호실이 같을때
	@RequestMapping(value = "/bookingList", method = RequestMethod.GET)
	public String bookingList(Model model) {
		System.out.println("안녕");

		return "/meetingroom/booking";
	}
	

	//예약리스트
	@RequestMapping("")
	public void myBooking() {

	}
	
/*
	// 예약하기
	@RequestMapping(value = "/reservation", method = RequestMethod.POST)
	public String reservation() {
		System.out.println("예약");

		return "redirect:/meetingroom/bookingList";
	}

	// 예약취소
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String reservationConcel() {
		System.out.println("예약취소");

		return "redirect:/meetingroom/bookingList";
	}

	// 예약 체크 --- 승인/거절 - 관리자
	@RequestMapping("")
	public void reservationCheck() {

	}

	// 예약 체크리스트 - 관리자
	@RequestMapping("")
	public void reservationCheckList() {

	}
	*/
	

}
