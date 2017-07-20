package com.comnawa.mvcinema.insang.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comnawa.mvcinema.insang.model.dto.AdminDTO;
import com.comnawa.mvcinema.insang.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
  
  @Inject
  AdminService adminService;
  
  @RequestMapping("loginpage.do")
  public String loginpage(){
    return "insang/login/admin_login";
  }
  
  @RequestMapping("login.do")
  public String login(@ModelAttribute AdminDTO dto, HttpSession session){
    if (adminService.login(dto)){
      Map<String, String> map= new HashMap<>();
      map.put("id", "admin");
      map.put("name", "관리자");
      session.setAttribute("dto", map);
    }
    return "insang/login/admin_login";
  }
  
  @RequestMapping("logout.do")
  public String login(HttpSession session){
    session.removeAttribute("dto");
    return "insang/login/admin_login";
  }
  
}
