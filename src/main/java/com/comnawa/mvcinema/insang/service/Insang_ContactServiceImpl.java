package com.comnawa.mvcinema.insang.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.insang.model.dao.Insang_ContactDAO;
import com.comnawa.mvcinema.insang.model.dto.ContactDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_CategoryDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_FaqDTO;
import com.comnawa.mvcinema.sangjin.model.dto.NoticeDTO;

@Service
public class Insang_ContactServiceImpl implements Insang_ContactService{
  
  @Inject
  Insang_ContactDAO contactDao;
  
  @Override
  public List<ContactDTO> getContactList(){
    return contactDao.getContactList();
  }
  
  @Override
  public ContactDTO getContactDetail(int idx) {
    return contactDao.getContactDetail(idx);
  }
  
  @Override
  public void insertContactAnswer(ContactDTO dto) {
    contactDao.insertContactAnswer(dto);
  }
  
  @Override
  public void modifyContactAnswer(ContactDTO dto) {
    contactDao.modifyContactAnswer(dto);
  }
  
  @Override
  public List<Insang_FaqDTO> getFaqList() {
    return contactDao.getFaqList();
  }
  
  @Override
  public List<Insang_CategoryDTO> getCategoryList() {
    return contactDao.getCategoryList();
  }
  
  @Override
  public void insertCategory(String category) {
    contactDao.insertCategory(category);
  }
  
  @Override
  public void insertFaq(Map<String, Object> map) {
    contactDao.insertFaq(map);
  }
  
  @Override
  public boolean deleteFaq(int idx) {
    return contactDao.deleteFaq(idx);
  }
  
  @Override
  public boolean deleteCategory(int idx) {
    return contactDao.deleteCategory(idx);
  }
  
  @Override
  public NoticeDTO getNotice() {
    return contactDao.getNotice();
  }
  
  @Override
  public boolean modifyNotice(Map<String, Object> map) {
    return contactDao.modifyNotice(map);
  }
  
}
