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

	@Override
	public TicketDTO selectMovieInfo(int movie_idx) {
		return sqlSession.selectOne("ticket.selectMovie",movie_idx);
	}

	@Override
	public TicketDTO selectTime(int screen_idx) {
		return sqlSession.selectOne("ticket.selectTime",screen_idx);
	}

	@Override
	public TicketDTO selectMovieTime(int screen_idx) {
		return sqlSession.selectOne("ticket.select_movieTime",screen_idx);
	}

	@Override
	public List<TicketDTO> soldout_seat(int screen_idx) {
		return sqlSession.selectList("ticket.soldout_seat",screen_idx);
	}

	@Override
	public int insertTicket(TicketDTO dto) {
		return sqlSession.insert("ticket.insertTicket",dto);
	}

}
