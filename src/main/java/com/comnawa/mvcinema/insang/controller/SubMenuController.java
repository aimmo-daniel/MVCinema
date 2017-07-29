package com.comnawa.mvcinema.insang.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.comnawa.mvcinema.insang.model.dto.GenreDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;
import com.comnawa.mvcinema.insang.service.Insang_MovieService;
import com.comnawa.mvcinema.insang.service.TheaterService;

@Controller
@RequestMapping("/subMenu/*")
public class SubMenuController {
  
  @Inject
  TheaterService theaterService;
  @Inject
  Insang_MovieService movieService;
  @Inject
  String videoPath;
  @Inject
  String imgPath;
  
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
  
  @RequestMapping("/movie/add.do")
  public String movie_add(Model model){
    List<GenreDTO> list= movieService.getGenreList();
    model.addAttribute("genreList",list);
    model.addAttribute("genreSize",list.size());
    return "/insang/submenu/sub_movie/movie_add";
  }
  
  @RequestMapping("movie/addMovie.do")
  public String add_newMovie(HttpServletRequest request, MultipartFile filePreview, MultipartFile filePoster,
      Model model){
    
    /* 
     * form에서 넘어온 데이터 가공 후 dto에 넣기
     */
    long primarykey= System.currentTimeMillis();
    String previewName= primarykey+"_"+filePreview.getOriginalFilename();
    String posterName= primarykey+"_"+filePoster.getOriginalFilename(); 
    Insang_MovieDTO dto= new Insang_MovieDTO();
    dto.setTitle(request.getParameter("title"));
    dto.setAge(Integer.parseInt(request.getParameter("age")));
    dto.setDirector(request.getParameter("director"));
    dto.setActors(request.getParameter("actors"));
    dto.setContent(request.getParameter("content"));
    dto.setGenre(request.getParameter("genre"));
    dto.setRuntime(Integer.parseInt(request.getParameter("runtime")));
    Date release_date= null;
    try {
      release_date= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("release_date"));
    } catch (ParseException e) {
      e.printStackTrace();
    }
    dto.setRelease_date(release_date);
    dto.setPreview(previewName);
    dto.setImg_url(posterName);
    
    /*
     * MultipartFile 동영상 디렉토리에 복사
     */
    
    //비디오 경로 생성
    File f= new File(videoPath);
    if (!f.exists()){
      f.mkdir();
    }
    //이미지 경로 생성
    f= new File(imgPath);
    if (!f.exists()){
      f.mkdir();
    }
    //비디오 파일 복사
    f= new File(videoPath, previewName);
    File f1= new File(imgPath, posterName);
    try {
      FileCopyUtils.copy(filePreview.getBytes(), f);
      FileCopyUtils.copy(filePoster.getBytes(), f1);
    } catch (IOException e) {
      e.printStackTrace();
    }
    
    movieService.insertMovie(dto);
    
    model.addAttribute("result", "addMovie");
    
    return "/insang/login/admin_login";
  }
  
}
