package kr.co.useful;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goToLogin() {
		return "redirect:/login/Login";
	}
	@RequestMapping("/session_lost")
	public String sessionLost(){
		return "session_lost";
	}
}
