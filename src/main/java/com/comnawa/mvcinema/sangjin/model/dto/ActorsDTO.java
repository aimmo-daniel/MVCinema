package com.comnawa.mvcinema.sangjin.model.dto;

public class ActorsDTO {
	private int idx;
	private String name;
	private String img_url;

	public ActorsDTO() {
		super();
	}

	public ActorsDTO(int idx, String name, String img_url) {
		super();
		this.idx = idx;
		this.name = name;
		this.img_url = img_url;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	@Override
	public String toString() {
		return "ActorsDTO [idx=" + idx + ", name=" + name + ", img_url=" + img_url + "]";
	}

}
