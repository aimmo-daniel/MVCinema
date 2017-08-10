package com.comnawa.mvcinema.insang.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.comnawa.mvcinema.insang.service.Insang_ContactService;

@Controller
@RequestMapping("/subMenu/member/*")
public class Insang_MemberController {

  @Inject
  Insang_ContactService contactService;
  
  @RequestMapping("contact.do")
  public String contact(Model model){
    model.addAttribute("contactList", contactService.getContactList());
    return "/insang/submenu/sub_member/member_contact";
  }
  
  @RequestMapping("faq.do")
  public String faq(){
    return "/insang/submenu/sub_member/member_faq";
  }
  
  @RequestMapping("contactDetail.do")
  public String contactDetail(@RequestParam String idx){
    
    return "";
  }
  
}
