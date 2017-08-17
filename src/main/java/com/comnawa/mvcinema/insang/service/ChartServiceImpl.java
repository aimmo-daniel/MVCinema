package com.comnawa.mvcinema.insang.service;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.insang.model.dao.GetTicketData;
import com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO;
import com.comnawa.mvcinema.insang.model.dto.Insang_TicketDTO;

@Service
public class ChartServiceImpl implements ChartService{

  @Inject
  GetTicketData ticketData;
  @Inject
  Insang_MovieService movieService;
  
  @Override
  public JSONObject getChartData(String select) {
    List<Insang_TicketDTO> guestData= ticketData.getGuestData();
    List<Insang_TicketDTO> memberData= ticketData.getMemberData();
    JSONObject result= new JSONObject();
    if (select.equals("member")){
      result.put("guestSize", guestData.size());
      result.put("memberSize", memberData.size());
    } else if (select.equals("age")){
      int[] ageCount = new int[10];
      for (int i: ageCount){
        i=0;
      }
      for (Insang_TicketDTO dto: memberData){
        if (dto.getM_age()>= 0 && dto.getM_age() <10){
          ageCount[0]++;
        } else if (dto.getM_age()>= 10 && dto.getM_age()<20){
          ageCount[1]++;
        } else if (dto.getM_age()>= 20 && dto.getM_age()<30){
          ageCount[2]++;
        } else if (dto.getM_age()>= 30 && dto.getM_age()<40){
          ageCount[3]++;
        } else if (dto.getM_age()>= 40 && dto.getM_age()<50){
          ageCount[4]++;
        } else if (dto.getM_age()>= 50 && dto.getM_age()<60){
          ageCount[5]++;
        } else if (dto.getM_age()>= 60 && dto.getM_age()<70){
          ageCount[6]++;
        } else if (dto.getM_age()>= 70 && dto.getM_age()<80){
          ageCount[7]++;
        } else if (dto.getM_age()>= 80 && dto.getM_age()<90){
          ageCount[8]++;
        } else if (dto.getM_age()>= 90 && dto.getM_age()<=100){
          ageCount[9]++;
        }
      }
      for (int i=0; i<ageCount.length; i++){
        result.put("size"+i, ageCount[i]);
      }
    } else if (select.equals("movie")){
      List<Insang_MovieDTO> movies= movieService.getMovieList();
      int[] aCount= new int[movies.size()];
      String[] movieName= new String[movies.size()];
      for (int i: aCount){
        i=0;
      }
      for (String str: movieName){
        str="";
      }
      for (int i=0; i<movies.size(); i++){
        movieName[i]= movies.get(i).getTitle();
        for (Insang_TicketDTO dto: guestData){
          if (dto.getT_title().equals(movies.get(i).getTitle())){
            aCount[i]++;
          }
        }
        for (Insang_TicketDTO dto: memberData){
          if (dto.getT_title().equals(movies.get(i).getTitle())){
            aCount[i]++;
          }
        }
        
      }
      result.put("movieName", movieName);
      result.put("movieCount", aCount);
      result.put("movieSize", movies.size());
      for (int i=0; i<movies.size(); i++){
        System.out.println(movieName[i]+":"+aCount[i]);
      }
    }
    return result;
  }
  
  @Override
  public JSONObject getSearchDetail() {
    // TODO Auto-generated method stub
    return null;
  }
  
}
