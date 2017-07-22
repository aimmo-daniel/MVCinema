package com.comnawa.mvcinema.insang.service;

import java.util.List;

import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;

public interface TheaterService {
  public List<TheaterDTO> getTheaterList();
  public List<TheaterSitDTO> getTheaterSitList();
}
