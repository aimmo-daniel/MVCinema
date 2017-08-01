package com.comnawa.mvcinema.insang.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comnawa.mvcinema.insang.service.Insang_MovieService;
import com.comnawa.mvcinema.insang.service.TheaterService;

@Controller
@RequestMapping("/subMenu/*")
public class SubMenuController {
  
  @Inject
  TheaterService theaterService;
  @Inject
  Insang_MovieService movieService;
  
  @RequestMapping("member.do")
  public String member(){
    return "/insang/submenu/member";
  }
  
  @RequestMapping("movie.do")
  public String movie(){
    return "/insang/submenu/movie";
  }
  
  @RequestMapping("option.do")
  public String option(){
    return "/insang/submenu/option";
  }
  
  @RequestMapping("theater.do")
  public String theater(){
    return "/insang/submenu/theater";
  }
  
}
