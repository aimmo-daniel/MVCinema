package com.comnawa.mvcinema.insang.model.dto;

import java.util.Date;

public class ScreenInfoDTO {
  private int theater_idx;
  private Date start_date;
  private int movie_idx;
  private int empty_sit;

  public ScreenInfoDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public ScreenInfoDTO(int theater_idx, Date start_date, int movie_idx, int empty_sit) {
    super();
    this.theater_idx = theater_idx;
    this.start_date = start_date;
    this.movie_idx = movie_idx;
    this.empty_sit = empty_sit;
  }

  @Override
  public String toString() {
    return "ScreenInfoDTO [theater_idx=" + theater_idx + ", start_date=" + start_date + ", movie_idx=" + movie_idx
        + ", empty_sit=" + empty_sit + "]";
  }

  public int getTheater_idx() {
    return theater_idx;
  }

  public void setTheater_idx(int theater_idx) {
    this.theater_idx = theater_idx;
  }

  public Date getStart_date() {
    return start_date;
  }

  public void setStart_date(Date start_date) {
    this.start_date = start_date;
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

}
