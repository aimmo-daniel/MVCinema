package com.comnawa.mvcinema.sungwon.service.ticket;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Transactional
	@Override
	public int insertTicket(TicketDTO dto) {
		ticketDao.discount_seat(dto);
		ticketDao.updatepeople(dto);
		String tmp_seat = dto.getT_seat();
		String out_seat[] = tmp_seat.split(",");
		for(int i=0; i<out_seat.length; i++){
			dto.setSeat_out(out_seat[i]);
			ticketDao.updateSeat(dto);
		}
		return ticketDao.insertTicket(dto);
	}

	@Override
	public List<TicketDTO> myTicketList(String t_userid) {
		return ticketDao.myTicketList(t_userid);
	}
	
	@Transactional
	@Override
	public int cancel(TicketDTO dto) {
		int ticket_idx = dto.getTicket_idx(); 
		int result = ticketDao.cancelTicket(ticket_idx);
		TicketDTO dto2 = new TicketDTO();
		String seat_out[] = dto.getT_seat().split(",");
		for(int i=0; i<seat_out.length; i++){
			dto2.setScreen_idx(dto.getScreen_idx());
			dto2.setSeat_out(seat_out[i]);
			result = ticketDao.cancelSeat(dto2);
		}
		dto.setT_people(seat_out.length);
		result = ticketDao.plus_seat(dto);
		result = ticketDao.minus_people(dto);
		return result;
	}

	@Override
	public int delete_ticket(String t_serial_num) {
		return ticketDao.delete_ticket(t_serial_num);
	}

	@Override
	public List<TicketDTO> date_screen_time(String start_date, String end_date) {
		TicketDTO dto = new TicketDTO();
		dto.setStart_date(start_date);;
		dto.setEnd_date(end_date);
		System.out.println("서비스"+dto.toString());
		return ticketDao.date_screen_time(dto);
	}

	@Override
	public TicketDTO date_selectTime(int screen_idx) {
		return ticketDao.date_selectTime(screen_idx);
	}

}
