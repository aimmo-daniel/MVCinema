package com.comnawa.mvcinema.sungwon.controller.ticket;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitEmptyDTO;
import com.comnawa.mvcinema.insang.service.Insang_MovieService;
import com.comnawa.mvcinema.insang.service.TheaterService;
import com.comnawa.mvcinema.sungwon.model.ticket.dto.TicketDTO;
import com.comnawa.mvcinema.sungwon.service.ticket.TicketService;

@Controller
@RequestMapping("/ticket/*")
public class TicketController {

	@Inject
	TicketService ticketService;
	@Inject
	TheaterService theaterService;
	@Inject
	Insang_MovieService movieService;

	@RequestMapping("movie_ticket_page.do")
	public ModelAndView quickticket_page(@RequestParam(defaultValue = "0") int movie_idx, ModelAndView mav) {
		List<TicketDTO> list = ticketService.movieList();
		HashMap<String, Object> map = new HashMap<>();

		if (movie_idx > 0) {
			map.put("idx", movie_idx);
		}
		map.put("list", list);
		mav.setViewName("sungwon/ticket/m_reservation");
		mav.addObject("map", map);
		return mav;
	}

	@RequestMapping("date_ticket_page.do")
	public ModelAndView quick_dateticket_page(@RequestParam(defaultValue = "0") int movie_idx, ModelAndView mav) {
		List<TicketDTO> list = ticketService.movieList();
		HashMap<String, Object> map = new HashMap<>();

		if (movie_idx > 0) {
			map.put("idx", movie_idx);
		}
		map.put("list", list);
		mav.setViewName("sungwon/ticket/d_reservation");
		mav.addObject("map", map);
		return mav;
	}

	@RequestMapping("select_seat_page.do")
	public ModelAndView select_seat(@RequestParam String screen_idx, ModelAndView mav) {
		// 영화관 좌석 로드
		int idx = movieService.getScheduleDetail(Integer.parseInt(screen_idx)).getTheater_idx();
		for (TheaterDTO foo : theaterService.getTheaterList()) {
			if (foo.getIdx() == idx) {
				mav.addObject("dto", foo);
			}
		}
		int max = 0;
		for (TheaterSitDTO dto : theaterService.getTheaterSitList()) {
			max = (max < dto.getSeat_row()) ? dto.getSeat_row() : max;
		}
		for (TheaterSitDTO foo : theaterService.getTheaterSitList()) {
			if (foo.getIdx() == idx) {
				mav.addObject("theaterSitDTO", foo);
			}
		}
		List<TheaterSitEmptyDTO> listEmpty = theaterService.getTheaterSitEmpty();
		String theaterSitResult = "";
		for (TheaterSitEmptyDTO dto : listEmpty) {
			if (dto.getIdx() == idx) {
				theaterSitResult += dto.getSeat_empty() + ",";
			}
		}
		if (!theaterSitResult.equals("")) {
			theaterSitResult = theaterSitResult.substring(0, theaterSitResult.length() - 1);
		}
		mav.addObject("theater_sit_empty", listEmpty);
		mav.addObject("theater_sit_empty_result", theaterSitResult.equals("null") ? "" : theaterSitResult);
		mav.addObject("theaterSitMax", max);
		mav.addObject("idx", idx);

		// 이미 예매된 좌석 로드
		List<TicketDTO> list = ticketService.soldout_seat(Integer.parseInt(screen_idx));
		mav.addObject("list", list);

		// 페이지 이동
		mav.setViewName("sungwon/ticket/select_seat_people");
		mav.addObject("screen_idx", screen_idx);
		return mav;
	}

