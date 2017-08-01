package com.comnawa.mvcinema.sungwon.service.member;

import javax.servlet.http.HttpSession;

import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;

public interface MemberService {
	public String checkid(String userid);
	public String checkemail(String email);
	public void signup(MemberDTO dto);
	public boolean login(MemberDTO dto,HttpSession session);
	public MemberDTO viewMember(String userid);
	public String findid(MemberDTO dto);
	public String findpwd(MemberDTO dto);
	public int changePwd(String userid, String passwd);
}
