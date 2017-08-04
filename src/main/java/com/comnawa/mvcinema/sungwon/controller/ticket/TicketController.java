package com.comnawa.mvcinema.sungwon.controller.ticket;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthSeparatorUI;

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
	
	@RequestMapping("movie_ticket_page.do")
	public ModelAndView quickticket_page(@RequestParam(defaultValue="0") int movie_idx,ModelAndView mav){
		List<TicketDTO> list = ticketService.movieList();
		HashMap<String, Object> map = new HashMap<>();
		
		if(movie_idx > 0){
			System.out.println("실행"+movie_idx);
			map.put("idx", movie_idx);
		}
		map.put("list", list);
		mav.setViewName("sungwon/ticket/m_reservation");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("sreen_time.do")
	public ModelAndView screenTime(HttpServletRequest request,ModelAndView mav){
		System.out.println(request.getParameter("start_date"));
		String start_date = request.getParameter("start_date");
		/*Date end_date = new Date(start_date.getTime() + TimeUnit.DAYS.toMillis( 1 ));*/
		
		String[] date = start_date.split("-");
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(date[0]),Integer.parseInt(date[1]),Integer.parseInt(date[2]));
		cal.add(Calendar.DATE, 1);
		String end_date = cal.get(Calendar.YEAR)+"-"+cal.get(Calendar.MONTH)+"-"+cal.get(Calendar.DATE);
		
		List<TicketDTO> list = ticketService.screen_time(start_date,end_date,Integer.parseInt(request.getParameter("movie_idx")));
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(map.get("list"));
		map.put("list", list);
		mav.setViewName("sungwon/ticket/screen_time");
		mav.addObject("map",map);
		return mav;
	}
}