	@RequestMapping("screen_time.do")
	public ModelAndView screenTime(HttpServletRequest request, ModelAndView mav) {
		String start_date = request.getParameter("start_date");
		/*
		 * Date end_date = new Date(start_date.getTime() +
		 * TimeUnit.DAYS.toMillis( 1 ));
		 */

		String[] date = start_date.split("-");
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(date[0]), Integer.parseInt(date[1]), Integer.parseInt(date[2]));
		cal.add(Calendar.DATE, 1);
		String end_date = cal.get(Calendar.YEAR) + "-" + cal.get(Calendar.MONTH) + "-" + cal.get(Calendar.DATE);
		List<TicketDTO> list = ticketService.screen_time(start_date, end_date,
				Integer.parseInt(request.getParameter("movie_idx")));
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(map.get("list"));
		map.put("list", list);
		mav.setViewName("sungwon/ticket/screen_time");
		mav.addObject("map", map);
		return mav;
	}

	@RequestMapping("date_screen_time.do")
	public ModelAndView date_screenTime(HttpServletRequest request, ModelAndView mav) {
		String start_date = request.getParameter("start_date");

		String[] date = start_date.split("-");
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(date[0]), Integer.parseInt(date[1]), Integer.parseInt(date[2]));
		cal.add(Calendar.DATE, 1);
		String end_date = cal.get(Calendar.YEAR) + "-" + cal.get(Calendar.MONTH) + "-" + cal.get(Calendar.DATE);

		System.out.println("시작일" + start_date + "종료일" + end_date);

		List<TicketDTO> list = ticketService.date_screen_time(start_date, end_date);
		System.out.println("리스트" + list.toString());
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(map.get("list"));
		map.put("list", list);
		mav.setViewName("sungwon/ticket/screen_time2");
		mav.addObject("map", map);
		return mav;
	}

	@ResponseBody
	@RequestMapping("select_movie.do")
	public TicketDTO selectMovieInfo(@RequestParam String idx) {
		int movie_idx = Integer.parseInt(idx);
		TicketDTO dto = ticketService.selectMovieInfo(movie_idx);
		System.out.println("실행:" + dto.toString());
		return dto;
	}

	@ResponseBody
	@RequestMapping("select_time.do")
	public TicketDTO selectTime(@RequestParam String screen_idx) {
		TicketDTO dto = ticketService.selectTime(Integer.parseInt(screen_idx));
		System.out.println("실행2:" + dto.toString());
		return dto;
	}

	@ResponseBody
	@RequestMapping("select_movieTime.do")
	public TicketDTO selectMovieTime(@RequestParam String screen_idx) {
		TicketDTO dto = ticketService.selectMovieTime(Integer.parseInt(screen_idx));
		System.out.println("실행3" + dto.toString());
		return dto;
	}

	@ResponseBody
	@RequestMapping("payment.do")
	public JSONObject payment(HttpServletRequest request, ModelAndView mav) {

		JSONObject json = new JSONObject();
		TicketDTO dto = new TicketDTO();

		String t_userid = request.getParameter("t_userid");
		String t_title = request.getParameter("t_title");
		int t_age = Integer.parseInt(request.getParameter("t_age"));
		String t_start_time = request.getParameter("t_start_time");
		String t_theater = request.getParameter("t_theater");
		int t_people = Integer.parseInt(request.getParameter("t_people"));
		String t_seat[] = request.getParameterValues("t_seat");
		int t_price = Integer.parseInt(request.getParameter("t_price"));
		int screen_idx = Integer.parseInt(request.getParameter("screen_idx"));

		System.out.println(t_title);

		String tmpRnd = "";
		Random rnd = new Random();
		for (int i = 0; i < 4; i++) {
			tmpRnd += (char) (rnd.nextInt(25) + 65);
		}
		for (int i = 0; i < 6; i++) {
			tmpRnd += rnd.nextInt(10);
		}
		System.out.println(tmpRnd);
		dto.setT_userid(t_userid);
		dto.setT_title(t_title);
		dto.setT_age(t_age);
		dto.setT_start_time(t_start_time);
		dto.setT_theater(t_theater);
		dto.setT_people(t_people);
		dto.setT_price(t_price);
		dto.setScreen_idx(screen_idx);
		String t_seat_str = "";
		for (int i = 0; i < t_seat.length; i++) {
			t_seat_str += t_seat[i];
			if (i + 1 < t_seat.length) {
				t_seat_str += ",";
			}
		}
		dto.setT_seat(t_seat_str);
		dto.setT_serial_num(tmpRnd);
		System.out.println(dto.toString());
		int result = ticketService.insertTicket(dto);
		if (result > 0) {
			json.put("message", "success");
		} else {
			json.put("message", "fail");
		}

		return json;
	}

	@RequestMapping("payment_page.do")
	public String payment_page() {
		return "/sungwon/ticket/payment";
	}

	@ResponseBody
	@RequestMapping("myTicketList.do")
	public JSONObject myTicketList(String t_userid) {
		System.out.println("아이디:" + t_userid);
		JSONObject json = new JSONObject();
		List<TicketDTO> list = ticketService.myTicketList(t_userid + "");
		json.put("list", list);
		System.out.println(list.toString());
		return json;
	}

	@ResponseBody
	@RequestMapping("cancel.do")
	public JSONObject cancel(String ticket_idx, String screen_idx, String t_seat, String t_title) {
		JSONObject json = new JSONObject();
		TicketDTO dto = new TicketDTO();
		dto.setTicket_idx(Integer.parseInt(ticket_idx));
		dto.setScreen_idx(Integer.parseInt(screen_idx));
		dto.setT_seat(t_seat);
		dto.setT_title(t_title);
		int result = ticketService.cancel(dto);
		if (result > 0) {
			json.put("message", "success");
		} else {
			json.put("message", "fail");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("delete.do")
	public JSONObject delete(String t_serial_num) {
		JSONObject json = new JSONObject();
		int result = ticketService.delete_ticket(t_serial_num);
		if (result > 0) {
			json.put("message", "success");
		} else {
			json.put("message", "fail");
		}
		return json;
	}
	@ResponseBody
	@RequestMapping("date_select_time.do")
	public TicketDTO date_selectTime(@RequestParam String screen_idx){
		TicketDTO dto = ticketService.date_selectTime(Integer.parseInt(screen_idx));
		System.out.println("테스트"+dto.toString());
		return dto;
	}
}
