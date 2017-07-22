package com.comnawa.mvcinema.insang.model.dto;

public class TheaterSitDTO {
  private int idx;
  private int seat_row;
  private int seat_col;
  private String seat_empty;

  public TheaterSitDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public TheaterSitDTO(int idx, int seat_row, int seat_col, String seat_empty) {
    super();
    this.idx = idx;
    this.seat_row = seat_row;
    this.seat_col = seat_col;
    this.seat_empty = seat_empty;
  }

  @Override
  public String toString() {
    return "TheaterSitDTO [idx=" + idx + ", seat_row=" + seat_row + ", seat_col=" + seat_col + ", seat_empty=" + seat_empty + "]";
  }

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public int getSeat_row() {
    return seat_row;
  }

  public void setSeat_row(int seat_row) {
    this.seat_row = seat_row;
  }

  public int getSeat_col() {
    return seat_col;
  }

  public void setSeat_col(int seat_col) {
    this.seat_col = seat_col;
  }

  public String getseat_empty() {
    return seat_empty;
  }

  public void setseat_empty(String seat_empty) {
    this.seat_empty = seat_empty;
  }

}
