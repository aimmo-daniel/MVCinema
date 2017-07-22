package com.comnawa.mvcinema.insang.service;

import java.util.List;
import java.util.Map;

import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;

public interface TheaterService {
  public List<TheaterDTO> getTheaterList();
  public List<TheaterSitDTO> getTheaterSitList();
  public Map<String, Integer> getMaxIDX();
}
