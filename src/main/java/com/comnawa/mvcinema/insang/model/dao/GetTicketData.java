package com.comnawa.mvcinema.insang.model.dao;

import java.util.List;

import com.comnawa.mvcinema.insang.model.dto.Insang_TicketDTO;

public interface GetTicketData {
  public List<Insang_TicketDTO> getGuestData();
  public List<Insang_TicketDTO> getMemberData();
}
