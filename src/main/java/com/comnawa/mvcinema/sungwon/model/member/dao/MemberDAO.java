package com.comnawa.mvcinema.sungwon.model.member.dao;

import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;


@Repository 
public interface MemberDAO {
	public String checkid(String userid);
	public String checkemail(String email);
	public String checkpwd(MemberDTO dto);
	public void signup(MemberDTO dto);
	public boolean login(MemberDTO dto);
	public MemberDTO viewMember(String userid);
	public String findid(MemberDTO dto);
	public String findpwd(MemberDTO dto);
	public int changePwd(MemberDTO dto);
	public int signout(String userid);
}
