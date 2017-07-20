package com.comnawa.mvcinema.insang;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
  
  @RequestMapping("login.do")
  public String login(){
    return "insang/login/admin_login";
  }
  
}
