package com.comnawa.mvcinema.sungwon.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping("findAccount_page.do")
	public String findAccount() {
		return "sungwon/member/find_account";
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
	
	@ResponseBody
	@RequestMapping("signup.do")
	public JSONObject signUp(@ModelAttribute MemberDTO dto) {
		JSONObject json = new JSONObject();
		try {
			memberService.signup(dto);
			json.put("message", "success");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("message", "fail");
		}
		return json;
	}
	
	@RequestMapping("login.do")
	public ModelAndView login(@ModelAttribute MemberDTO dto, HttpSession session) {
		System.out.println("비번:" + dto.getPasswd());
		boolean result = memberService.login(dto, session);
		ModelAndView mav = new ModelAndView();
		if (result) {
			mav.setViewName("home");
			mav.addObject("message", "success");
		} else {
			mav.setViewName("sungwon/member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}
}
