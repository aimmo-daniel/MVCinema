package com.comnawa.mvcinema.insang.controller;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comnawa.mvcinema.insang.service.Insang_MovieService;
import com.comnawa.mvcinema.insang.service.TheaterService;

@Controller
@RequestMapping("/tong/*")
public class StatisticsController {

  @Inject
  Insang_MovieService movieService;
  @Inject
  TheaterService theaterService;
  
  @RequestMapping("yeame1.do")
  public String yeame1(Model model){
    model.addAttribute("movieList", movieService.getMovieList());
    return "/insang/submenu/sub_statistics/statistics_advance";
  }
  
  @ResponseBody
  @RequestMapping("/yeame/getChartData.do")
  public JSONObject getChartData(){
  
    return null;
  }
  
}
