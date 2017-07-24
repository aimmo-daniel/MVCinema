package com.comnawa.mvcinema.insang.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.comnawa.mvcinema.insang.model.dto.TheaterDTO;
import com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO;

@Repository
public class TheaterDAOImpl implements TheaterDAO {

  @Inject
  SqlSession sqlSession;
  
  @Override
  public List<TheaterDTO> getTheaterList() {
    return sqlSession.selectList("admin.getTheaterList");
  }

  @Override
  public List<TheaterSitDTO> getTheaterSitList() {
    return sqlSession.selectList("admin.getTheaterSitList");
  }
  
  @Override
  public Map<String, Integer> getMaxIDX() {
    Map<String, Integer> map= new HashMap<>();
    map.put("max", sqlSession.selectOne("admin.getMaxIDX1"));
    map.put("imax", sqlSession.selectOne("admin.getMaxIDX2"));
    map.put("count", sqlSession.selectOne("admin.getCountIDX"));
    return map;
  }
  
  @Override
  @Transactional
  public void addTheater(Map<String, Object> map) {
    sqlSession.insert("admin.addTheater1", map);
    sqlSession.insert("admin.addTheater2", map);
  }
  
}
