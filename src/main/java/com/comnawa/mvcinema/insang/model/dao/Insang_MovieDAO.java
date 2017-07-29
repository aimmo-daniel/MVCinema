package com.comnawa.mvcinema.insang.model.dao;

import java.util.List;

import com.comnawa.mvcinema.insang.model.dto.GenreDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;

public interface Insang_MovieDAO {
  public List<GenreDTO> getGenreList();
  public void insertMovie(Insang_MovieDTO dto);
}
