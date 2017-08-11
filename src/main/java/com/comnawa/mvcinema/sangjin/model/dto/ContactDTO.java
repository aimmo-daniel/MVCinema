package com.comnawa.mvcinema.sangjin.model.dto;

import java.util.Date;

public class ContactDTO {
	private int idx; // 글번호
	private String userid; // 사용자아이디
	private String name; // 사용자 이름
	private int age; // 나이?
	private String email; //이메일
	private String title; // 글제목
	private Date post_date; // 작성일
	private String content; // 문의내용
	private String img_url; // 첨부이미지
	private String admin_content; // 답변내용
	private Date admin_post_date; // 답변일

	public ContactDTO() {
		super();
	}

	public ContactDTO(int idx, String userid, String name, int age, String email, String title, Date post_date,
			String content, String img_url, String admin_content, Date admin_post_date) {
		super();
		this.idx = idx;
		this.userid = userid;
		this.name = name;
		this.age = age;
		this.email = email;
		this.title = title;
		this.post_date = post_date;
		this.content = content;
		this.img_url = img_url;
		this.admin_content = admin_content;
		this.admin_post_date = admin_post_date;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getAdmin_content() {
		return admin_content;
	}

	public void setAdmin_content(String admin_content) {
		this.admin_content = admin_content;
	}

	public Date getAdmin_post_date() {
		return admin_post_date;
	}

	public void setAdmin_post_date(Date admin_post_date) {
		this.admin_post_date = admin_post_date;
	}

	@Override
	public String toString() {
		return "ContactDTO [idx=" + idx + ", userid=" + userid + ", name=" + name + ", age=" + age + ", email=" + email
				+ ", title=" + title + ", post_date=" + post_date + ", content=" + content + ", img_url=" + img_url
				+ ", admin_content=" + admin_content + ", admin_post_date=" + admin_post_date + "]";
	}

}
