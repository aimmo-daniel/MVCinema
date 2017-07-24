package com.comnawa.mvcinema.sungwon.model.member.dao;

import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;


@Repository 
public interface MemberDAO {
	public String checkid(String userid);
	public String checkemail(String email);
	public void signup(MemberDTO dto);
	public boolean login(MemberDTO dto);
	public MemberDTO viewMember(String userid);
}
