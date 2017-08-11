package com.comnawa.mvcinema.insang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/insang/test/*")
public class Insang_TestController {
  
  @RequestMapping("/multipartTest")
  public String multipartTest(){
    return "/insang/submenu/sub_movie/multipletest";
  }
  
  @ResponseBody
  @RequestMapping("/multipletest.do")
  public String multipletest(@RequestParam MultipartFile[] multiplefile){
    System.out.println(multiplefile.length);
    for (MultipartFile f: multiplefile){
      System.out.println(f.getOriginalFilename().substring(f.getOriginalFilename().lastIndexOf(".")));
    }
    return "";
  }
  
}
