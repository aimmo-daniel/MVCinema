package com.comnawa.mvcinema.insang.model.dao;

import java.util.List;
import java.util.Map;

import com.comnawa.mvcinema.insang.model.dto.GenreDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;
import com.comnawa.mvcinema.insang.model.dto.ScreenInfoDTO;

public interface Insang_MovieDAO {
  public List<GenreDTO> getGenreList();
  public void insertMovie(Insang_MovieDTO dto);
  public void updateMovie(Insang_MovieDTO dto);
  public List<Insang_MovieDTO> getMovieList();
  public List<ScreenInfoDTO> getScheduleList(Map<String, Object> map);
  public void insertSchedule(Map<String, Object> map);
  public ScreenInfoDTO getScheduleDetail(int idx);
  public void modSchedule(Map<String, Object> map);
}
