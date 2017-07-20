package com.comnawa.mvcinema.insang.model.dto;

public class AdminDTO {
  private String id;
  private String passwd;

  public AdminDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public AdminDTO(String id, String passwd) {
    super();
    this.id = id;
    this.passwd = passwd;
  }

  @Override
  public String toString() {
    return "AdminDTO [id=" + id + ", passwd=" + passwd + "]";
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPasswd() {
    return passwd;
  }

  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }

}
