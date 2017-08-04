package com.comnawa.mvcinema.sangjin.service;

import java.util.List;

import com.comnawa.mvcinema.sangjin.model.dto.MemoDTO;
import com.comnawa.mvcinema.sangjin.model.dto.StillcutDTO;

public interface DetailService {
	public List<StillcutDTO> stillcut(int idx);
	public void insert(MemoDTO dto);
	public List<MemoDTO> memolist(int idx);
}
