package kr.co.useful.error;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionController {
	@ExceptionHandler(Exception.class)
	public String commonError(Exception ex, Model model){
		model.addAttribute("exception", ex);
		ex.printStackTrace();
		return "/errorPage";
	}
}
