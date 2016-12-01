package kr.co.useful.email.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.useful.email.domain.Email;
import kr.co.useful.email.service.EmailSender;

@Controller
@RequestMapping("/email")
public class EmailController {
    @Autowired
    private EmailSender emailSender;
     
    @RequestMapping("/send")
    public String sendEmailAction () throws Exception {
    	
        Email email = new Email();
        
        int num = EmailSender.generateNumber(6);
        
        String reciver = "boxer1992@naver.com"; //받을사람의 이메일입니다.
        String subject = "임시 비밀번호를 발송해드립니다.";
        String content = "임시 비밀번호는" + num + "입니다.";
      
         
        email.setReciver(reciver);
        email.setSubject(subject);
        email.setContent(content);
        emailSender.SendEmail(email);
         
        return "login/Re_Login";
    }
}
