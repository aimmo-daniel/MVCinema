package com.comnawa.mvcinema.sangjin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.sangjin.model.dto.FaqDTO;

@Repository
public class FaqDAOImpl implements FaqDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public int countFaq(String keyword){
		return sqlSession.selectOne("support.countFaq", keyword);
	}

	@Override
	public List<FaqDTO> list_faq(int start, int end, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("support.list_faq", map);
	}

	@Override
	public FaqDTO faq_view(int idx) {
		return sqlSession.selectOne("support.faq_view", idx);
	}

}
