package com.comnawa.mvcinema;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.comnawa.mvcinema.sangjin.model.dto.MovieDTO;
import com.comnawa.mvcinema.sangjin.service.MovieService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	MovieService movieService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping("sort.do")
	public ModelAndView sort(@RequestParam(defaultValue = "rank") String order_type, ModelAndView mav) {
		List<MovieDTO> list = movieService.movieList(order_type);
		mav.setViewName("sangjin/home/movielist");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list); //영화 목록
		map.put("order_type", order_type); //예매율순, 평점순, 관람객순
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("schedule.do")
	public ModelAndView schedule(ModelAndView mav) {
		List<MovieDTO> list = movieService.ScdmovieList();
		mav.setViewName("sangjin/home/movielist");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list); //영화 목록
		mav.addObject("map", map);
		return mav;
	}
	
	
	@RequestMapping("admin")
	public String admin(){
	  return "redirect:/admin/loginpage.do";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
}
