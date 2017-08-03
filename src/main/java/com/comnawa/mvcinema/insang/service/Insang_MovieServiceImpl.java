package com.comnawa.mvcinema.insang.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.insang.model.dao.Insang_MovieDAO;
import com.comnawa.mvcinema.insang.model.dto.GenreDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;
import com.comnawa.mvcinema.insang.model.dto.ScreenInfoDTO;

@Service
public class Insang_MovieServiceImpl implements Insang_MovieService {
  
  @Inject
  Insang_MovieDAO movieDao;

  @Override
  public List<GenreDTO> getGenreList() {
    return movieDao.getGenreList();
  }
  
  @Override
  public void insertMovie(Insang_MovieDTO dto) {
    movieDao.insertMovie(dto);
  }

  @Override
  public List<Insang_MovieDTO> getMovieList() {
    return movieDao.getMovieList();
  }
  
  @Override
  public void updateMovie(Insang_MovieDTO dto) {
    movieDao.updateMovie(dto);
  }
  
  @Override
  public List<ScreenInfoDTO> getScheduleList(Map<String, Object> map) {
    return movieDao.getScheduleList(map);
  }
  
}
