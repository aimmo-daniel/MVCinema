package com.comnawa.mvcinema.insang.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comnawa.mvcinema.insang.model.dto.ContactDTO;
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
  public String contactDetail(@RequestParam String idx, Model model){
    model.addAttribute("contactDetail", contactService.getContactDetail(Integer.parseInt(idx)));
    return "/insang/submenu/sub_member/member_contact_detail";
  }
  
  @ResponseBody
  @RequestMapping("contactAnswer.do")
  public String contactAnswer(@RequestParam String answer, @RequestParam String idx, @RequestParam String status){
    ContactDTO dto= new ContactDTO();
    dto.setAdmin_content(answer);
    dto.setIdx(Integer.parseInt(idx));
    String result="answerok";
    if (status.equals("insert")){
      contactService.insertContactAnswer(dto);
      result= "insertok";
    } else if (status.equals("modify")){
      contactService.modifyContactAnswer(dto);
      result= "modifyok";
    }
    return result;
  }
  
  @RequestMapping("faq_detail.do")
  public String faq_faq(@RequestParam String menu, Model model){
    if (menu.equals("faq")){
      model.addAttribute("result", menu);
    } else if (menu.equals("category")){
      model.addAttribute("result", menu);
    }
    model.addAttribute("categoryList", contactService.getCategoryList());
    model.addAttribute("faqList", contactService.getFaqList());
    return "/insang/submenu/sub_member/member_faq_detail";
  }
  
  @ResponseBody
  @RequestMapping("insertCategory.do")
  public String insertCategory(@RequestParam String category){
    contactService.insertCategory(category);
    return "success";
  }
  
  @ResponseBody
  @RequestMapping("insertFaq.do")
  public String insertFaq(@RequestParam String ask, @RequestParam String question, @RequestParam String category_idx){
    Map<String, Object> map= new HashMap<>();
    map.put("ask", ask);
    map.put("question", question);
    map.put("category_idx", Integer.parseInt(category_idx));
    contactService.insertFaq(map);
    return "success";
  }
  
}
