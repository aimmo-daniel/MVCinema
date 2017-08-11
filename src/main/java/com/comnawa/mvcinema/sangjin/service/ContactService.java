package com.comnawa.mvcinema.sangjin.service;

import java.util.List;

import com.comnawa.mvcinema.sangjin.model.dto.ContactDTO;
import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;

public interface ContactService {
	public List<ContactDTO> oto_list(String userid, int start, int end);
	public ContactDTO oto_view(int idx);
	public void insert(ContactDTO dto);
	public int countOto(String userid);
	public MemberDTO userInfo(String userid);
	public void DeleteAll(String userid);
	public void DeleteOne(int idx);
}
