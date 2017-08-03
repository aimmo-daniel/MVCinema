package com.comnawa.mvcinema.insang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.comnawa.mvcinema.insang.ftp.FtpClient;
import com.comnawa.mvcinema.insang.model.dto.GenreDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;
import com.comnawa.mvcinema.insang.service.Insang_MovieService;
import com.comnawa.mvcinema.insang.service.TheaterService;

@Controller
@RequestMapping("/subMenu/*")
public class MovieController {

  @Inject
  Insang_MovieService movieService;
  @Inject
  TheaterService theaterService;
  @Inject
  String imgPath;
  @Inject
  String videoPath;

  @RequestMapping("/movie/add.do")
  public String movie_add(Model model) {
    List<GenreDTO> list = movieService.getGenreList();
    model.addAttribute("genreList", list);
    model.addAttribute("genreSize", list.size());
    List<Insang_MovieDTO> movieList = movieService.getMovieList();
    model.addAttribute("movieList", movieList);
    return "/insang/submenu/sub_movie/movie_add";
  }

  @RequestMapping("movie/addMovie.do")
  public String add_newMovie(HttpServletRequest request, MultipartFile filePreview, MultipartFile filePoster, Model model,
      HttpSession session) throws Exception {

    /*
     * form에서 넘어온 데이터 가공 후 dto에 넣기
     */
    long primarykey = System.currentTimeMillis();
    String previewName = primarykey + "_" + filePreview.getOriginalFilename();
    String posterName = primarykey + "_" + filePoster.getOriginalFilename();
    Insang_MovieDTO dto = new Insang_MovieDTO();
    dto.setTitle(request.getParameter("title"));
    dto.setAge(Integer.parseInt(request.getParameter("age")));
    dto.setDirector(request.getParameter("director"));
    dto.setActors(request.getParameter("actors"));
    dto.setContent(request.getParameter("content"));
    dto.setGenre(request.getParameter("genre"));
    dto.setRuntime(Integer.parseInt(request.getParameter("runtime")));
    Date release_date = null;
    try {
      release_date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("release_date"));
    } catch (ParseException e) {
      e.printStackTrace();
    }
    dto.setRelease_date(release_date);
    dto.setPreview(previewName);
    dto.setImg_url(posterName);

    /*
     * MultipartFile 동영상 디렉토리에 복사
     */

    // String realpath= String.valueOf(session.getAttribute("realPath"));
    // //비디오 경로 생성
    // File f= new File(realpath+videoPath);
    // if (!f.exists()){
    // f.mkdirs();
    // }
    // //이미지 경로 생성
    // f= new File(realpath+imgPath);
    // if (!f.exists()){
    // f.mkdirs();
    // }
    // //비디오 파일 복사
    // File f2= new File(realpath+videoPath + previewName);
    // File f1= new File(realpath+imgPath + posterName);
    // try {
    // FileCopyUtils.copy(filePreview.getBytes(), f2);
    // FileCopyUtils.copy(filePoster.getBytes(), f1);
    // } catch (IOException e) {
    // e.printStackTrace();
    // }

    File fPreview = new File(previewName);
    File fPoster = new File(posterName);
    FileOutputStream fos = new FileOutputStream(fPreview);
    fos.write(filePreview.getBytes());
    fos.flush();
    fos.close();
    fos = new FileOutputStream(fPoster);
    fos.write(filePoster.getBytes());
    fos.flush();
    fos.close();

    FtpClient ftpSender = new FtpClient("");
    ftpSender.upload(fPreview, "/video/" + previewName);
    ftpSender.upload(fPoster, "/img/" + posterName);

    movieService.insertMovie(dto);

    model.addAttribute("result", "addMovie");

