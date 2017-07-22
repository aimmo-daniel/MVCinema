package com.comnawa.mvcinema.insang.model.dao;

import java.util.List;

import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;

public interface TheaterDAO {
  public List<TheaterDTO> getTheaterList();
  public List<TheaterSitDTO> getTheaterSitList();
}
