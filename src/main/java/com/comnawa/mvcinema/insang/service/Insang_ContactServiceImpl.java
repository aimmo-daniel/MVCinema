package com.comnawa.mvcinema.insang.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.insang.model.dao.Insang_ContactDAO;
import com.comnawa.mvcinema.insang.model.dto.ContactDTO;

@Service
public class Insang_ContactServiceImpl implements Insang_ContactService{
  
  @Inject
  Insang_ContactDAO contactDao;
  
  @Override
  public List<ContactDTO> getContactList(){
    return contactDao.getContactList();
  }
  
}
