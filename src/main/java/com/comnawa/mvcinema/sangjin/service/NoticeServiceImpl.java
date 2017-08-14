package com.comnawa.mvcinema.sangjin.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.sangjin.model.dao.NoticeDAO;
import com.comnawa.mvcinema.sangjin.model.dto.NoticeDTO;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	NoticeDAO noticeDao;

	@Override
	public NoticeDTO notice() {
		return noticeDao.notice();
	}
}
