package com.comnawa.mvcinema.insang.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.comnawa.mvcinema.insang.model.dto.GenreDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;
import com.comnawa.mvcinema.insang.service.Insang_MovieService;

@Controller
@RequestMapping("/subMenu/*")
public class MovieController {

  @Inject
  Insang_MovieService movieService;
  @Inject
  String imgPath;
  @Inject
  String videoPath;
  
  @RequestMapping("/movie/add.do")
  public String movie_add(Model model){
    List<GenreDTO> list= movieService.getGenreList();
    model.addAttribute("genreList",list);
    model.addAttribute("genreSize",list.size());
    List<Insang_MovieDTO> movieList= movieService.getMovieList();
    model.addAttribute("movieList",movieList);
    return "/insang/submenu/sub_movie/movie_add";
  }
  
  @RequestMapping("movie/addMovie.do")
  public String add_newMovie(HttpServletRequest request, MultipartFile filePreview, MultipartFile filePoster,
      Model model, HttpSession session){
    
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
    
    String realpath= String.valueOf(session.getAttribute("realPath"));
    System.out.println(realpath+imgPath);
    //비디오 경로 생성
    File f= new File(realpath+videoPath+"/");
    if (!f.exists()){
      f.mkdir();
    }
    //이미지 경로 생성
    f= new File(realpath+imgPath+"/");
    if (!f.exists()){
      f.mkdir();
    }
    //비디오 파일 복사
    File f2= new File(realpath+videoPath+"/"+previewName);
    File f1= new File(realpath+imgPath+"/"+posterName);
    try {
      FileCopyUtils.copy(filePreview.getBytes(), f2);
      FileCopyUtils.copy(filePoster.getBytes(), f1);
    } catch (IOException e) {
      e.printStackTrace();
    }
    
    movieService.insertMovie(dto);
    
    model.addAttribute("result", "addMovie");
    
    return "/insang/login/admin_login";
  }
  
}
