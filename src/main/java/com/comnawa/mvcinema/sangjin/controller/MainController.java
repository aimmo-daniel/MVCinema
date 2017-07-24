package com.comnawa.mvcinema.sangjin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/*")
public class MainController {

	@RequestMapping("logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
}
