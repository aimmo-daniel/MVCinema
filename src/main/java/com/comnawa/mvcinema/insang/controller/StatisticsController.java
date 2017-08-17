package com.comnawa.mvcinema.insang.controller;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comnawa.mvcinema.insang.service.ChartService;
import com.comnawa.mvcinema.insang.service.Insang_MovieService;
import com.comnawa.mvcinema.insang.service.TheaterService;

/*
 * 통계, 차트를 위한 컨트롤러
 */

@Controller
@RequestMapping("/tong/*")
public class StatisticsController {

  @Inject
  Insang_MovieService movieService;
  @Inject
  TheaterService theaterService;
  @Inject
  ChartService chartService;
  
  //예매율 검색 페이지
  @RequestMapping("yeame1.do")
  public String yeame1(Model model){
    model.addAttribute("movieList", movieService.getMovieList());
    return "/insang/submenu/sub_statistics/statistics_advance";
  }
  
  @RequestMapping("yeame2.do")
  public String yeame2(Model model){
    model.addAttribute("movieList", movieService.getMovieList());
    return "/insang/submenu/sub_statistics/statistics_sales";
  }
  
  @ResponseBody
  @RequestMapping("default1.do")
  public JSONObject default1(){
    return chartService.getChartData("member");
  }
  
  @ResponseBody
  @RequestMapping("default2.do")
  public JSONObject default2(){
    return null;
  }
  
  @ResponseBody
  @RequestMapping("default3.do")
  public JSONObject default3(){
    return null;
  }
  
}
