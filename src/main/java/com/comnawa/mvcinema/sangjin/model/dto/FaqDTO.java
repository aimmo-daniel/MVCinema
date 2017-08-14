package com.comnawa.mvcinema.sangjin.model.dto;

public class FaqDTO {
	private int idx;
	private int category_idx;
	private String question;
	private String ask;
	private String category;

	public FaqDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FaqDTO(int idx, int category_idx, String question, String ask, String category) {
		super();
		this.idx = idx;
		this.category_idx = category_idx;
		this.question = question;
		this.ask = ask;
		this.category = category;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAsk() {
		return ask;
	}

	public void setAsk(String ask) {
		this.ask = ask;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "FaqDTO [idx=" + idx + ", category_idx=" + category_idx + ", question=" + question + ", ask=" + ask
				+ ", category=" + category + "]";
	}

}
