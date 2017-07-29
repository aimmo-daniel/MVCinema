package com.comnawa.mvcinema.insang.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.insang.model.dao.Insang_MovieDAO;
import com.comnawa.mvcinema.insang.model.dto.GenreDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;

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

}
