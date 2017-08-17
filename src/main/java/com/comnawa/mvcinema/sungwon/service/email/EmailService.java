package com.comnawa.mvcinema.sungwon.service.email;

import com.comnawa.mvcinema.sungwon.model.ticket.dto.TicketDTO;

public interface EmailService {
	public String rndNum();
	public String SignupMail(String email);
	public String findpwdMail(String email);
	public void ticketMail(TicketDTO dto);
	public String guestMail(String email);
}
