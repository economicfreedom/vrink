package com.green.vrink.user.controller;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/mail")
@RequiredArgsConstructor
@Slf4j
public class MailController {
	
	@Autowired
    private final JavaMailSender javaMailSender;
    private static int number;

    
    public static void createNumber(){
        Random random = new Random();
        number = random.nextInt(888888) + 111111;
    }

    public void sendAuthEmail(String email) {
    	createNumber();
		MimeMessagePreparator preparatory = mimeMessage -> {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "UTF-8");
            String content = "";
            content += "<h3>안녕하세요. Vrink입니다.</h3>";
            content += "<p>아래코드를 입력해주세요.</p>";
            content += "<div style=\"border: 1px solid black; width: 200px; text-align: center;\">";
            content += "<h5>인증코드입니다</h5>";
            content += "<strong>"+number+"</strong>";
            content += "</div>";
                        
            helper.setTo(email);
            helper.setFrom("vrinkteam@gmail.com");
            helper.setSubject("Vrink 회원가입 인증코드입니다");
            
            helper.setText(content, true); //html 타입이므로, 두번째 파라미터에 true 설정
        };
        javaMailSender.send(preparatory);
	}

    @ResponseBody
    @PostMapping("/send")
    public int MailSend(@RequestBody Map<String, String> mail){
    	
    	sendAuthEmail(mail.get("mail"));

    	log.trace("number: " + number);
    	
    	return number;
    }

}