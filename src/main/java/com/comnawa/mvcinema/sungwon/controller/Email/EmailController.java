package com.comnawa.mvcinema.sungwon.controller.Email;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comnawa.mvcinema.sungwon.service.email.EmailService;

@Controller
@RequestMapping("/mail/*")
public class EmailController {
	
	
	@Inject
	EmailService emailService;
	
	@ResponseBody
	@RequestMapping("sendMail.do")
	public String sendMail(@RequestParam String email) throws Exception {
		String rndNum = emailService.SignupMail(email);
		return rndNum;
	}
	
	@ResponseBody
	@RequestMapping("findpwdMail.do")
	public String findpwdMail(@RequestParam String email) throws Exception {
		String rndNum = emailService.findpwdMail(email);
		System.out.println(rndNum);
		return rndNum;
	}


}
