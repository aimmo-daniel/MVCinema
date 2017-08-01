package com.comnawa.mvcinema.sangjin.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.comnawa.mvcinema.sangjin.service.MovieService;

@Controller
@RequestMapping("/info/*")
public class InfoController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	@Inject
	MovieService movieService;

	@RequestMapping("detail/{idx}")
	public ModelAndView view(@PathVariable int idx, ModelAndView mav) {
		logger.info("detail:"+idx);
		mav.setViewName("sangjin/info/detail");
		mav.addObject("dto", movieService.movie_view(idx));
		return mav;
	}
	
}
