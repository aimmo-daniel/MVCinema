package com.comnawa.mvcinema.insang.service;

import java.util.List;
import java.util.Map;

import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitEmptyDTO;

public interface TheaterService {
  public List<TheaterDTO> getTheaterList();
  public List<TheaterSitDTO> getTheaterSitList();
  public Map<String, Integer> getMaxIDX();
  public void addTheater(Map<String, Object> map);
  public void updateTheater(Map<String, Object> map);
  public List<TheaterSitEmptyDTO> getTheaterSitEmpty();
  public void updateSit(String sit, int idx);
}
