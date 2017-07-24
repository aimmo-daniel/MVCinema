package com.comnawa.mvcinema.sungwon.model.member.dao;

import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;


@Repository 
public interface MemberDAO {
	public String checkid(String userid);
	
}
