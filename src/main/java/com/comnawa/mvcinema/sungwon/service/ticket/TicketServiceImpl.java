package com.comnawa.mvcinema.sungwon.service.ticket;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.sungwon.model.ticket.dao.TicketDAO;
import com.comnawa.mvcinema.sungwon.model.ticket.dto.TicketDTO;

@Service
public class TicketServiceImpl implements TicketService {

	@Inject
	TicketDAO ticketDao;
	
	@Override
	public List<TicketDTO> movieList() {
		return ticketDao.movieList();
	}

	@Override
	public List<TicketDTO> screen_time(String start_date , String end_date,int movie_idx) {
		TicketDTO dto = new TicketDTO();
		dto.setMovie_idx(movie_idx);
		dto.setStart_date(start_date);;
		dto.setEnd_date(end_date);
		return ticketDao.screen_time(dto);
	}

	@Override
	public TicketDTO selectMovieInfo(int movie_idx) {
		return ticketDao.selectMovieInfo(movie_idx);
	}

	@Override
	public TicketDTO selectTime(int screen_idx) {
		return ticketDao.selectTime(screen_idx);
	}

	@Override
	public TicketDTO selectMovieTime(int screen_idx) {
		return ticketDao.selectMovieTime(screen_idx);
	}

	@Override
	public List<TicketDTO> soldout_seat(int screen_idx) {
		return ticketDao.soldout_seat(screen_idx);
	}

}
