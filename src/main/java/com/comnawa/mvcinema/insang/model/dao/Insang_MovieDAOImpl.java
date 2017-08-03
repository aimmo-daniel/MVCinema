package com.comnawa.mvcinema.insang.model.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.insang.model.dto.GenreDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;
import com.comnawa.mvcinema.insang.model.dto.ScreenInfoDTO;

@Repository
public class Insang_MovieDAOImpl implements Insang_MovieDAO{
  
  @Inject
  SqlSession sqlSession;
  
  @Override
  public List<GenreDTO> getGenreList() {
    return sqlSession.selectList("admin.genreList");
  }
  
  @Override
  public void insertMovie(Insang_MovieDTO dto) {
    sqlSession.insert("admin.insertMovie", dto);
  }
  
  @Override
  public List<Insang_MovieDTO> getMovieList() {
    return sqlSession.selectList("admin.movieList");
  }
  
  @Override
  public void updateMovie(Insang_MovieDTO dto) {
    sqlSession.update("admin.updateMovie", dto);
  }
  
  @Override
  public List<ScreenInfoDTO> getScheduleList(Map<String, Object> map) {
    return sqlSession.selectList("admin.scheduleList", map);
  }
  
}
