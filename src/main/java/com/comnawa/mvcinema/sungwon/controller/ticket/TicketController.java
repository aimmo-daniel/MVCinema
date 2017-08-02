package com.comnawa.mvcinema.sungwon.controller.ticket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ticket/*")
public class TicketController {

	@RequestMapping("quick_ticket_page.do")
	public String quickticket_page(){
		return "sungwon/ticket/reservation";
		
	}
}
