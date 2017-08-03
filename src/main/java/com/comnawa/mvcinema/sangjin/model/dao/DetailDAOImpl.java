package com.comnawa.mvcinema.sangjin.model.dao;

import java.util.List;

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
		sqlSession.insert("detail.memo", dto);
	}

}
