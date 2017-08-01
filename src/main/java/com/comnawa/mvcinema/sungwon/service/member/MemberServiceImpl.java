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



	@Override //이메일 중복확인
	public String checkemail(String email) {
		return memberDao.checkemail(email);
	}



	@Override //회원가입
	public void signup(MemberDTO dto) {
		try {
			sha256 = SHA256.getInstance();
			String shapwd = sha256.getSha256(dto.getPasswd().getBytes());
			dto.setPasswd(shapwd);
			memberDao.signup(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	@Override
	public boolean login(MemberDTO dto, HttpSession session) {
		try {
			String shapwd = sha256.getSha256(dto.getPasswd().getBytes());
			dto.setPasswd(shapwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		boolean result = memberDao.login(dto);
		if (result) {
			MemberDTO dto2 = memberDao.viewMember(dto.getUserid());
			session.setAttribute("dto", dto2);
		}
		return result;
	}

	@Override //로그인 성공후 회원정보전달
	public MemberDTO viewMember(String userid) {
		return memberDao.viewMember(userid);
	}



	@Override
	public String findid(MemberDTO dto) {
		return memberDao.findid(dto);
	}



	@Override
	public String findpwd(MemberDTO dto) {
		return memberDao.findpwd(dto);
	}



	@Override
	public int changePwd(String userid, String passwd) {
		MemberDTO dto = new MemberDTO();
		try {
			String shapwd = sha256.getSha256(passwd.getBytes());
			dto.setUserid(userid);
			dto.setPasswd(shapwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return memberDao.changePwd(dto);
	}



	@Override
	public String checkpwd(MemberDTO dto) {
		try {
			String shapwd = sha256.getSha256(dto.getPasswd().getBytes());
			System.out.println(shapwd);
			dto.setPasswd(shapwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 String name = memberDao.checkpwd(dto); 
		return name;
	}

}
