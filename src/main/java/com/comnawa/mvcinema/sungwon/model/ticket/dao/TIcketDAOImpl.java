package com.comnawa.mvcinema.sungwon.model.ticket.dao;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.sungwon.model.ticket.dto.TicketDTO;

@Repository
public class TIcketDAOImpl implements TicketDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public List<TicketDTO> movieList() {
		return sqlSession.selectList("ticket.movieList");
	}

	@Override
	public List<TicketDTO> screen_time(TicketDTO dto) {
		return sqlSession.selectList("ticket.screenTime",dto);
	}

}