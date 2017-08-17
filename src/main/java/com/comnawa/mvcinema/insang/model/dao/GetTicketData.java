package com.comnawa.mvcinema.insang.model.dao;

import java.util.List;

import com.comnawa.mvcinema.sungwon.model.ticket.dto.TicketDTO;

public interface GetTicketData {
  public List<TicketDTO> getGuestData();
  public List<TicketDTO> getMemberData();
}
