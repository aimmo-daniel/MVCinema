package com.comnawa.mvcinema.sangjin.model.dto;

import java.util.Date;

public class MovieDTO {
	private int idx; // 영화번호
	private String title; // 제목
	private int age; // 관람 나이 제한
	private double grade; // 평점
	private int people; // 관람객
	private String director; // 감독
	private String actors; // 출연배우
	private String content; // 줄거리
	private String genre; // 장르
	private Date release_date; // 개봉일
	private int runtime; // 영화시간
	private String img_url; // 포스터이미지 링크
	private String preview; // 예고편 링크
	private String act_img_url; // 배우사진

	public MovieDTO() {
		super();
	}

	public MovieDTO(int idx, String title, int age, double grade, int people, String director, String actors,
			String content, String genre, Date release_date, int runtime, String img_url, String preview,
			String act_img_url) {
		super();
		this.idx = idx;
		this.title = title;
		this.age = age;
		this.grade = grade;
		this.people = people;
		this.director = director;
		this.actors = actors;
		this.content = content;
		this.genre = genre;
		this.release_date = release_date;
		this.runtime = runtime;
		this.img_url = img_url;
		this.preview = preview;
		this.act_img_url = act_img_url;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public Date getRelease_date() {
		return release_date;
	}

	public void setRelease_date(Date release_date) {
		this.release_date = release_date;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}

	public String getAct_img_url() {
		return act_img_url;
	}

	public void setAct_img_url(String act_img_url) {
		this.act_img_url = act_img_url;
	}

	@Override
	public String toString() {
		return "MovieDTO [idx=" + idx + ", title=" + title + ", age=" + age + ", grade=" + grade + ", people=" + people
				+ ", director=" + director + ", actors=" + actors + ", content=" + content + ", genre=" + genre
				+ ", release_date=" + release_date + ", runtime=" + runtime + ", img_url=" + img_url + ", preview="
				+ preview + ", act_img_url=" + act_img_url + "]";
	}

}
