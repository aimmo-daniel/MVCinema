package com.comnawa.mvcinema.insang.controller;

/*
 * 관리자페이지 컨트롤러
 * 로그인, 로그아웃, 파일업로드 경로설정
 */

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.comnawa.mvcinema.insang.model.dto.AdminDTO;
import com.comnawa.mvcinema.insang.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

  @Inject
  AdminService adminService;

  //로그인 페이지 이동
  @RequestMapping("loginpage.do")
  public String loginpage() {
    return "insang/login/admin_login";
  }

  //로그인 작업
  @RequestMapping("login.do")
  public String login(@ModelAttribute AdminDTO dto, HttpSession session, Model model) {
    if (adminService.login(dto)) { //받아온값으로 조회후 true가 떨어진다면 세션에저장
      Map<String, String> map = new HashMap<>();
      map.put("id", "admin");
      map.put("name", "관리자");
      session.setAttribute("dto", map);
    } else { //그렇지 않다면 loginFail이라는 문자열을 포워딩으로 넘김
      model.addAttribute("result", "loginFail");
      return "/insang/login/admin_login";
    }
    return "redirect:/admin/loginpage.do";
  }

  //로그아웃 작업
  @RequestMapping("logout.do")
  public String login(HttpSession session) {
    //세션에 있는 관리자정보를 지움
    session.removeAttribute("dto");
    return "redirect:/admin/loginpage.do";
  } //로그아웃
  
  //톰캣 배포디렉토리 경로 받아와 세션에 저장
  @RequestMapping("getRealPath.do")
  public String getRealPath(@RequestParam String realPath, HttpSession session){
    session.setAttribute("realPath", realPath);
    System.out.println(realPath);
    return "insang/test";
  }

}
