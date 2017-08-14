package com.comnawa.mvcinema.sangjin.model.dto;

import java.util.Date;

public class NoticeDTO {
	private String title;
	private String content;
	private Date post_date;

	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(String title, String content, Date post_date) {
		super();
		this.title = title;
		this.content = content;
		this.post_date = post_date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	@Override
	public String toString() {
		return "NoticeDTO [title=" + title + ", content=" + content + ", post_date=" + post_date + "]";
	}

}
