package com.comnawa.mvcinema.insang.model.dto;

public class TheaterSitEmptyDTO {
  private int idx;
  private String seat_empty;

  public TheaterSitEmptyDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public TheaterSitEmptyDTO(int idx, String seat_empty) {
    super();
    this.idx = idx;
    this.seat_empty = seat_empty;
  }

  @Override
  public String toString() {
    return "TheaterSitEmptyDTO [idx=" + idx + ", seat_empty=" + seat_empty + "]";
  }

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public String getSeat_empty() {
    return seat_empty;
  }

  public void setSeat_empty(String seat_empty) {
    this.seat_empty = seat_empty;
  }

}
