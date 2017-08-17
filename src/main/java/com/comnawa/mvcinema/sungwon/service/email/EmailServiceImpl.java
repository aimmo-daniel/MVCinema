package com.comnawa.mvcinema.sungwon.service.email;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.sungwon.model.ticket.dto.TicketDTO;


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

	@Override
	public String findpwdMail(String email) {
		String rndNum = rndNum();
		
		// 메일 내용
		String recipient = email;
		String subject = "MVCinema 비밀번호 재설정 인증 메일입니다.";
		String body ="안녕하세요, 고객님 MVCiema 입니다.\n"
				+ "MVCiema 비밀번호 재설정 을 위해 이메일 인증을 진행합니다.\n"
				+ "비밀번호 재설정 을 완료하시려면 아래의 인증번호를 입력창에 입력해주세요 \n"
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

	@Override
	public void ticketMail(TicketDTO dto) {
		// 메일 내용
				String recipient = dto.getEmail();
				String subject = "MVCinema 예매 안내 메일입니다.";
				String body ="안녕하세요, 고객님 MVCiema 입니다.\n"
						+ "MVCiema 예매 안내메일입니다.\n"
						+ "영화제목 :"+ dto.getT_title() +"\n"
						+ "일시 :" +dto.getT_start_time()+"\n"
						+ "인원 :" +dto.getT_people() +"명 \n"
						+ "좌석 :" +dto.getT_seat() +"\n"
						+ "티켓 번호 : [ "+dto.getT_serial_num()+" ]"
						+ "입니다. 즐거운 관람 되세요 \n "
						+ "※주의 사항 인터넷 예매 취소는 상영 시작 30분 전까지만 가능합니다.";
				try {
					MimeMessage msg = mailsender.createMimeMessage();
					//메일 수신자 추가
					msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getEmail()));
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
	}

	@Override
	public String guestMail(String email) {
String rndNum = rndNum();
		
		// 메일 내용
		String recipient = email;
		String subject = "MVCinema 비회원 예매 인증 메일입니다.";
		String body ="안녕하세요, 고객님 MVCiema 입니다.\n"
				+ "MVCiema 비회원 예매를 위해 이메일 인증을 진행합니다.\n"
				+ "인증 완료하시려면 아래의 인증번호를 입력창에 입력해주세요 \n"
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
