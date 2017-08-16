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

/*
 * 회원관리 (고객지원) 컨트롤러
 * 1:1문의, FAQ 관리
 */

@Controller
@RequestMapping("/subMenu/member/*")
public class Insang_MemberController {

  @Inject
  Insang_ContactService contactService;

  //1:1문의 관리 및 답변 페이지로 이동
  @RequestMapping("contact.do")
  public String contact(Model model){
    //1:1문의 리스트를 넘김
    model.addAttribute("contactList", contactService.getContactList());
    return "/insang/submenu/sub_member/member_contact";
  }
  
  //FAQ 관리 페이지로 이동
  @RequestMapping("faq.do")
  public String faq(){
    return "/insang/submenu/sub_member/member_faq";
  }
  
  @RequestMapping("notice.do")
  public String notice(Model model){
    model.addAttribute("notice", contactService.getNotice());
    return "/insang/submenu/sub_member/member_notice";
  }
  
  @ResponseBody
  @RequestMapping("noticeModify.do")
  public boolean noticeModify(String title, String content){
    Map<String, Object> map= new HashMap<>();
    map.put("title", title);
    map.put("content", content);
    return contactService.modifyNotice(map);
  }
  
  //간략 1:1문의내역확인 후 답변하기 클릭시 index값을 받아와 자료검색후 답변페이지로 이동
  @RequestMapping("contactDetail.do")
  public String contactDetail(@RequestParam String idx, Model model){
    //1:1문의 리스트중 한가지의 세부자료를 검색 후 넘김
    model.addAttribute("contactDetail", contactService.getContactDetail(Integer.parseInt(idx)));
    return "/insang/submenu/sub_member/member_contact_detail";
  }
  
  //1:1문의 답변, 답변수정
  @ResponseBody
  @RequestMapping("contactAnswer.do")
  public String contactAnswer(@RequestParam String answer, @RequestParam String idx, @RequestParam String status){
    //dto에 답변내용, 답변 고유번호를 저장
    ContactDTO dto= new ContactDTO();
    dto.setAdmin_content(answer);
    dto.setIdx(Integer.parseInt(idx));
    //반환할 결과값
    String result="";
    
    //하나의 매핑으로 두가지의 기능을 하기위해 status값을 받아옴
    if (status.equals("insert")){ //status값이 insert일 경우
      contactService.insertContactAnswer(dto);
      result= "insertok";
    } else if (status.equals("modify")){ //status값이 modify일 경우
      contactService.modifyContactAnswer(dto);
      result= "modifyok";
    }
    //결과값 반환
    return result;
  }
  
  //faq, category수정
  @RequestMapping("faq_detail.do")
  public String faq_faq(@RequestParam String menu, Model model){
    //하나의 주소로 두가지의 기능을 위해 상태값 menu를 받아옴
    if (menu.equals("faq")){ //menu가 faq일 경우
      //faq를 처리했다고 응답하기위해 result에 faq 문자열 저장
      model.addAttribute("result", menu);
    } else if (menu.equals("category")){
      //category를 처리했다고 응답하기위해 result에 category 문자열 저장
      model.addAttribute("result", menu);
    }
    //model에 categorylist, faqlist를 담아 페이지넘김
    model.addAttribute("categoryList", contactService.getCategoryList());
    model.addAttribute("faqList", contactService.getFaqList());
    return "/insang/submenu/sub_member/member_faq_detail";
  }
  
  //신규 카테고리 추가
  @ResponseBody
  @RequestMapping("insertCategory.do")
  public String insertCategory(@RequestParam String category){
    //신규 카테고리 추가
    contactService.insertCategory(category);
    //결과값 반환
    return "success";
  }
  
  //신규 faq추가
  @ResponseBody
  @RequestMapping("insertFaq.do")
  public String insertFaq(@RequestParam String ask, @RequestParam String question, @RequestParam String category_idx){
    //자료 처리를 위해 map에 질문,답변,카테고리고유번호를 담아 모델에 넘김
    Map<String, Object> map= new HashMap<>();
    map.put("ask", ask);
    map.put("question", question);
    map.put("category_idx", Integer.parseInt(category_idx));
    //신규 faq 등록
    contactService.insertFaq(map);
    //결과값 반환
    return "success";
  }
  
  //faq 삭제
  @ResponseBody
  @RequestMapping("deleteFaq.do")
  public String deleteFaq(@RequestParam String idx){
    if (contactService.deleteFaq(Integer.parseInt(idx))){
      return "success";
    } else {
      return "fail";
    }
  }
  
  //category 삭제
  @ResponseBody
  @RequestMapping("deleteCategory.do")
  public String deleteCategory(@RequestParam String idx){
    if (contactService.deleteCategory(Integer.parseInt(idx))){
      return "success";
    } else {
      return "fail";
    }
  }
  
}
