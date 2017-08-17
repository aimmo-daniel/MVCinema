package com.comnawa.mvcinema.insang.service;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.insang.model.dao.GetTicketData;
import com.comnawa.mvcinema.sungwon.model.ticket.dto.TicketDTO;

@Service
public class ChartServiceImpl implements ChartService{

  @Inject
  GetTicketData ticketData;
  
  @Override
  public JSONObject getChartData(String member, String age, String movie) {
    List<TicketDTO> guestData= ticketData.getGuestData();
    List<TicketDTO> memberData= ticketData.getMemberData();
    
    JSONObject result= new JSONObject();
    return null;
  }
  
}
