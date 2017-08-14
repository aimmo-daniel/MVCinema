package com.comnawa.mvcinema.sangjin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.comnawa.mvcinema.sangjin.model.dto.ContactDTO;
import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;

@Repository
public class ContactDAOImpl implements ContactDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public void insert(ContactDTO dto) {
		sqlSession.insert("support.insert", dto);
	}

	@Override
	public List<ContactDTO> oto_list(String userid, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("support.oto_list", map);
	}

	@Override
	public ContactDTO oto_view(int idx) {
		return sqlSession.selectOne("support.oto_view", idx);
	}

	@Override
	public int countOto(String userid) {
		return sqlSession.selectOne("support.countOto", userid);
	}

	@Override
	public MemberDTO userInfo(String userid) {
		return sqlSession.selectOne("support.userInfo", userid);
	}

	@Override
	public void DeleteAll(String userid) {
		sqlSession.delete("support.deleteAll", userid);
	}

	@Override
	public void DeleteOne(int idx) {
		sqlSession.delete("support.deleteOne", idx);
	}

}
