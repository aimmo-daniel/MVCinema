package com.comnawa.mvcinema.insang.model.dto;

import java.util.Calendar;
import java.util.Date;

public class ScreenInfoDTO {
  private int theater_idx;
  private Date start_time;
  private int movie_idx;
  private int empty_sit;
  private String title;
  private String img_url;
  private int runtime;
  private Date end_time;
  private int screen_idx;

  public ScreenInfoDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public ScreenInfoDTO(int theater_idx, Date start_time, int movie_idx, int empty_sit, String title, String img_url, int runtime,
      int screen_idx) {
    super();
    this.theater_idx = theater_idx;
    this.start_time = start_time;
    this.movie_idx = movie_idx;
    this.empty_sit = empty_sit;
    this.title = title;
    this.img_url = img_url;
    this.runtime= runtime;
    this.screen_idx= screen_idx;
  }

  @Override
  public String toString() {
    return "ScreenInfoDTO [theater_idx=" + theater_idx + ", start_time=" + start_time + ", movie_idx=" + movie_idx
        + ", empty_sit=" + empty_sit + ", title=" + title + ", img_url=" + img_url + ", screen_idx="+screen_idx+"]";
  }

  public int getTheater_idx() {
    return theater_idx;
  }

  public void setTheater_idx(int theater_idx) {
    this.theater_idx = theater_idx;
  }

  public Date getstart_time() {
    return start_time;
  }

  public void setstart_time(Date start_time) {
    this.start_time = start_time;
  }

  public int getMovie_idx() {
    return movie_idx;
  }

  public void setMovie_idx(int movie_idx) {
    this.movie_idx = movie_idx;
  }

  public int getEmpty_sit() {
    return empty_sit;
  }

  public void setEmpty_sit(int empty_sit) {
    this.empty_sit = empty_sit;
  }

  public String getImg_url() {
    return img_url;
  }

  public String getTitle() {
    return title;
  }

  public void setImg_url(String img_url) {
    this.img_url = img_url;
  }

  public void setTitle(String title) {
    this.title = title;
  }
  
  public int getRuntime() {
    return runtime;
  }

  public void setRuntime(int runtime) {
    this.runtime = runtime;
  }
  
  public Date getEnd_time(){
    Date sDate= start_time;
    Calendar cal= Calendar.getInstance();
    cal.setTime(sDate);
    cal.add(Calendar.MINUTE, runtime);
    end_time= new Date(cal.getTimeInMillis());
    return end_time;
  }
  
  public int getScreen_idx() {
    return screen_idx;
  }
  
  public void setScreen_idx(int screen_idx) {
    this.screen_idx = screen_idx;
  }
  
}
