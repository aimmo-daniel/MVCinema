package com.comnawa.mvcinema.insang.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comnawa.mvcinema.insang.model.dto.Insang_TicketDTO;

@Repository
public class GetTicketDataImpl implements GetTicketData{
  
  @Inject
  SqlSession sqlSession;
  
  @Override
  public List<Insang_TicketDTO> getGuestData() {
    return sqlSession.selectList("insang_chart.ticketGuest");
  }
  
  @Override
  public List<Insang_TicketDTO> getMemberData() {
    return sqlSession.selectList("insang_chart.ticketMember");
  }
  
  @Override
  public int getMonthlySales(int s_year, int s_month, int e_year, int e_month) {
    int start_month= s_month;
    int end_month= s_month+1;
    int start_year= s_year;
    int end_year= s_year;
    if (start_month==12){
      end_year++;
    }
    if (start_month==13){
      start_month=1;
      start_year++;
    }
    if (end_month==13){
      end_month=1;
    }
    Map<String, Integer> map= new HashMap<>();
    map.put("s_year", start_year);
    map.put("s_month", start_month);
    map.put("e_year", end_year);
    map.put("e_month", end_month);
    return sqlSession.selectOne("insang_chart.monthlySales", map);
  }
  
}
