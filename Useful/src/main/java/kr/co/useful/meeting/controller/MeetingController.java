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

	// ùȭ��---ȸ�ǽ� ����
	@RequestMapping(value = "/meetingroom", method = RequestMethod.GET)
	public void RoomList(Model model,  HttpServletRequest req) throws Exception {
		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		model.addAttribute("list", service.rooms());
		model.addAttribute("evo", evo);
	}

	// ������ �����������Ʈ
	@RequestMapping(value = "/bookingHistory", method = RequestMethod.GET)
	public void allList(@ModelAttribute("cri") SearchCriteria cri, String checked, Model model) throws Exception {
		if(checked!=null){
			if(checked.equals("����")||checked.equals(""))
				checked=null;
		}
		model.addAttribute("list", service.allBooking2(checked, cri));
        
		PageMaker maker = new PageMaker();
	 	maker.setCri(cri);
	 	maker.setTotalCount(service.allListSearchCount(checked));
	 	model.addAttribute("pageMaker", maker);

	}

	// ���� ������ ����Ʈ
	@RequestMapping(value = "/myBooking", method = RequestMethod.GET)
	public void myList(@ModelAttribute("cri") SearchCriteria cri, String checked, Model model, HttpServletRequest req) throws Exception {
		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		int empno=evo.getEmpno();
		if(checked!=null){
			if(checked.equals("����")||checked.equals(""))
				checked=null;
		}		
        
		model.addAttribute("list", service.myBooking2(cri, empno, checked));
         
        PageMaker maker = new PageMaker();
   	 	maker.setCri(cri);
   	 	maker.setTotalCount(service.myListSearchCount(checked, empno));
   	 	model.addAttribute("pageMaker", maker);
	}

	// ȸ�ǽ� �����
	@RequestMapping(value = "/room_Input", method = RequestMethod.GET)
	public void roomMakeGet() {}

	// ȸ�ǽ� ���
	@RequestMapping(value = "/makeroom", method = RequestMethod.POST)
	public String roomMakePost(MeetingRoomVO vo, RedirectAttributes attr) throws Exception {
		service.regist(vo);
		return "redirect:/meetingroom/meetingroom";
	}

	// �󼼿��� ����
	@RequestMapping(value = "/roomchange", method = RequestMethod.POST)
	public String modifyPagePost(MeetingRoomVO vo, RedirectAttributes attr) throws Exception {
		service.change(vo);
		return "redirect:/meetingroom/meetingroom";
	}

	// ȸ�ǽ� ����
	@RequestMapping("/removeroom")
	public String roomDelete(int roomno, RedirectAttributes attr) throws Exception {
		service.remove(roomno);
		return "redirect:/meetingroom/meetingroom";
	}
	
	// �� ȸ�ǽǿ� ���� ����Ʈ ---> ȣ���� ������
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

	// �����ϱ�
	@RequestMapping(value = "/booking_Input", method = RequestMethod.GET)
	public void reservationRoom(Model model, MeetingRoomVO vo, HttpServletRequest req) throws Exception {
		EmpVO evo = (EmpVO) req.getSession().getAttribute("LoginUser");
		model.addAttribute("rooms", service.rooms());
		model.addAttribute("evo", evo);
	}

	// ���ഩ����
	@RequestMapping(value = "/askBooking", method = RequestMethod.POST)
	public @ResponseBody String reservation(MeetingVO vo,  HttpServletRequest req) throws Exception {
		service.updateBooking(vo);
		return "ok";
	}

	// �������
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String reservationConcel(int serial) throws Exception {
		service.removeBooking(serial);
		return "redirect:/meetingroom/bookingList";
	}

	//����Ȯ��
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
