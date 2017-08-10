package com.comnawa.mvcinema.sungwon.model.ticket.dao;

import java.util.Date;
import java.util.List;

import com.comnawa.mvcinema.sungwon.model.ticket.dto.TicketDTO;

public interface TicketDAO {
	public List<TicketDTO> movieList();
	public List<TicketDTO> screen_time(TicketDTO dto);
	public TicketDTO selectMovieInfo(int movie_idx);
	public TicketDTO selectTime(int screen_idx);
	public TicketDTO selectMovieTime(int screen_idx); 
	public List<TicketDTO> soldout_seat(int screen_idx);
	public int insertTicket(TicketDTO dto);
}
