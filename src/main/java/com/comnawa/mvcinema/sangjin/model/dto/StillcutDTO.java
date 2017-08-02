package com.comnawa.mvcinema.sangjin.model.dto;

public class StillcutDTO {
	private int idx;
	private String img_url;

	public StillcutDTO() {
		super();
	}

	public StillcutDTO(int idx, String img_url) {
		super();
		this.idx = idx;
		this.img_url = img_url;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	@Override
	public String toString() {
		return "StillcutDTO [idx=" + idx + ", img_url=" + img_url + "]";
	}

}
