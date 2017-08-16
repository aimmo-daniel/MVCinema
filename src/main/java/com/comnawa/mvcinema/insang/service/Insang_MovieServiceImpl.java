package com.comnawa.mvcinema.insang.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.insang.model.dao.Insang_MovieDAO;
import com.comnawa.mvcinema.insang.model.dto.GenreDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;
import com.comnawa.mvcinema.insang.model.dto.ScreenInfoDTO;
import com.comnawa.mvcinema.sangjin.model.dto.StillcutDTO;

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
  
  @Override
  public void insertSchedule(Map<String, Object> map) {
    movieDao.insertSchedule(map);
  }
  
  @Override
  public ScreenInfoDTO getScheduleDetail(int idx) {
    return movieDao.getScheduleDetail(idx);
  }
  
  @Override
  public void modSchedule(Map<String, Object> map) {
    movieDao.modSchedule(map);
  }
  
  @Override
  public void delMovie(int idx) {
    movieDao.delMovie(idx);
  }
  
  @Override
  public int nowAddedMovieIDX() {
    return movieDao.nowAddedMovieIDX();
  }
  
  @Override
  public void insertStillcut(Map<String, Object> map) {
    movieDao.insertStillcut(map);
  }
  
  @Override
  public List<StillcutDTO> getStillCut(int idx) {
    return movieDao.getStillCut(idx);
  }
  
  @Override
  public void deleteStillcut(int idx) {
    movieDao.deleteStillcut(idx);
  }
  
  @Override
  public boolean delSchedule(int idx) {
    return movieDao.delSchedule(idx);
  }
  
}
