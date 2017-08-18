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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.comnawa.mvcinema.insang.ftp.FtpClient;
import com.comnawa.mvcinema.insang.model.dto.GenreDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.service.Insang_MovieService;
import com.comnawa.mvcinema.insang.service.TheaterService;
import com.comnawa.mvcinema.sangjin.model.dto.StillcutDTO;

/*
 * 영화관련기능 컨트롤러
 * 신규, 수정, 상영시간표배치
 */

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

  //신규영화 추가페이지
  @RequestMapping("/movie/add.do")
  public String movie_add(Model model) {
    //신규영화 추가시 장르선택을위해 db에 있는 장르 리스트를 받아옴
    List<GenreDTO> list = movieService.getGenreList();
    model.addAttribute("genreList", list); //model에 장르 추가
    model.addAttribute("genreSize", list.size()); //model에 장르 갯수 추가
    //상영시간표 배치를위해 영화리스트를 받아옴
    List<Insang_MovieDTO> movieList = movieService.getMovieList();
    model.addAttribute("movieList", movieList); //model에 영화리스트 추가
    return "/insang/submenu/sub_movie/movie_add";
  }

  //신규영화 추가
  @RequestMapping("/movie/addMovie.do")
  public String add_newMovie(HttpServletRequest request, MultipartFile filePreview, MultipartFile filePoster, Model model,
      HttpSession session, @RequestParam MultipartFile[] multipartFile, MultipartFile fileActors) throws Exception {

    /*
     * form에서 넘어온 데이터 가공 후 dto에 넣기
     */
    long primarykey = System.currentTimeMillis(); //파일명의 고유값 추가를 위해 long타입 현재시간
    String previewName = primarykey + "_" + filePreview.getOriginalFilename(); //고유값_파일명.확장자 (미리보기영상)
    String posterName = primarykey + "_" + filePoster.getOriginalFilename(); //고유값_파일명.확장자 (영화포스터)
    //영화 dto생성후 dto에 자료 입력
    Insang_MovieDTO dto = new Insang_MovieDTO();
    dto.setTitle(request.getParameter("title"));
    dto.setAge(Integer.parseInt(request.getParameter("age")));
    dto.setDirector(request.getParameter("director"));
    dto.setActors(request.getParameter("actors"));
    dto.setContent(request.getParameter("content"));
    dto.setGenre(request.getParameter("genre"));
    dto.setRuntime(Integer.parseInt(request.getParameter("runtime")));
    
    //넘어온 날자값이 String형태이기에 심플패턴으로 가공 후 date객체에 주입
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
     *  [ DB없이 localhost로 작업시 지정된 경로에 파일 업로드 ]
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

    //위의 퍄일명으로 파일객체생성 후 outputstream으로 파일객체에 파일 넣기
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

    //ftpclient를 활용해 서버에 미리보기영상, 포스터이미지 업로드하기
    FtpClient ftpSender = new FtpClient("");
    ftpSender.upload(fPreview, "/video/" + previewName);
    ftpSender.upload(fPoster, "/img/" + posterName);
    
    //스틸컷 작업
    //multipart파일을 가공하여
    //ftpclient를 이용해 서버에 스틸컷이미지 업로드
    File[] stillcut= new File[multipartFile.length];
    String[] stillcutName= new String[multipartFile.length];
    for (int i=0; i<multipartFile.length; i++){
      stillcutName[i]= primarykey+"_"+"stillcut"+(i+1)+multipartFile[i].getOriginalFilename().substring(multipartFile[i].getOriginalFilename().lastIndexOf("."));
      stillcut[i]= new File(stillcutName[i]);
      multipartFile[i].transferTo(stillcut[i]);
      ftpSender.upload(stillcut[i], "/stillcut/"+stillcutName[i]);
    }
    
    //출연진 사진 작업
    String act_img_url= primarykey+"_"+fileActors.getOriginalFilename().substring(fileActors.getOriginalFilename().lastIndexOf("."));
    File fileAct_img_url= new File(act_img_url);
    fileActors.transferTo(fileAct_img_url);
    ftpSender.upload(fileAct_img_url, "/act_img/"+act_img_url);
    
    dto.setAct_img_url(act_img_url);

    //작업 완료 후 db에 신규영화 정보 등록
    movieService.insertMovie(dto);
    
    int addedIdx= movieService.nowAddedMovieIDX(); //방금등록한 영화의 고유번호 가져오기
    Map<String, Object> map= new HashMap<>();
    map.put("idx", addedIdx);
    map.put("img_url", stillcutName);
    //stillcut정보 등록
    movieService.insertStillcut(map);
    
    //상태결과값 담아 포워딩
    model.addAttribute("result", "addMovie");

    return "/insang/login/admin_login";
  }

  //영화상세정보 데이터
  @ResponseBody
  @RequestMapping("/movie/movieDetail.do")
  public Map<String, Object> movieDetail(int idx) {
    //영화의 고유번호를 받아 온 후 영화목록중 같은 고유번호가 있을시 해당영화 dto를 map에 저장
    Map<String, Object> map= new HashMap<>();
    for (Insang_MovieDTO foo : movieService.getMovieList()) {
      if (foo.getIdx() == idx) {
        map.put("dto", foo);
      }
    }
    //수정을위한 장르리스트 map에 저장
    map.put("genreList", movieService.getGenreList());
    
    //stillcut받아와서 담기
    map.put("stillcut", movieService.getStillCut(idx));
    
    //자료 리턴
    return map;
  }
  
  //영화 삭제
  @RequestMapping("/movie/delMovie.do")
  public String delMovie(@RequestParam String idx){
    movieService.delMovie(Integer.parseInt(idx));
    return "";
  }//?
  
  //영화 수정
  @RequestMapping("/movie/modMovie.do")
  public String modMovie(HttpServletRequest request, MultipartFile filePreview, MultipartFile filePoster, Model model,
      HttpSession session, @RequestParam MultipartFile[] multipartFile) throws Exception {
    
    FtpClient ftpSender = new FtpClient("");

    // db에 등록된 파일명 null처리
    String originImg = "";
    String originVid = "";
    String originAct = "";
    for (Insang_MovieDTO foo : movieService.getMovieList()) {
      if (foo.getIdx() == Integer.parseInt(request.getParameter("mod_idx"))) {
        originImg = ( foo.getImg_url()==null || foo.getImg_url().equals("null") ) ?
        		"null" : foo.getImg_url();
        originVid = ( foo.getPreview()==null || foo.getPreview().equals("null") ) ?
        		"null" : foo.getPreview();
        originAct = ( foo.getAct_img_url()==null || foo.getAct_img_url().equals("null"))?
            "null" : foo.getAct_img_url();
        break;
      }
    }
    
    //신규등록한 파일이 있을경우 경로를 제외하고 파일명만 뽑아서 변수에 저장
    String re_preview= request.getParameter("preview");
    String re_img_url= request.getParameter("img_url");
    String re_act_img= request.getParameter("act_img_url");
    if (re_preview.indexOf("C:\\fakepath\\")!= -1){
      int start=request.getParameter("preview").lastIndexOf("\\")+1;
      re_preview = request.getParameter("preview").substring(start);
    }
    if (re_img_url.indexOf("C:\\fakepath\\")!= -1){
      int start= request.getParameter("img_url").lastIndexOf("\\")+1;
      re_img_url = request.getParameter("img_url").substring(start);
    }
    if (re_act_img.indexOf("C:\\fakepath\\")!= -1){
      int start= request.getParameter("act_img_url").lastIndexOf("\\")+1;
      re_act_img= request.getParameter("act_img_url").substring(start);
    }
    
    /*
     * form에서 넘어온 데이터 가공 후 dto에 넣기
     */
    long primarykey = System.currentTimeMillis();
    String previewName="";
    String posterName="";
    String act_imgName="";
    //db에 등록된 파일명과 새로 넘어온 파일명이 같을경우 처리
    previewName = (originImg.equals(re_preview)) ? originVid : re_preview;
    posterName = (originVid.equals(re_img_url)) ? originImg : re_img_url;
    act_imgName= (originAct.equals(re_act_img)) ? originAct : re_act_img;
    //dto를 만들어 자료를 저
    Insang_MovieDTO dto = new Insang_MovieDTO();
    dto.setIdx(Integer.parseInt(request.getParameter("mod_idx")));
    dto.setTitle(request.getParameter("title"));
    dto.setAge(Integer.parseInt(request.getParameter("age")));
    dto.setDirector(request.getParameter("director"));
    dto.setActors(request.getParameter("actors"));
    dto.setContent(request.getParameter("content"));
    dto.setGenre(request.getParameter("genre"));
    dto.setRuntime(Integer.parseInt(request.getParameter("runtime")));
    //String형 날짜값 패턴식으로 저장
    Date release_date = null;
    try {
      release_date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("release_date"));
    } catch (ParseException e) {
      e.printStackTrace();
    }
    dto.setRelease_date(release_date);
    dto.setPreview(previewName);
    dto.setImg_url(posterName);
    dto.setAct_img_url(act_imgName);

    /*
     * MultipartFile 동영상 디렉토리에 복사
     *  [ DB없이 localhost로 작업시 지정된 경로에 파일 업로드 ]
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
    
    //파일객체 선언 후 위에 선언한 이름으로 객체에 파일 넣기
    File fPreview = new File(previewName);
    File fPoster = new File(posterName);
    File fActimg= new File(act_imgName);
    FileOutputStream fos = new FileOutputStream(fPreview);
    fos.write(filePreview.getBytes());
    fos.flush();
    fos.close();
    fos = new FileOutputStream(fPoster);
    fos.write(filePoster.getBytes());
    fos.flush();
    fos.close();
    fos = new FileOutputStream(fActimg);
    fos.write(filePoster.getBytes());
    fos.flush();
    fos.close();

    // 이미지 혹은 영상이 바뀌었다면 기존파일 삭제후 재업로드
    if (!originImg.equals(re_img_url)) {
      ftpSender.delete("/img/" + originImg);
      ftpSender.upload(fPoster, "/img/" + posterName);
    }
    if (!originVid.equals(re_preview)) {
      ftpSender.delete("/video/" + originVid);
      ftpSender.upload(fPreview, "/video/" + previewName);
    }
    if (!originAct.equals(re_act_img)){
      ftpSender.delete("/act_img/" + originAct);
      ftpSender.upload(fActimg, "/act_img/"+act_imgName);
    }
    
    //스틸컷 작업
    //multipart파일을 가공하여
    //ftpclient를 이용해 서버에 스틸컷이미지 업로드
    if (!multipartFile[0].getOriginalFilename().equals("")) {
      //기존이미지 삭제
      for (StillcutDTO foo: movieService.getStillCut(Integer.parseInt(request.getParameter("mod_idx")))){
        ftpSender.delete("/stillcut/"+foo.getImg_url());
      }
      //이미지 업로드
      File[] stillcut = new File[multipartFile.length];
      String[] stillcutName = new String[multipartFile.length];
      for (int i = 0; i < multipartFile.length; i++) {
        stillcutName[i] = primarykey + "_" + "stillcut" + (i + 1)
            + multipartFile[i].getOriginalFilename().substring(multipartFile[i].getOriginalFilename().lastIndexOf("."));
        stillcut[i] = new File(stillcutName[i]);
        multipartFile[i].transferTo(stillcut[i]);
        ftpSender.upload(stillcut[i], "/stillcut/" + stillcutName[i]);
      }
      Map<String, Object> map= new HashMap<>();
      map.put("idx", Integer.parseInt(request.getParameter("mod_idx")));
      map.put("img_url", stillcutName);
      //db에서 기존 스틸컷 정보 삭제
      movieService.deleteStillcut(Integer.parseInt(request.getParameter("mod_idx")));
      //stillcut정보 등록
      movieService.insertStillcut(map);
    }

    //모든작업 완료 후 update
    movieService.updateMovie(dto);
    //model에 결과값 저장
    model.addAttribute("result", "modMovie");
    //결과값 반환
    return "/insang/login/admin_login";
  }
  
  //상영시간표 페이지
  @RequestMapping("/movie/batch.do")
  public String batch(Model model){
    //상영시간표 등록을 위한 상영관 리스트 자료
    model.addAttribute("theaterList", theaterService.getTheaterList());
    return "/insang/submenu/sub_movie/movie_batch"; 
  }
  
  //상영시간표 상세정보 검색
  @RequestMapping("/movie/searchBatch.do")
  public String searchBatch(HttpServletRequest request, Model model){
    //시간표 고유번호를 받아온 후 당일 시간표 검색을위한 자료 가공
    int idx= Integer.parseInt(request.getParameter("idx"));
    String[] date= request.getParameter("date").split("-");
    String startdate= date[0]+"-"+date[1]+"-"+date[2];
    Calendar cal= Calendar.getInstance();
    cal.set(Integer.parseInt(date[0]), Integer.parseInt(date[1]), Integer.parseInt(date[2]));
    cal.add(Calendar.DATE, 1);
    String enddate= cal.get(Calendar.YEAR)+"-"+cal.get(Calendar.MONTH)+"-"+cal.get(Calendar.DATE);
    
    //map에 가공된 자료 입력
    Map<String,Object> map= new HashMap<>();
    map.put("startdate", startdate);
    map.put("enddate", enddate);
    map.put("idx", idx);
    
    //당일의 상영시간표 검색 후 리스트 반환 , 검색기능이 풀리지 않게하기위해 상영관번호 다시 반환
    model.addAttribute("scheduleList",movieService.getScheduleList(map));
    model.addAttribute("theater_idx", idx);
    return "/insang/submenu/sub_movie/movie_batch_search";
  }
  
  //상영시간표 등록페이지
  @RequestMapping("/movie/addBatch.do")
  public String addBarch(Model model){
    //상영시간표 등록을 위한 영화관 리스트, 영화 리스트를 반환
    model.addAttribute("theaterList", theaterService.getTheaterList());
    model.addAttribute("movieList", movieService.getMovieList());
    return "/insang/submenu/sub_movie/movie_batch_add";
  }
  
  //상영시간표 등록
  @RequestMapping("/movie/addSchedule.do")
  public String addSchedule(HttpServletRequest request){
    //영화고유번호, 상영관 고유번호, 영화시작시간을 받아와 가공
    int movieIDX= Integer.parseInt(request.getParameter("movieIDX"));
    int theaterIDX= Integer.parseInt(request.getParameter("theaterIDX"));
    String starttime= request.getParameter("starttime")+":00";
    starttime= starttime.substring(0, 10)+" "+starttime.substring(10);
    int seat_now=0;
    //상영관리스트중 고유번호와 일치하는 상영관의 현재사용가능좌석수 가져옴
    List<TheaterDTO> lists= theaterService.getTheaterList();
    for (TheaterDTO dto: lists){
      if (dto.getIdx() == theaterIDX){
        seat_now= dto.getSeat_max();
      }
    }
    //필요한 자료를 map에 담아 모델로 보냄
    Map<String, Object> map= new HashMap<>();
    map.put("movie_idx", movieIDX);
    map.put("theater_idx", theaterIDX);
    map.put("start_time", starttime);
    map.put("empty_sit", seat_now);
    //상영시간표 등록
    movieService.insertSchedule(map);
    //반환페이지
    return "/insang/test";
  }
  
  //상영시간표 수정 페이지
  @RequestMapping("/movie/modSchedulePage.do")
  public String modSchedulePage(HttpServletRequest request, Model model){
    //선택한 상영시간표의 고유값을 받아옴
    int idx= Integer.parseInt(request.getParameter("idx"));
    //상영시간표 상세정보를 반환, 검색기능을위해 영화관리스트, 영화리스트를 반환
    model.addAttribute("dto", movieService.getScheduleDetail(idx));
    model.addAttribute("theaterList", theaterService.getTheaterList());
    model.addAttribute("movieList", movieService.getMovieList());
    return "/insang/submenu/sub_movie/movie_batch_mod";
  }
  
  @ResponseBody
  @RequestMapping("/movie/delSchedulePage.do")
  public boolean delSchedulePage(String idx){
    return movieService.delSchedule(Integer.parseInt(idx));
  }

  //상영시간표 수정
  @RequestMapping("/movie/modSchedule.do")
  public String modSchedule(HttpServletRequest request){
    //수정된 정보를 받아온 후 가공
    int movieIDX= Integer.parseInt(request.getParameter("movieIDX"));
    int theaterIDX= Integer.parseInt(request.getParameter("theaterIDX"));
    int screenIDX= Integer.parseInt(request.getParameter("screenIDX"));
    String starttime= request.getParameter("starttime");
    starttime= starttime.substring(0, 10)+" "+starttime.substring(10);
    int seat_max=0;
    //상영관이 바뀌었을수 있기에 다시한번 현재좌석 받아오기
    List<TheaterDTO> lists= theaterService.getTheaterList();
    for (TheaterDTO dto: lists){
      if (dto.getIdx() == theaterIDX){
        seat_max= dto.getSeat_max();
      }
    }
    //자료를 map에 넣어 모델로 넘김
    Map<String, Object> map= new HashMap<>();
    map.put("movie_idx", movieIDX);
    map.put("theater_idx", theaterIDX);
    map.put("start_time", starttime);
    map.put("empty_sit", seat_max);
    map.put("screen_idx", screenIDX);
    //상영시간표 수정
    movieService.modSchedule(map);
    return "/insang/test";
  }
  
}
