package kr.co.useful.meeting.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.domain.MeetingVO;
import kr.co.useful.meeting.service.MeetingService;

@RequestMapping("/meetingroom")
@Controller
public class MeetingController {

	@Inject
	private MeetingService service;

	// 첫화면---회의실 선택
	@RequestMapping(value = "/meetingroom", method = RequestMethod.GET)
	public void RoomList(Model model,  HttpServletRequest req) throws Exception {
		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		model.addAttribute("list", service.rooms());
		model.addAttribute("evo", evo);
		// System.out.println(service.rooms());
	}

	// 관리자 예약관리리스트
	@RequestMapping(value = "/bookingHistory", method = RequestMethod.GET)
	public void allList(Model model) throws Exception {
		model.addAttribute("list", service.allBooking());
		// System.out.println(service.rooms());
	}

	// 내가 예약한 리스트
	@RequestMapping(value = "/myBooking", method = RequestMethod.GET)
	public void myList(Model model, HttpServletRequest req) throws Exception {
		// EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		// int empno=evo.getEmpno();
		int empno = 1003;
		model.addAttribute("list", service.myBooking(empno));
		// System.out.println(service.rooms());
	}

	// 회의실 등록폼
	@RequestMapping(value = "/room_Input", method = RequestMethod.GET)
	public void roomMakeGet() {

	}

	// 회의실 등록
	@RequestMapping(value = "/makeroom", method = RequestMethod.POST)
	public String roomMakePost(MeetingRoomVO vo, RedirectAttributes attr) throws Exception {
		System.out.println("방 만들기" + vo);
		service.regist(vo);

		// System.out.println("방 만들기");
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
	@RequestMapping("/bookingList")
	public String bookingList(int roomno, Model model ) throws Exception {
		
		System.out.println("안녕");
	
		model.addAttribute(roomno);
		model.addAttribute("list", service.bookingEnd(roomno));
		System.out.println(model);
		return "/meetingroom/booking";
	}

	// 예약하기
	@RequestMapping(value = "/booking_Input", method = RequestMethod.GET)
	public void reservationRoom(Model model, MeetingRoomVO vo, HttpServletRequest req) throws Exception {
		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		model.addAttribute("rooms", service.rooms());
		model.addAttribute("evo", evo);
		System.out.println(service.rooms());

	}

	// 예약누르기
	@RequestMapping(value = "/askBooking", method = RequestMethod.POST)
	public @ResponseBody String reservation(MeetingVO vo) throws Exception {

		System.out.println("예약하기: " + vo);
		service.updateBooking(vo);

		// return "redirect:/meetingroom/myBooking";

		// redirect:/meetingroom/bookingList?roomno="+vo.getRoomno();
		return "ok";
	}

	// 예약취소
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String reservationConcel(int serial) throws Exception {
		System.out.println("예약취소");
		service.removeBooking(serial);

		return "redirect:/meetingroom/bookingList";
	}

	
	@RequestMapping("/test2")
	public void test1(){
		
		
	}
	
	@RequestMapping(value = "/checkYes")
	public String checkYes(int serial) throws Exception {
		service.checkYes(serial);
		System.out.println("승인인정");
		return "redirect:/meetingroom/bookingHistory";
	}

	@RequestMapping(value = "/checkNo")
	public String checkNo(int serial) throws Exception {
		service.checkNo(serial);
		System.out.println("거절");
		return "redirect:/meetingroom/bookingHistory";
	}

}
