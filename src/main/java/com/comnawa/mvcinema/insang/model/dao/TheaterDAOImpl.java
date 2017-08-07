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
import com.comnawa.mvcinema.insang.model.dto.TheaterSitEmptyDTO;

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
  
  @Transactional
  @Override
  public void addTheater(Map<String, Object> map) {
    sqlSession.insert("admin.addTheater1", map);
    sqlSession.insert("admin.addTheater2", map);
  }
  
  @Transactional
  @Override
  public void updateTheater(Map<String, Object> map) {
    sqlSession.update("admin.updateTheater1", map);
    sqlSession.update("admin.updateTheater2", map);
  }
  
  @Override
  public List<TheaterSitEmptyDTO> getTheaterEmpty() {
    return sqlSession.selectList("admin.theaterSitEmpty");
  }
  
  @Transactional
  @Override
  public void updateSit(String sit, int idx, int sitCount) {
    sqlSession.delete("admin.deleteSit", idx);
    String[] str= sit.split(",");
    for (String t: str){
      Map<String, Object> map= new HashMap<>();
      map.put("sit", t);
      map.put("idx", idx);
      sqlSession.insert("admin.updateSit", map);
    }
    Map<String, Object> map1= new HashMap<>();
    map1.put("sitCount", sitCount);
    map1.put("idx", idx);
    sqlSession.update("admin.maxSitUpdate", map1);
    sqlSession.update("admin.emptySitUpdate",map1);
  }
  
}
