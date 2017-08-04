package com.comnawa.mvcinema.sangjin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.sangjin.model.dao.DetailDAO;
import com.comnawa.mvcinema.sangjin.model.dto.MemoDTO;
import com.comnawa.mvcinema.sangjin.model.dto.StillcutDTO;
@Service
public class DetailServiceImpl implements DetailService {
	@Inject
	DetailDAO detailDao;
	
	@Override
	public List<StillcutDTO> stillcut(int idx) {
		return detailDao.stillcut(idx);
	}

	@Override
	public void insert(MemoDTO dto) {
		detailDao.insert(dto);
	}

	@Override
	public List<MemoDTO> memolist(int idx) {
		return detailDao.memolist(idx);
	}

}
