package com.comnawa.mvcinema.sungwon.service.ticket;

import java.util.Date;
import java.util.List;

import com.comnawa.mvcinema.sungwon.model.ticket.dto.TicketDTO;

public interface TicketService {
	public List<TicketDTO> movieList();
	public List<TicketDTO> screen_time(String start_date , String end_date,int movie_idx);
	public TicketDTO selectMovieInfo(int movie_idx);
	public TicketDTO selectTime(int screen_idx);
	public TicketDTO selectMovieTime(int screen_idx); 
	public List<TicketDTO> soldout_seat(int screen_idx);
	public int insertTicket(TicketDTO dto);
	public List<TicketDTO> myTicketList(String t_userid);
	public int cancel(TicketDTO dto);
	public int delete_ticket(String t_serial_num);
	public List<TicketDTO> date_screen_time(String start_date , String end_date);
	public TicketDTO date_selectTime(int screen_idx);
}

