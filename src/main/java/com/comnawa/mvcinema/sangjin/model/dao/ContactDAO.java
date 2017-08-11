package com.comnawa.mvcinema.sangjin.model.dao;

import java.util.List;

import com.comnawa.mvcinema.sangjin.model.dto.ContactDTO;
import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;

public interface ContactDAO {
	public void insert(ContactDTO dto);
	public ContactDTO oto_view(int idx);
	public List<ContactDTO> oto_list(String userid, int start, int end);
	public int countOto(String userid);
	public MemberDTO userInfo(String userid);
	public void DeleteAll(String userid);
	public void DeleteOne(int idx);
}
