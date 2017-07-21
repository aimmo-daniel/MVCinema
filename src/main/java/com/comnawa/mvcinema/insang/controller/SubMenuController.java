package com.comnawa.mvcinema.insang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/subMenu/*")
public class SubMenuController {
  
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
  
  @RequestMapping("/theater/add.do")
  public String theater_add(){
    return "/insang/submenu/sub_theater/theater_add";
  }
  
  @RequestMapping("/theater/sit.do")
  public String theater_sit(){
    return "/insang/submenu/sub_theater/theater_sit";
  }
  
}
