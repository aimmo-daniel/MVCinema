package com.comnawa.mvcinema.sangjin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/support/*")
public class SupportController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
		
	@RequestMapping("main")
	public String support(){
		return "sangjin/support/main";
	}
	
	@RequestMapping("news")
	public String news(){
		return "sangjin/support/news";
	}
	
	@RequestMapping("faq")
	public String faq(){
		return "sangjin/support/faq";
	}
	
	@RequestMapping("one_to_one")
	public String one_to_one(){
		return "sangjin/support/one_to_one";
	}
	
	@RequestMapping("write")
	public String write(){
		return "sangjin/support/write";
	}
	
}
