package com.comnawa.mvcinema.insang.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;

@Repository
public class TheaterDAOImpl implements TheaterDAO {

  @Inject
  SqlSession sqlSession;
  
  @Override
  public List<TheaterDTO> getTheaterList() {
    return sqlSession.selectList("admin.getTheaterList");
  }

}
