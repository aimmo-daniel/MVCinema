package com.comnawa.mvcinema;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

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
	
	//메인에 영화목록 출력
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model, ModelAndView mav,@RequestParam(defaultValue = "rank") String order_type) {
		logger.info("Welcome home! The client locale is {}.", locale);
		mav.setViewName("home");
		//뷰에 전달할 데이터 저장
		mav.addObject("list",movieService.movieList(order_type));
		return mav;
	}
	
	//예매순, 평점순, 관람객순
	@RequestMapping("sort.do")
	public ModelAndView list(@RequestParam(defaultValue = "rank") String order_type) throws Exception {
		List<MovieDTO> list = movieService.movieList(order_type);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home"); 
		Map<String, Object> map = new HashMap<>();
		map.put("list", list); //영화 목록
		map.put("order_type", order_type); //예매율순, 평점순, 관람객순
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("admin")
	public String admin(){
	  return "redirect:/admin/loginpage.do";
	}
	
}
