package com.comnawa.mvcinema.insang.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.insang.model.dto.ContactDTO;

@Repository
public class Insang_ContactDAOImpl implements Insang_ContactDAO{

  @Inject
  SqlSession sqlSession;
  
  @Override
  public List<ContactDTO> getContactList() {
    return sqlSession.selectList("admin.getContactList");
  }
  
}
