package com.comnawa.mvcinema.sungwon.service.member;

import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;

public interface MemberService {
	public String checkid(String userid);
	public String checkemail(String email);
	public void signup(MemberDTO dto);
}
