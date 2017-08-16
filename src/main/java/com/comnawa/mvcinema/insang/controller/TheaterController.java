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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitEmptyDTO;
import com.comnawa.mvcinema.insang.service.TheaterService;

/*
 * 상영관 관리 컨트롤러
 */

@Controller
@RequestMapping("/subMenu/*")
public class TheaterController {
  
  @Inject
  TheaterService theaterService;
  
  //상영관 추가 마지막 페이지
  @RequestMapping("theater_addTheater.do")
  public String theater_add_add(Model model){
    //일반상영관 갯수, 아이맥스상영관 갯수 검색후 반환
    model.addAttribute("idx", theaterService.getMaxIDX());
    return "/insang/submenu/sub_theater/theater_add_add";
  }
  
  //상영관 추가
  @ResponseBody
  @RequestMapping("theater_addTheaterDetail")
  public boolean theater_addTheaterDetail(HttpServletRequest request, Model model){
    //입력된 상영관 상세자료를 가공 후 map에 담음 
    Map<String, Object> map= new HashMap<>();
    map.put("idx", request.getParameter("idx"));
    map.put("name", request.getParameter("name"));
    map.put("rows", request.getParameter("rows"));
    map.put("cols", request.getParameter("cols"));
    map.put("preview", request.getParameter("preview"));
    map.put("price", request.getParameter("price"));
    map.put("max", Integer.parseInt(request.getParameter("rows")) * Integer.parseInt(request.getParameter("cols")));
    //모델에 자료 삽입 요청
    theaterService.addTheater(map);
    //결과반환
    return true;
  }
  
  //상영관 상세정보, 수정
  @ResponseBody
  @RequestMapping("theater_updateTheater.do")
  public boolean theater_updateTheater(HttpServletRequest request, Model model){
    //수정된 자료를 가공 후 map에 담음
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
    //모델에 자료 수정 요청
    theaterService.updateTheater(map);
    //결과 반환
    return true;
  }
  
  //상영관 삭제
  @RequestMapping("theater_delTheater.do")
  public String theater_updateTheater(@RequestParam String idx){
    //상영관 고유번호를 받아온 후 삭제
    theaterService.delTheater(Integer.parseInt(idx));
    return "/insang/test";
  }
  
  //상영관 상세정보 페이지
  @RequestMapping("theater_updateTheaterDetail")
  public String theater_updateTheaterDetail(@RequestParam int idx, Model model){
    //필요한 자료를 받아옴
    Map<String, Integer> maxcount= theaterService.getMaxIDX();
    List<TheaterDTO> theaterDTO= theaterService.getTheaterList();
    List<TheaterSitDTO> theaterSitDTO= theaterService.getTheaterSitList();
    //받아온 자료중 보여줘야하는 상영관의 고유번호와맞는 dto를 검색
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
    //받아온자료로 검색 후 필요한 자료를 map에 담은 후 model객체에 담아 반환
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
  
  //좌석배치 상세정보 마지막 페이지
  @RequestMapping("theater_updateTheaterSitDetail")
  public String theater_updateTheaterSitDetail(@RequestParam int idx, Model model){
    //받아온 상영관고유번호로 상영관의 dto를 찾아 model객체에 저장
    for (TheaterDTO foo: theaterService.getTheaterList()){
      if (foo.getIdx() == idx){
        model.addAttribute("dto", foo);
      }
    }
    //좌석의 최대값 구하기
    int max=0;
    for (TheaterSitDTO dto: theaterService.getTheaterSitList()){
      max= (max < dto.getSeat_row()) ? dto.getSeat_row() : max ;
    }
    //상영관 고유번호로 상영관의 좌석정보 dto를 찾아 model객체에 저장
    for (TheaterSitDTO foo: theaterService.getTheaterSitList()){
      if (foo.getIdx() == idx){
        model.addAttribute("theaterSitDTO", foo);
      }
    }
    //idx로 상영관의 사용할수 없는 좌석의 좌석정보를 받아온 후 String형태로 가공
    List<TheaterSitEmptyDTO> listEmpty= theaterService.getTheaterSitEmpty();
    String theaterSitResult="";
    for (TheaterSitEmptyDTO dto: listEmpty){
      if (dto.getIdx()== idx){
        theaterSitResult+= dto.getSeat_empty()+",";
      }
    }
    //가공 후 제일 마지막 뒤 [,] 제거
    if (!theaterSitResult.equals("")){
      theaterSitResult= theaterSitResult.substring(0, theaterSitResult.length()-1);
    }
    //model객체에 각종 정보를 담아 반환
    model.addAttribute("theater_sit_empty", listEmpty);
    model.addAttribute("theater_sit_empty_result", theaterSitResult.equals("null") ? "" : theaterSitResult);
    model.addAttribute("theaterSitMax", max);
    model.addAttribute("idx", idx);
    return "/insang/submenu/sub_theater/theater_sit_detail";
  }
  
  //사용할수 없는 좌석정보 상세페이지( 수정 및 추가 )
  @ResponseBody
  @RequestMapping("/theater/updateSit.do")
  public boolean updateSit(HttpServletRequest request){
    //사용할 수 없는 좌석정보 의 길이, 몇개를 사용할수없는지, 상영관 고유번호 를 받아와 자료 가공 후
    //모델에 update 요청후 빈페이지 반환
    int sitCount= String.valueOf(request.getParameter("sit")).split(",").length;
    theaterService.updateSit(String.valueOf(request.getParameter("sit")), Integer.parseInt(request.getParameter("idx")), sitCount);
    return true;
  }
  
  //상영관 추가 중간 페이지
  @RequestMapping("/theater/add.do")
  public ModelAndView theater_add(){
    //필요한 자료 검색 후 model객체에 담아 반환
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
  
  //상영관 좌석배치 상세정보 중간 페이지
  @RequestMapping("/theater/sit.do")
  public ModelAndView theater_sit(){
    //필요한 자료 검색 후 model객체에 담아 반환
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
