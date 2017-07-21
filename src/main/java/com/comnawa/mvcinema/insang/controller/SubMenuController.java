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
  
}
