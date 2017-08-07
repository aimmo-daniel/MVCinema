package com.comnawa.mvcinema.insang.model.dao;

import java.util.List;
import java.util.Map;

import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitEmptyDTO;

public interface TheaterDAO {
  public List<TheaterDTO> getTheaterList();
  public List<TheaterSitDTO> getTheaterSitList();
  public Map<String, Integer> getMaxIDX();
  public void addTheater(Map<String,Object> map);
  public void updateTheater(Map<String,Object> map);
  public List<TheaterSitEmptyDTO> getTheaterEmpty();
  public void updateSit(String sit, int idx, int sitCount);
}
