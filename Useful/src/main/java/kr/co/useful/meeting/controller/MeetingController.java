package kr.co.useful.meeting.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public void RoomList(Model model) throws Exception {
		model.addAttribute("list", service.rooms());
		// System.out.println(service.rooms());
	}
	

	// 관리자 예약관리리스트
	@RequestMapping(value = "/bookingHistory", method = RequestMethod.GET)
	public void allList(Model model) throws Exception {
		model.addAttribute("list", service.allBooking());
		// System.out.println(service.rooms());
	}


	//내가 예약한 리스트
	@RequestMapping(value = "/myBooking", method = RequestMethod.GET)
	public void myList(Model model,  HttpServletRequest req) throws Exception {
		//EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		//int empno=evo.getEmpno();
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
	@RequestMapping("/bookingList")
	public String bookingList(int roomno, Model model) throws Exception{
		System.out.println("안녕");
		model.addAttribute(roomno);
       model.addAttribute("list",service.bookingEnd(roomno));
		System.out.println(model);
       return "/meetingroom/booking";
	}
	

	//예약하기
	@RequestMapping(value = "/booking_Input", method = RequestMethod.GET)
	public void reservationRoom(Model model, MeetingRoomVO vo)throws Exception {
          
		model.addAttribute("rooms",service.rooms());
          System.out.println(service.rooms());

	}
	

	// 예약누르기
	@RequestMapping(value = "/askBooking", method = RequestMethod.POST)
	public String reservation(MeetingVO vo) throws Exception{
	
        //service.updateBooking(vo);
        System.out.println(vo);
        
		return "redirect:/meetingroom/bookingList";
	}

	// 예약취소
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String reservationConcel(int serial)throws Exception {
		System.out.println("예약취소");
		service.removeBooking(serial);

		return "redirect:/meetingroom/bookingList";
	}

/*	// 예약 체크 --- 승인/거절 - 관리자
	@RequestMapping("/checkNo")
	public void reservationCheckNo(int serial)throws Exception {
         service.checkNo(serial);
	}
	
	
	@RequestMapping("/checkYes")
	public void reservationCheckYes(int serial)throws Exception {
         service.checkYes(serial);
	}

*/

	

}
