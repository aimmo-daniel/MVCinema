package com.comnawa.mvcinema.sungwon.controller.ticket;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.comnawa.mvcinema.sungwon.model.ticket.dto.TicketDTO;
import com.comnawa.mvcinema.sungwon.service.ticket.TicketService;

@Controller
@RequestMapping("/ticket/*")
public class TicketController {

	@Inject
	TicketService ticketService;
	
	@RequestMapping("quick_ticket_page.do")
	public ModelAndView quickticket_page(ModelAndView mav){
		List<TicketDTO> list = ticketService.movieList();
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		mav.setViewName("sungwon/ticket/reservation");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("sreenTime.do")
	public ModelAndView screenTime(@RequestParam int movie_idx,@RequestParam Date start_date,ModelAndView mav){
		Date end_date = new Date(start_date.getTime() + TimeUnit.DAYS.toMillis( 1 ));
		List<TicketDTO> list = ticketService.screen_time(start_date,end_date);
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(map.get("list"));
		map.put("list", list);
		mav.setViewName("sungwon/ticket/screen_time");
		mav.addObject("map",map);
		return mav;
	}
}
