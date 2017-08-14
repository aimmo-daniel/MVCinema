package com.comnawa.mvcinema.sangjin.service;

import java.util.List;

import com.comnawa.mvcinema.sangjin.model.dto.FaqDTO;

public interface FaqService {
	public int countFaq(String keyword);
	public FaqDTO faq_view(int idx);
	public List<FaqDTO> list_faq(int start, int end, String keyword) throws Exception;
}
