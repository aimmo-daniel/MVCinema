package com.comnawa.mvcinema.insang.service;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.insang.model.dao.GetTicketData;
import com.comnawa.mvcinema.sungwon.model.ticket.dto.TicketDTO;

@Service
public class ChartServiceImpl implements ChartService{

  @Inject
  GetTicketData ticketData;
  
  @Override
  public JSONObject getChartData(String select) {
    List<TicketDTO> guestData= ticketData.getGuestData();
    List<TicketDTO> memberData= ticketData.getMemberData();
    JSONObject result= new JSONObject();
    JSONObject col1 = new JSONObject();
    JSONArray title= new JSONArray();
    JSONArray body= new JSONArray();
    switch (select){
    case "member":
      col1.put("label", "회원구분");
      col1.put("type", "string");
      title.add(col1);
      JSONObject guestsize= new JSONObject();
      guestsize.put("guest", guestData.size());
      JSONObject membersize= new JSONObject();
      membersize.put("member", memberData.size());
      JSONArray row= new JSONArray();
      row.add(guestsize);
      row.add(membersize);
      JSONObject cell= new JSONObject();
      cell.put("c", row);
      body.add(cell);
      result.put("rows", cell);
      break;
    case "age":
      break;
    case "movie":
      break;
    }
    return result;
  }
  
}
