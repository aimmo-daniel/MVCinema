package com.comnawa.mvcinema.sangjin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.sangjin.model.dto.MemoDTO;
import com.comnawa.mvcinema.sangjin.model.dto.StillcutDTO;
@Repository
public class DetailDAOImpl implements DetailDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public List<StillcutDTO> stillcut(int idx) {
		return sqlSession.selectList("detail.stillcut", idx);
	}

	@Override
	public void insert(MemoDTO dto) {
		sqlSession.insert("detail.insertmemo", dto);
	}
	
	@Override
	public List<MemoDTO> memolist(int start, int end, int idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("idx", idx);
		return sqlSession.selectList("detail.memolist", map);
	}

	@Override
	public int countMemo(int idx) {
		return sqlSession.selectOne("detail.countMemo", idx);
	}

	@Override
	public void delete(int comment_num) {
		sqlSession.delete("detail.deletememo", comment_num);
	}

	@Override
	public void update(MemoDTO dto) {
		sqlSession.update("detail.updatememo", dto);
	}

	@Override
	public String checkUserid(MemoDTO dto) {
		return sqlSession.selectOne("detail.memo_just_one", dto);
	}

}
