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
	public List<MemoDTO> memolist(int start, int end, int idx) {
		return detailDao.memolist(start, end, idx);
	}

	@Override
	public int countMemo(int idx) {
		return detailDao.countMemo(idx);
	}

	@Override
	public void delete(int comment_num) {
		detailDao.delete(comment_num);
	}

	@Override
	public void update(MemoDTO dto) {
		detailDao.update(dto);
	}

}
