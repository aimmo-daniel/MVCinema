package com.comnawa.mvcinema.sangjin.model.dao;

import java.util.List;

import com.comnawa.mvcinema.sangjin.model.dto.MemoDTO;
import com.comnawa.mvcinema.sangjin.model.dto.StillcutDTO;

public interface DetailDAO {
	public List<StillcutDTO> stillcut(int idx);
	public void insert(MemoDTO dto);
}
