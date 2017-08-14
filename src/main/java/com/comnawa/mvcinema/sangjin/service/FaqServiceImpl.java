package com.comnawa.mvcinema.sangjin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.sangjin.model.dao.FaqDAO;
import com.comnawa.mvcinema.sangjin.model.dto.FaqDTO;

@Service
public class FaqServiceImpl implements FaqService {
	@Inject
	FaqDAO faqDao;

	@Override
	public int countFaq(String keyword){
		return faqDao.countFaq(keyword);
	}

	@Override
	public List<FaqDTO> list_faq(int start, int end, String keyword) throws Exception {
		return faqDao.list_faq(start, end, keyword);
	}

	@Override
	public FaqDTO faq_view(int idx) {
		return faqDao.faq_view(idx);
	}

}
