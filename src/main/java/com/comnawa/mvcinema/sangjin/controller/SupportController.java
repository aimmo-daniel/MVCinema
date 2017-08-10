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
	
}
