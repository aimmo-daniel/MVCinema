package com.comnawa.mvcinema.insang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitEmptyDTO;
import com.comnawa.mvcinema.insang.service.TheaterService;

@Controller
@RequestMapping("/subMenu/*")
public class TheaterController {
  
  @Inject
  TheaterService theaterService;
  
  @RequestMapping("theater_addTheater.do")
  public String theater_add_add(Model model){
    model.addAttribute("idx", theaterService.getMaxIDX());
    return "/insang/submenu/sub_theater/theater_add_add";
  }
  
  @RequestMapping("theater_addTheaterDetail")
  public String theater_addTheaterDetail(HttpServletRequest request){
    Map<String, Object> map= new HashMap<>();
    map.put("idx", request.getParameter("idx"));
    map.put("name", request.getParameter("name"));
    map.put("rows", request.getParameter("rows"));
    map.put("cols", request.getParameter("cols"));
    map.put("preview", request.getParameter("preview"));
    map.put("price", request.getParameter("price"));
    map.put("max", Integer.parseInt(request.getParameter("rows")) * Integer.parseInt(request.getParameter("cols")));
    theaterService.addTheater(map);
    return "redirect:/";
  }
  
  @RequestMapping("theater_updateTheater.do")
  public String theater_updateTheater(HttpServletRequest request, Model model){
    Map<String, Object> map= new HashMap<>();
    map.put("primaryIDX", request.getParameter("primaryIDX"));
    map.put("primaryName", request.getParameter("primaryName"));
    map.put("idx", request.getParameter("idx"));
    map.put("name", request.getParameter("name"));
    map.put("rows", request.getParameter("rows"));
    map.put("cols", request.getParameter("cols"));
    map.put("preview", request.getParameter("preview"));
    map.put("price", request.getParameter("price"));
    map.put("max", Integer.parseInt(request.getParameter("rows")) * Integer.parseInt(request.getParameter("cols")));
    theaterService.updateTheater(map);
    model.addAttribute("result", "modTheater");
    return "/insang/login/admin_login";
  }
  
  @RequestMapping("theater_updateTheaterDetail")
  public String theater_updateTheaterDetail(@RequestParam int idx, Model model){
    Map<String, Integer> maxcount= theaterService.getMaxIDX();
    List<TheaterDTO> theaterDTO= theaterService.getTheaterList();
    List<TheaterSitDTO> theaterSitDTO= theaterService.getTheaterSitList();
    TheaterDTO selectTheaterDTO= null;
    TheaterSitDTO selectTheaterSitDTO= null;
    for (TheaterDTO dto: theaterDTO){
      if (dto.getIdx()== idx){
        selectTheaterDTO= dto;
      }
    }
    for (TheaterSitDTO dto: theaterSitDTO){
      if (dto.getIdx()== idx){
        selectTheaterSitDTO= dto;
      }
    }
    Map<String, Object> map= new HashMap<>();
    map.put("idx", selectTheaterDTO.getIdx());
    map.put("name", selectTheaterDTO.getName());
    map.put("price", selectTheaterDTO.getPrice());
    map.put("preview", selectTheaterDTO.getPreview());
    map.put("rows", selectTheaterSitDTO.getSeat_row());
    map.put("cols", selectTheaterSitDTO.getSeat_col());
    map.put("max", maxcount);
    model.addAttribute("map", map);
    
    return "/insang/submenu/sub_theater/theater_add_detail";
  }
  
  @RequestMapping("theater_updateTheaterSitDetail")
  public String theater_updateTheaterSitDetail(@RequestParam int idx, Model model){
    for (TheaterDTO foo: theaterService.getTheaterList()){
      if (foo.getIdx() == idx){
        model.addAttribute("dto", foo);
      }
    }
    int max=0;
    for (TheaterSitDTO dto: theaterService.getTheaterSitList()){
      max= (max < dto.getSeat_row()) ? dto.getSeat_row() : max ;
    }
    for (TheaterSitDTO foo: theaterService.getTheaterSitList()){
      if (foo.getIdx() == idx){
        model.addAttribute("theaterSitDTO", foo);
      }
    }
    List<TheaterSitEmptyDTO> listEmpty= theaterService.getTheaterSitEmpty();
    String theaterSitResult="";
    for (TheaterSitEmptyDTO dto: listEmpty){
      if (dto.getIdx()== idx){
        theaterSitResult+= dto.getSeat_empty()+",";
      }
    }
    if (!theaterSitResult.equals("")){
      theaterSitResult= theaterSitResult.substring(0, theaterSitResult.length()-1);
    }
    model.addAttribute("theater_sit_empty", listEmpty);
    model.addAttribute("theater_sit_empty_result", theaterSitResult.equals("null") ? "" : theaterSitResult);
    model.addAttribute("theaterSitMax", max);
    model.addAttribute("idx", idx);
    return "/insang/submenu/sub_theater/theater_sit_detail";
  }
  
  @RequestMapping("/theater/updateSit.do")
  public String updateSit(HttpServletRequest request){
    int sitCount= String.valueOf(request.getParameter("sit")).split(",").length;
    theaterService.updateSit(String.valueOf(request.getParameter("sit")), Integer.parseInt(request.getParameter("idx")), sitCount);
    return "/insang/test";
  }
  
  @RequestMapping("/theater/add.do")
  public ModelAndView theater_add(){
    ModelAndView mav= new ModelAndView();
    mav.addObject("theaterList",theaterService.getTheaterList());
    mav.addObject("theaterSitList", theaterService.getTheaterSitList());
    mav.addObject("theater_sit_empty", theaterService.getTheaterSitEmpty());
    int max=0;
    for (TheaterSitDTO dto: theaterService.getTheaterSitList()){
      max= (max < dto.getSeat_row()) ? dto.getSeat_row() : max ;
    }
    mav.addObject("theaterSitMax", max);
    mav.setViewName("/insang/submenu/sub_theater/theater_add");
    return mav;
  }
  
  @RequestMapping("/theater/sit.do")
  public ModelAndView theater_sit(){
    ModelAndView mav= new ModelAndView();
    mav.addObject("theaterList",theaterService.getTheaterList());
    mav.addObject("theaterSitList", theaterService.getTheaterSitList());
    mav.addObject("theater_sit_empty", theaterService.getTheaterSitEmpty());
    int max=0;
    for (TheaterSitDTO dto: theaterService.getTheaterSitList()){
      max= (max < dto.getSeat_row()) ? dto.getSeat_row() : max ;
    }
    mav.addObject("theaterSitMax", max);
    mav.setViewName("/insang/submenu/sub_theater/theater_sit");
    return mav;
  }
  

}
