package com.comnawa.mvcinema.insang.model.dao;

import java.util.List;

import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;

public interface TheaterDAO {
  public List<TheaterDTO> getTheaterList();
}
