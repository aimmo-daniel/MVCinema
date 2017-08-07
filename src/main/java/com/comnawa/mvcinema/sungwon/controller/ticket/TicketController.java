package com.comnawa.mvcinema.sungwon.controller.ticket;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
			map.put("idx", movie_idx);
		}
		map.put("list", list);
		mav.setViewName("sungwon/ticket/m_reservation");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("select_seat_page.do")
	public ModelAndView select_seat(@RequestParam String screen_idx , ModelAndView mav){
		mav.setViewName("sungwon/ticket/select_seat_people");
		mav.addObject("screen_idx",screen_idx);
		return mav;
	}
	
	
	@RequestMapping("sreen_time.do")
	public ModelAndView screenTime(HttpServletRequest request,ModelAndView mav){
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
	
	@ResponseBody
	@RequestMapping("select_movie.do")
	public TicketDTO selectMovieInfo(@RequestParam String idx){
		int movie_idx = Integer.parseInt(idx);
		TicketDTO dto = ticketService.selectMovieInfo(movie_idx);
		System.out.println("실행:" +dto.toString());
		return dto;
	}
	
	@ResponseBody
	@RequestMapping("select_time.do")
	public TicketDTO selectTime(@RequestParam String screen_idx){
		TicketDTO dto = ticketService.selectTime(Integer.parseInt(screen_idx));
		System.out.println("실행2:" +dto.toString());
		return dto;
	}
}
