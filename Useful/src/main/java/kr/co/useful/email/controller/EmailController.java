package kr.co.useful.email.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.useful.email.domain.Email;
import kr.co.useful.email.service.EmailSender;

@Controller
@RequestMapping("/email")
public class EmailController {
    @Autowired
    private EmailSender emailSender;
     
    @RequestMapping("/send")
    public @ResponseBody String sendEmailAction () throws Exception {
    	
        Email email = new Email();
        
        int num = EmailSender.generateNumber(6);
        
        String reciver = "boxer1992@naver.com"; //��������� �̸����Դϴ�.
        String subject = "�ӽ� ��й�ȣ�� �߼��ص帳�ϴ�.";
        String content = "�ӽ� ��й�ȣ��" + num + "�Դϴ�.";
         
        email.setReciver(reciver);
        email.setSubject(subject);
        email.setContent(content);
        emailSender.SendEmail(email);
         
        return "SUCCESS";
    }
}
