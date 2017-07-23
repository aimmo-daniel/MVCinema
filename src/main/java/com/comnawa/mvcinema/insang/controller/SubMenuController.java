package com.comnawa.mvcinema.insang.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;
import com.comnawa.mvcinema.insang.service.TheaterService;

@Controller
@RequestMapping("/subMenu/*")
public class SubMenuController {
  
  @Inject
  TheaterService theaterService;
  
  @RequestMapping("member.do")
  public String member(){
    return "/insang/submenu/member";
  }
  
  @RequestMapping("movie.do")
  public String movie(){
    return "/insang/submenu/movie";
  }
  
  @RequestMapping("option.do")
  public String option(){
    return "/insang/submenu/option";
  }
  
  @RequestMapping("theater.do")
  public String theater(){
    return "/insang/submenu/theater";
  }
  
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
  
  @RequestMapping("/theater/add.do")
  public ModelAndView theater_add(){
    ModelAndView mav= new ModelAndView();
    mav.addObject("theaterList",theaterService.getTheaterList());
    mav.addObject("theaterSitList", theaterService.getTheaterSitList());
    int max=0;
    for (TheaterSitDTO dto: theaterService.getTheaterSitList()){
      max= (max < dto.getSeat_row()) ? dto.getSeat_row() : max ;
    }
    mav.addObject("theaterSitMax", max);
    mav.setViewName("/insang/submenu/sub_theater/theater_add");
    return mav;
  }
  
  @RequestMapping("/theater/sit.do")
  public String theater_sit(){
    return "/insang/submenu/sub_theater/theater_sit";
  }
  
}
