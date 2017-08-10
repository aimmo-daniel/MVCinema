package com.comnawa.mvcinema.insang.model.dao;

import java.util.List;
import java.util.Map;

import com.comnawa.mvcinema.insang.model.dto.ContactDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_CategoryDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_FaqDTO;

public interface Insang_ContactDAO {
  public List<ContactDTO> getContactList();
  public ContactDTO getContactDetail(int idx);
  public void insertContactAnswer(ContactDTO dto);
  public void modifyContactAnswer(ContactDTO dto);
  public List<Insang_FaqDTO> getFaqList();
  public List<Insang_CategoryDTO> getCategoryList();
  public void insertCategory(String category);
  public void insertFaq(Map<String, Object> map);
}
