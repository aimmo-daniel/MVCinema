package com.comnawa.mvcinema.insang.model.dto;

public class GenreDTO {
  private int idx;
  private String genre;

  public GenreDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public GenreDTO(int idx, String genre) {
    super();
    this.idx = idx;
    this.genre = genre;
  }

  @Override
  public String toString() {
    return "GenreDTO [idx=" + idx + ", genre=" + genre + "]";
  }

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public String getGenre() {
    return genre;
  }

  public void setGenre(String genre) {
    this.genre = genre;
  }

}
