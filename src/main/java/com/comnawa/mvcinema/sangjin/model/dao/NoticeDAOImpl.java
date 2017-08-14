package com.comnawa.mvcinema.sangjin.model.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.sangjin.model.dto.NoticeDTO;
@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public NoticeDTO notice() {
		return sqlSession.selectOne("support.notice");
	}
}
