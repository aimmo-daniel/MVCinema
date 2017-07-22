package com.comnawa.mvcinema.insang.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.exceptions.PersistenceException;
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
    try{
      if (adminService.login(dto)){
        Map<String, String> map= new HashMap<>();
        map.put("id", "admin");
        map.put("name", "관리자");
        session.setAttribute("dto", map);
      } else {
        model.addAttribute("result","로그인에 실패하셨습니다 \n 아이디 또는 비밀번호를 확인해주세요");
        return "/insang/login/admin_login";
      }
    } catch (PersistenceException e){
      model.addAttribute("result","로그인에 실패하셨습니다 \n 인터넷 연결상태를 확인해주세요");
      e.printStackTrace();
    }
    return "redirect:/admin/loginpage.do";
  }
  
  @RequestMapping("logout.do")
  public String login(HttpSession session){
    session.removeAttribute("dto");
    return "redirect:/admin/loginpage.do";
  }
  
}
