package com.comnawa.mvcinema.sangjin.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.comnawa.mvcinema.sangjin.model.dto.MovieDTO;
import com.comnawa.mvcinema.sangjin.model.dto.StillcutDTO;
import com.comnawa.mvcinema.sangjin.service.DetailService;
import com.comnawa.mvcinema.sangjin.service.MovieService;

@Controller
@RequestMapping("/info/*")
public class InfoController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	@Inject
	MovieService movieService;
	@Inject
	DetailService detailService;
	
	//영화 상세정보
	@RequestMapping("detail/{idx}")
	public ModelAndView view(@PathVariable int idx, ModelAndView mav) {
		mav.setViewName("sangjin/info/detail");
		mav.addObject("dto", movieService.movie_view(idx));
		return mav;
	}
	
	//탭1 - 줄거리 ajax
	@RequestMapping("content.do")
	public ModelAndView content(@RequestParam int idx, ModelAndView mav) {
		mav.setViewName("sangjin/info/content");
		mav.addObject("dto", movieService.movie_view(idx));
		return mav;
	}
	
	//탭2 - 배우목록 ajax
	@RequestMapping("actors.do")
	public ModelAndView actors(@RequestParam int idx, ModelAndView mav){
		mav.setViewName("sangjin/info/actors");
		mav.addObject("dto", movieService.movie_view(idx));
		return mav;
	}
	
	//탭3 - 스틸컷 ajax
	@RequestMapping("stillcut.do")
	public ModelAndView stillcut(@RequestParam int idx, ModelAndView mav){
		List<StillcutDTO> list = detailService.stillcut(idx);
		mav.setViewName("sangjin/info/stillcut");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list); //스틸컷
		mav.addObject("map", map);
		return mav;
	}
	
	//탭4 - 영화 예고편 ajax
	@RequestMapping("video.do")
	public ModelAndView video(@RequestParam int idx, ModelAndView mav) {
		mav.setViewName("sangjin/info/video");
		mav.addObject("dto", movieService.movie_view(idx));
		return mav;
	}
	

	
}
