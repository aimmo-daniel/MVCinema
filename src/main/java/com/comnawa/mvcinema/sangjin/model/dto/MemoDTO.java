package com.comnawa.mvcinema.sangjin.model.dto;

import java.util.Date;

public class MemoDTO {
	private int idx; // 영화번호
	private int comment_num; // 댓글번호
	private String userid; // 사용자아이디
	private double score; //평점
	private String memo; // 댓글내용
	private Date post_date; // 댓글작성시간

	public MemoDTO() {
		super();
	}

	public MemoDTO(int idx, int comment_num, String userid, double score, String memo, Date post_date) {
		super();
		this.idx = idx;
		this.comment_num = comment_num;
		this.userid = userid;
		this.score = score;
		this.memo = memo;
		this.post_date = post_date;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	@Override
	public String toString() {
		return "MemoDTO [idx=" + idx + ", comment_num=" + comment_num + ", userid=" + userid + ", score=" + score
				+ ", memo=" + memo + ", post_date=" + post_date + "]";
	}

}
