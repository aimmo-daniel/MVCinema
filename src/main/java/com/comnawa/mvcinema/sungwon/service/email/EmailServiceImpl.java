package com.comnawa.mvcinema.sungwon.service.email;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Service
public class EmailServiceImpl implements EmailService {
	
	@Inject
	JavaMailSender mailsender; //메일 발송객체
	
	@Override
	public String rndNum() {
		String rndNum="";
		Random rnd = new Random();
		for(int i=0; i<7; i++){
			rndNum += rnd.nextInt(10);
		}
		return rndNum;
	}

	@Override
	public String SignupMail(String email) {
		String rndNum = rndNum();
		
		// 메일 내용
		String recipient = email;
		String subject = "MVCinema 가입 인증 메일입니다.";
		String body ="안녕하세요, 고객님 MVCiema 입니다.\n"
				+ "MVCiema 회원가입을 위해 이메일 인증을 진행합니다.\n"
				+ "회원가입을 완료하시려면 아래의 인증번호를 입력창에 입력해주세요 \n"
				+ "인증 번호 : [ "+rndNum+" ]";
		try {
			MimeMessage msg = mailsender.createMimeMessage();
			//메일 수신자 추가
			msg.addRecipient(RecipientType.TO, new InternetAddress(email));
			//메일 발신자 추가
			msg.addFrom(new InternetAddress[]{new InternetAddress("mvcinema@gmail.com","MVCinema")});
			//메일제목
			msg.setSubject(subject,"utf-8");
			//메일 본문
			msg.setText(body,"utf-8");
			//메일 발송
			mailsender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rndNum;
	}

}
