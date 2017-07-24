package com.comnawa.mvcinema.sungwon.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.sungwon.model.member.dao.MemberDAO;
import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;
import com.comnawa.mvcinema.sungwon.service.SHA256;


@Service
public class MemberServiceImpl implements MemberService {


	@Inject
	MemberDAO memberDao;
	@Inject
	SHA256 sha256;
	
	
	
	@Override //아이디 중복확인
	public String checkid(String userid) {
		return memberDao.checkid(userid);
	}
}
