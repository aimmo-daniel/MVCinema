package com.comnawa.mvcinema.sungwon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {

	@RequestMapping("login.do")
	public String login_page(){
		return "sungwon/member/login";
	}
	
}
