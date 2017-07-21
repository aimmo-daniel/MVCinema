package com.comnawa.mvcinema.insang.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.insang.model.dao.TheaterDAO;
import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;

@Service
public class TheaterServiceImpl implements TheaterService {

  @Inject
  TheaterDAO theaterDao;
  
  @Override
  public List<TheaterDTO> getTheaterList() {
    return theaterDao.getTheaterList();
  }

}
