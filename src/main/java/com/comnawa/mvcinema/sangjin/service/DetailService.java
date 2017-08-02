package com.comnawa.mvcinema.sangjin.service;

import java.util.List;

import com.comnawa.mvcinema.sangjin.model.dto.ActorsDTO;
import com.comnawa.mvcinema.sangjin.model.dto.StillcutDTO;

public interface DetailService {
	public List<ActorsDTO> actor_list(int idx);
	public List<StillcutDTO> stillcut(int idx);
}
