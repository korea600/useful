package kr.co.useful.meeting.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.useful.manager.domain.EmpVO;
import kr.co.useful.meeting.domain.MeetingRoomVO;
import kr.co.useful.meeting.domain.MeetingVO;
import kr.co.useful.meeting.domain.PageMaker;
import kr.co.useful.meeting.domain.SearchCriteria;
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
	}

	// 관리자 예약관리리스트
	@RequestMapping(value = "/bookingHistory", method = RequestMethod.GET)
	public void allList(@ModelAttribute("cri") SearchCriteria cri, String checked, Model model) throws Exception {
		if(checked!=null){
			if(checked.equals("선택")||checked.equals(""))
				checked=null;
		}
		model.addAttribute("list", service.allBooking2(checked, cri));
        
		PageMaker maker = new PageMaker();
	 	maker.setCri(cri);
	 	maker.setTotalCount(service.allListSearchCount(checked));
	 	model.addAttribute("pageMaker", maker);

	}

	// 내가 예약한 리스트
	@RequestMapping(value = "/myBooking", method = RequestMethod.GET)
	public void myList(@ModelAttribute("cri") SearchCriteria cri, String checked, Model model, HttpServletRequest req) throws Exception {
		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		int empno=evo.getEmpno();
		if(checked!=null){
			if(checked.equals("선택")||checked.equals(""))
				checked=null;
		}		
        
		model.addAttribute("list", service.myBooking2(cri, empno, checked));
         
        PageMaker maker = new PageMaker();
   	 	maker.setCri(cri);
   	 	maker.setTotalCount(service.myListSearchCount(checked, empno));
   	 	model.addAttribute("pageMaker", maker);
	}

	// 회의실 등록폼
	@RequestMapping(value = "/room_Input", method = RequestMethod.GET)
	public void roomMakeGet() {}

	// 회의실 등록
	@RequestMapping(value = "/makeroom", method = RequestMethod.POST)
	public String roomMakePost(MeetingRoomVO vo, RedirectAttributes attr) throws Exception {
		service.regist(vo);
		return "redirect:/meetingroom/meetingroom";
	}

	// 상세에서 수정
	@RequestMapping(value = "/roomchange", method = RequestMethod.POST)
	public String modifyPagePost(MeetingRoomVO vo, RedirectAttributes attr) throws Exception {
		service.change(vo);
		return "redirect:/meetingroom/meetingroom";
	}

	// 회의실 삭제
	@RequestMapping("/removeroom")
	public String roomDelete(int roomno, RedirectAttributes attr) throws Exception {
		service.remove(roomno);
		return "redirect:/meetingroom/meetingroom";
	}
	
	// 각 회의실에 대한 리스트 ---> 호실이 같을때
	@RequestMapping("/bookingList")
	public String bookingList(@ModelAttribute("cri") SearchCriteria cri, int roomno, Model model ) throws Exception {
		model.addAttribute("list", service.bookingOK(cri, roomno));
		model.addAttribute(roomno);

		PageMaker maker = new PageMaker();
	 	maker.setCri(cri);
	 	maker.setTotalCount(service.okListSearchCount(cri, roomno));
	 	model.addAttribute("pageMaker", maker);
	 	
		return "/meetingroom/booking";
	}

	// 예약하기
	@RequestMapping(value = "/booking_Input", method = RequestMethod.GET)
	public void reservationRoom(Model model, MeetingRoomVO vo, HttpServletRequest req) throws Exception {
		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		model.addAttribute("rooms", service.rooms());
		model.addAttribute("evo", evo);
	}

	// 예약누르기
	@RequestMapping(value = "/askBooking", method = RequestMethod.POST)
	public @ResponseBody String reservation(MeetingVO vo,  HttpServletRequest req) throws Exception {
		service.updateBooking(vo);
		return "ok";
	}

	// 예약취소
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String reservationConcel(int serial) throws Exception {
		service.removeBooking(serial);
		return "redirect:/meetingroom/bookingList";
	}

	//내용확인
	@RequestMapping("/content_Check")
	public void contentPresent(int serial, Model model)throws Exception{
		MeetingVO vo=service.oneBooking(serial);
		model.addAttribute("content", vo.getContent());
	}
	
	@RequestMapping(value = "/checkYes")
	public String checkYes(int serial) throws Exception {
		service.checkYes(serial);
		return "redirect:/meetingroom/bookingHistory";
	}

	@RequestMapping(value = "/checkNo")
	public String checkNo(int serial) throws Exception {
		service.checkNo(serial);
		return "redirect:/meetingroom/bookingHistory";
	}
	
	@RequestMapping("/deleteBooking")
	public String removeBooking(int serial)throws Exception{
		service.deletBooking(serial);
		return "redirect:/meetingroom/myBooking";
	}

}
