package com.comnawa.mvcinema.insang.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.insang.model.dao.TheaterDAO;
import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;

@Service
public class TheaterServiceImpl implements TheaterService {

  @Inject
  TheaterDAO theaterDao;
  
  @Override
  public List<TheaterDTO> getTheaterList() {
    return theaterDao.getTheaterList();
  }

  @Override
  public List<TheaterSitDTO> getTheaterSitList() {
    return theaterDao.getTheaterSitList();
  }
  
  @Override
  public Map<String, Integer> getMaxIDX() {
    return theaterDao.getMaxIDX();
  }
  
  @Override
  public void addTheater(Map<String, Object> map) {
    theaterDao.addTheater(map);
  }
  
  @Override
  public void updateTheater(Map<String, Object> map) {
    theaterDao.updateTheater(map);
  }
  
}
