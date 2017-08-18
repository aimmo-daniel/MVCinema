package com.comnawa.mvcinema.insang.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
  public String yeame2(){
    return "/insang/submenu/sub_statistics/statistics_sales";
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
  
  @ResponseBody
  @RequestMapping("monthlySalesChart.do")
  public List<Map<String, Object>> monthlySalesChart(String start_year, String start_month, String end_year, String end_month){
    int s_year= Integer.parseInt(start_year);
    int s_month= Integer.parseInt(start_month);
    int e_year= Integer.parseInt(end_year);
    int e_month= Integer.parseInt(end_month);
    List<Map<String, Object>> result= new ArrayList<>();
    while (true){
      result.add(chartService.getSales(s_year, s_month, e_year, e_month));
      if (s_month==e_month && s_year==e_year){
        break;
      }
      s_month++;
      if (s_month==13){
        s_month=1;
        s_year++;
      }
    }
    return result;
  }
  
}
