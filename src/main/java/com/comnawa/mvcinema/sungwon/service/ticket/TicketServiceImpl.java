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

}
