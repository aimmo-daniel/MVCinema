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

	@Override
	public int updatepeople(TicketDTO dto) {
		return sqlSession.update("ticket.updatepeople",dto);
	}

	@Override
	public int discount_seat(TicketDTO dto) {
		return sqlSession.update("ticket.discountseat",dto);
	}

	@Override
	public int updateSeat(TicketDTO dto) {
		return sqlSession.insert("ticket.update_outseat",dto);
	}

	@Override
	public List<TicketDTO> myTicketList(String t_userid) {
		return sqlSession.selectList("ticket.myTicketList",t_userid);
	}

	@Override
	public int cancelTicket(int ticket_idx) {
		return sqlSession.delete("ticket.cancel_ticket",ticket_idx);
	}

	@Override
	public int cancelSeat(TicketDTO dto) {
		return sqlSession.delete("ticket.cancel_seat",dto);
	}

	@Override
	public int plus_seat(TicketDTO dto) {
		return sqlSession.update("ticket.plus_seat",dto);
	}

	@Override
	public int minus_people(TicketDTO dto) {
		return sqlSession.update("ticket.minus_people",dto);
	}

	@Override
	public int delete_ticket(String t_serial_num) {
		return sqlSession.delete("ticket.delete_ticket",t_serial_num);
	}

	@Override
	public List<TicketDTO> date_screen_time(TicketDTO dto) {
		System.out.println("디에이오"+dto.toString());
		return sqlSession.selectList("ticket.date_screenTime",dto);
	}

	@Override
	public TicketDTO date_selectTime(int screen_idx) {
		return sqlSession.selectOne("ticket.date_selectTime",screen_idx);
	}

}