    return "/insang/login/admin_login";
  }

  @ResponseBody
  @RequestMapping("/movie/movieDetail.do")
  public Insang_MovieDTO movieDetail(int idx) {
    Insang_MovieDTO select = null;
    for (Insang_MovieDTO foo : movieService.getMovieList()) {
      if (foo.getIdx() == idx) {
        select = foo;
      }
    }
    return select;
  }

  @RequestMapping("/movie/modMovie.do")
  public String modMovie(HttpServletRequest request, MultipartFile filePreview, MultipartFile filePoster, Model model,
      HttpSession session) throws Exception {

    FtpClient ftpSender = new FtpClient("");

    // 이미지,미리보기 파일 바뀌었는지 확인
    String originImg = "";
    String originVid = "";
    for (Insang_MovieDTO foo : movieService.getMovieList()) {
      if (foo.getIdx() == Integer.parseInt(request.getParameter("mod_idx"))) {
        originImg = ( foo.getImg_url()==null || foo.getImg_url().equals("null") ) ?
        		"null" : foo.getImg_url();
        originVid = ( foo.getPreview()==null || foo.getPreview().equals("null") ) ?
        		"null" : foo.getPreview();
        break;
      }
    }
    String re_preview= request.getParameter("preview");
    String re_img_url= request.getParameter("img_url");
    System.out.println("requestparam:"+request.getParameter("img_url"));
    System.out.println("requestparam:"+request.getParameter("preview"));
    if (re_preview.indexOf("C:\\fakepath\\")!= -1){
      int start=request.getParameter("preview").lastIndexOf("\\")+1;
      re_preview = request.getParameter("preview").substring(start);
    }
    if (re_img_url.indexOf("C:\\fakepath\\")!= -1){
      int start= request.getParameter("img_url").lastIndexOf("\\")+1;
      re_img_url = request.getParameter("img_url").substring(start);
    }
    System.out.println("originImg:" + originImg);
    System.out.println("originVid:" + originVid);
    
    System.out.println("img_url:" + re_img_url);
    System.out.println("preview:" + re_preview);

    /*
     * form에서 넘어온 데이터 가공 후 dto에 넣기
     */
    long primarykey = System.currentTimeMillis();
    String previewName="";
    String posterName="";
    previewName = (originImg.equals(re_preview)) ? originVid : re_preview;
    posterName = (originVid.equals(re_img_url)) ? originImg : re_img_url;
    Insang_MovieDTO dto = new Insang_MovieDTO();
    dto.setIdx(Integer.parseInt(request.getParameter("mod_idx")));
    dto.setTitle(request.getParameter("title"));
    dto.setAge(Integer.parseInt(request.getParameter("age")));
    dto.setDirector(request.getParameter("director"));
    dto.setActors(request.getParameter("actors"));
    dto.setContent(request.getParameter("content"));
    dto.setGenre(request.getParameter("genre"));
    dto.setRuntime(Integer.parseInt(request.getParameter("runtime")));
    Date release_date = null;
    try {
      release_date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("release_date"));
    } catch (ParseException e) {
      e.printStackTrace();
    }
    dto.setRelease_date(release_date);
    dto.setPreview(previewName);
    dto.setImg_url(posterName);

    /*
     * MultipartFile 동영상 디렉토리에 복사
     */

    // String realpath= String.valueOf(session.getAttribute("realPath"));
    // //비디오 경로 생성
    // File f= new File(realpath+videoPath);
    // if (!f.exists()){
    // f.mkdirs();
    // }
    // //이미지 경로 생성
    // f= new File(realpath+imgPath);
    // if (!f.exists()){
    // f.mkdirs();
    // }
    // //비디오 파일 복사
    // File f2= new File(realpath+videoPath + previewName);
    // File f1= new File(realpath+imgPath + posterName);
    // try {
    // FileCopyUtils.copy(filePreview.getBytes(), f2);
    // FileCopyUtils.copy(filePoster.getBytes(), f1);
    // } catch (IOException e) {
    // e.printStackTrace();
    // }

    File fPreview = new File(previewName);
    File fPoster = new File(posterName);
    FileOutputStream fos = new FileOutputStream(fPreview);
    fos.write(filePreview.getBytes());
    fos.flush();
    fos.close();
    fos = new FileOutputStream(fPoster);
    fos.write(filePoster.getBytes());
    fos.flush();
    fos.close();

    // 이미지 혹은 영상이 바뀌었다면 기존파일 삭제
    if (!originImg.equals(re_img_url)) {
      ftpSender.delete("/img/" + originImg);
      ftpSender.upload(fPoster, "/img/" + posterName);
    }
    if (!originVid.equals(re_preview)) {
      ftpSender.delete("/video/" + originVid);
      ftpSender.upload(fPreview, "/video/" + previewName);
    }

    movieService.updateMovie(dto);

    model.addAttribute("result", "modMovie");

    return "/insang/login/admin_login";
  }
  
  @RequestMapping("/movie/batch.do")
  public String batch(Model model){
    model.addAttribute("theaterList", theaterService.getTheaterList());
    System.out.println(theaterService.getTheaterList().toString());
    return "/insang/submenu/sub_movie/movie_batch"; 
  }
  
  @RequestMapping("/movie/searchBatch.do")
  public String searchBatch(HttpServletRequest request, Model model){
    int idx= Integer.parseInt(request.getParameter("idx"));
    String[] date= request.getParameter("date").split("-");
    String startdate= date[0]+"-"+date[1]+"-"+date[2];
    Calendar cal= Calendar.getInstance();
    cal.set(Integer.parseInt(date[0]), Integer.parseInt(date[1]), Integer.parseInt(date[2]));
    cal.add(Calendar.DATE, 1);
    String enddate= cal.get(Calendar.YEAR)+"-"+cal.get(Calendar.MONTH)+"-"+cal.get(Calendar.DATE);
    
    Map<String,Object> map= new HashMap<>();
    map.put("startdate", startdate);
    map.put("enddate", enddate);
    map.put("idx", idx);
    
    model.addAttribute("scheduleList",movieService.getScheduleList(map));
    return "/insang/submenu/sub_movie/movie_batch_search";
  }

}
