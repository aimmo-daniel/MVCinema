package com.comnawa.mvcinema.insang.model.dto;

public class Insang_CategoryDTO {
  private int idx;
  private String category;

  public Insang_CategoryDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public Insang_CategoryDTO(int idx, String category) {
    super();
    this.idx = idx;
    this.category = category;
  }

  @Override
  public String toString() {
    return "Insang_CategoryDTO [idx=" + idx + ", category=" + category + "]";
  }

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

}
