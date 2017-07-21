package com.comnawa.mvcinema.insang.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
  public String login(@ModelAttribute AdminDTO dto, HttpSession session, Model model){
    if (adminService.login(dto)){
      Map<String, String> map= new HashMap<>();
      map.put("id", "admin");
      map.put("name", "관리자");
      session.setAttribute("dto", map);
    } else {
      model.addAttribute("result","fail");
      return "/insang/login/admin_login";
    }
    return "redirect:/admin/loginpage.do";
  }
  
  @RequestMapping("logout.do")
  public String login(HttpSession session){
    session.removeAttribute("dto");
    return "redirect:/admin/loginpage.do";
  }
  
}
