package com.comnawa.mvcinema.insang.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.insang.model.dao.AdminDAO;
import com.comnawa.mvcinema.insang.model.dto.AdminDTO;

@Service
public class AdminServiceImpl implements AdminService {
  
  @Inject
  AdminDAO adminDao;

  @Override
  public boolean login(AdminDTO dto) {
    return adminDao.login(dto);
  }

}
