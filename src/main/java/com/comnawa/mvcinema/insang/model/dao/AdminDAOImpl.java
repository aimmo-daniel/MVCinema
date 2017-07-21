package com.comnawa.mvcinema.insang.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.insang.model.dto.AdminDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

  @Inject
  SqlSession sqlSession;
  
  @Override
  public boolean login(AdminDTO dto) {
    boolean result= false;
    if (((AdminDTO)sqlSession.selectOne("admin.login", dto))!= null){
      result= true;
    }
    return result;
  }

}
