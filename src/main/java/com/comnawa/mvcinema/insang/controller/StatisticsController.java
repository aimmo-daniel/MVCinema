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
    model.addAttribute("chart_member", chartService.getChartData("member"));
    model.addAttribute("chart_age", chartService.getChartData("age"));
    model.addAttribute("chart_movie", chartService.getChartData("movie"));
    model.addAttribute("movieList", movieService.getMovieList());
    return "/insang/submenu/sub_statistics/statistics_advance";
  }
  
  @RequestMapping("yeame2.do")
  public String yeame2(Model model){
    return null;
  }
  
  @RequestMapping("default.do")
  public String default1(String action, Model model){
    model.addAttribute("selected", action);
    return "/insang/submenu/sub_statistics/statistics_advance_result";
  }
  
  @ResponseBody
  @RequestMapping("searchDetail.do")
  public JSONObject searchDetail(String member, String age, String movie){
    //resultCount, resultAllCount
    return chartService.getSearchDetail(member, Integer.parseInt(age), Integer.parseInt(movie));
  }
  
}
