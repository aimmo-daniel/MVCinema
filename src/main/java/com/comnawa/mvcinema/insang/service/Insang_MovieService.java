package com.comnawa.mvcinema.insang.service;

import java.util.List;

import com.comnawa.mvcinema.insang.model.dto.GenreDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;

public interface Insang_MovieService {
  public List<GenreDTO> getGenreList();
  public void insertMovie(Insang_MovieDTO dto);
  public List<Insang_MovieDTO> getMovieList();
}
