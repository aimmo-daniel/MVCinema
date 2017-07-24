package com.comnawa.mvcinema.sungwon.controller.member;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;
import com.comnawa.mvcinema.sungwon.service.member.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	@RequestMapping("login_page.do")
	public String login_page(){
		return "sungwon/member/login";
	}
	
	@RequestMapping("signup_page.do")
	public String signup() {
		return "sungwon/member/signup";
	}
	
	@ResponseBody
	@RequestMapping("checkid.do")
	public MemberDTO checkId(@RequestParam String userid) {
		String name = memberService.checkid(userid);
		logger.info("중복확인 :"+name);
		MemberDTO dto = new MemberDTO();
		dto.setName(name);
		return dto;
	}
	
	@ResponseBody
	@RequestMapping("checkemail.do")
	public MemberDTO checkEmail(@RequestParam String email) {
		String name = memberService.checkemail(email);
		MemberDTO dto = new MemberDTO();
		dto.setName(name);
		return dto;
	}
}
