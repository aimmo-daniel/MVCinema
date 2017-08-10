package com.comnawa.mvcinema.insang.model.dto;

import java.util.Date;

public class ContactDTO {
  private int idx;
  private String userid;
  private String name;
  private int age;
  private String title;
  private Date post_date;
  private String content;
  private String img_url;

  public ContactDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public ContactDTO(int idx, String userid, String title, Date post_date, String content, String img_url, String name, int age) {
    super();
    this.idx = idx;
    this.userid = userid;
    this.title = title;
    this.post_date = post_date;
    this.content = content;
    this.img_url = img_url;
    this.name = name;
    this.age = age;
  }

  @Override
  public String toString() {
    return "ContactDTO [idx=" + idx + ", userid=" + userid + ", title=" + title + ", post_date=" + post_date + ", content="
        + content + ", img_url=" + img_url + ", name=" + name + ", age=" + age + "]";
  }

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public String getUserid() {
    return userid;
  }

  public void setUserid(String userid) {
    this.userid = userid;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Date getPost_date() {
    return post_date;
  }

  public void setPost_date(Date post_date) {
    this.post_date = post_date;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getImg_url() {
    return img_url;
  }

  public void setImg_url(String img_url) {
    this.img_url = img_url;
  }

  public void setAge(int age) {
    this.age = age;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getAge() {
    return age;
  }

  public String getName() {
    return name;
  }

}
