package com.comnawa.mvcinema.insang.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comnawa.mvcinema.insang.service.Insang_MovieService;
import com.comnawa.mvcinema.insang.service.TheaterService;

/*
 * ajax로 요청할 submenu 페이지 컨트롤러
 */

@Controller
@RequestMapping("/subMenu/*")
public class SubMenuController {
  
  @Inject
  TheaterService theaterService;
  @Inject
  Insang_MovieService movieService;
  
  //회원관리 페이지
  @RequestMapping("member.do")
  public String member(){
    return "/insang/submenu/member";
  }
  
  //영화관리 페이지
  @RequestMapping("movie.do")
  public String movie(){
    return "/insang/submenu/movie";
  }
  
  //통계,차트 페이지
  @RequestMapping("option.do")
  public String option(){
    return "/insang/submenu/option";
  }
  
  //상영관관리 페이지
  @RequestMapping("theater.do")
  public String theater(){
    return "/insang/submenu/theater";
  }
  
}
