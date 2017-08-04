package com.comnawa.mvcinema.sungwon.model.ticket.dto;

import java.util.Date;

public class TicketDTO {
	/*---------------------영화정보-------------------------*/
	private int movie_idx; // 영화 정보
	private String title; // 제목
	private int age; // 관람 나이 제한
	private int people; // 관람객
	private Date release_date; // 개봉일
	private int runtime; // 영화시간
	/*-------------------영화 상영  정보------------------------------*/
	private int theater_idx; // 상영관 정보
	private Date start_time; // 상영 시간
	private String start_date;
	private String end_date;
	private int empty_sit; // 남은좌석
	/*-------------------상영관  정보------------------------------*/
	private int screen_idx;
	private int t_idx;
	private String t_name;
	private int seat_max;
	private int seat_out;
	private int price;

	public int getMovie_idx() {
		return movie_idx;
	}

	public void setMovie_idx(int movie_idx) {
		this.movie_idx = movie_idx;
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

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
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

	public int getTheater_idx() {
		return theater_idx;
	}

	public void setTheater_idx(int theater_idx) {
		this.theater_idx = theater_idx;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getEmpty_sit() {
		return empty_sit;
	}

	public void setEmpty_sit(int empty_sit) {
		this.empty_sit = empty_sit;
	}

	public int getScreen_idx() {
		return screen_idx;
	}

	public void setScreen_idx(int screen_idx) {
		this.screen_idx = screen_idx;
	}

	public int getT_idx() {
		return t_idx;
	}

	public void setT_idx(int t_idx) {
		this.t_idx = t_idx;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
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

	public TicketDTO() {
		// TODO Auto-generated constructor stub
	}

	public TicketDTO(int movie_idx, String title, int age, int people, Date release_date, int runtime, int theater_idx,
			Date start_time, String start_date, String end_date, int empty_sit, int screen_idx, int t_idx,
			String t_name, int seat_max, int seat_out, int price) {
		super();
		this.movie_idx = movie_idx;
		this.title = title;
		this.age = age;
		this.people = people;
		this.release_date = release_date;
		this.runtime = runtime;
		this.theater_idx = theater_idx;
		this.start_time = start_time;
		this.start_date = start_date;
		this.end_date = end_date;
		this.empty_sit = empty_sit;
		this.screen_idx = screen_idx;
		this.t_idx = t_idx;
		this.t_name = t_name;
		this.seat_max = seat_max;
		this.seat_out = seat_out;
		this.price = price;
	}

	@Override
	public String toString() {
		return "TicketDTO [movie_idx=" + movie_idx + ", title=" + title + ", age=" + age + ", people=" + people
				+ ", release_date=" + release_date + ", runtime=" + runtime + ", theater_idx=" + theater_idx
				+ ", start_time=" + start_time + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", empty_sit=" + empty_sit + ", screen_idx=" + screen_idx + ", t_idx=" + t_idx + ", t_name=" + t_name
				+ ", seat_max=" + seat_max + ", seat_out=" + seat_out + ", price=" + price + "]";
	}

}