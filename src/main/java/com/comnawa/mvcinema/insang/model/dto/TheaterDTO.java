package com.comnawa.mvcinema.insang.model.dto;

public class TheaterDTO {
  private int idx;
  private String name;
  private int seat_max;
  private int seat_out;
  private int price;
  private String preview;

  public TheaterDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public TheaterDTO(int idx, String name, int seat_max, int seat_out, int price, String preview) {
    super();
    this.idx = idx;
    this.name = name;
    this.seat_max = seat_max;
    this.seat_out = seat_out;
    this.price = price;
    this.preview= preview;
  }

  @Override
  public String toString() {
    return "TheaterDTO [idx=" + idx + ", name=" + name + ", seat_max=" + seat_max + ", seat_out=" + seat_out + ", price=" + price
        + ", preview="+preview+"]";
  }
  
  public String getPreview() {
    return preview;
  }
  
  public void setPreview(String preview) {
    this.preview = preview;
  }

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getSeat_max() {
    return seat_max;
  }

  public void setSeat_max(int seat_max) {
    this.seat_max = seat_max;
  }

  public int getSeat_out() {
    return seat_out;
  }

  public void setSeat_out(int seat_out) {
    this.seat_out = seat_out;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

}
