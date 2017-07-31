package com.comnawa.mvcinema.sungwon.model.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	

	@Override
	public String checkid(String userid) {
		return sqlSession.selectOne("member.check_id",userid);
	}


	@Override
	public String checkemail(String email) {
		return sqlSession.selectOne("member.check_email",email);
	}


	@Override
	public void signup(MemberDTO dto) {
		sqlSession.insert("member.signup",dto);
		
	}


	@Override
	public boolean login(MemberDTO dto) {
		String name = sqlSession.selectOne("member.login",dto);
		return name == null? false : true;
	}
	
	@Override
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.view_member",userid);
	}


	@Override
	public String findid(MemberDTO dto) {
		return sqlSession.selectOne("member.find_id",dto);
	}


	@Override
	public String findpwd(MemberDTO dto) {
		return sqlSession.selectOne("member.find_pwd",dto);
	}


	@Override
	public int changePwd(MemberDTO dto) {
		return sqlSession.update("member.change_pwd",dto);
	}


}
