package com.comnawa.mvcinema.sungwon.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {

	@RequestMapping("login_page.do")
	public String login_page(){
		return "sungwon/member/login";
	}
	
	@RequestMapping("signup_page.do")
	public String signup() {
		return "sungwon/member/signup";
	}
	
}
