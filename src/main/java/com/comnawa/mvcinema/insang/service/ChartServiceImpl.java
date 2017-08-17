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
  public JSONObject getSearchDetail(String member, int age, int movie) {
    JSONObject result= new JSONObject();
    List<Insang_TicketDTO> guestData= ticketData.getGuestData();
    List<Insang_TicketDTO> memberData= ticketData.getMemberData();
    List<Insang_MovieDTO> movieList= movieService.getMovieList();
    result.put("resultAllCount", (guestData.size()+memberData.size()));
    int aCount=0;
    if (member.equals("all")){ //회원구분 전부
      switch (age){
      case 100: //나이구분 전부
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            aCount++;
          }
          for (Insang_TicketDTO dto: memberData){
            aCount++;
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto2: movieList){
              if (movie== dto2.getIdx()){
                aCount++;
              }
            }
          }
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (dto3.getIdx()==movie){
                aCount++;
              }
            }
          }
        }
        break;
      case 0:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >0 && dto.getM_age()<10){
              aCount++;
            }
          }
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >0 && dto.getM_age()<10){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto2: movieList){
              if (movie== dto2.getIdx() && dto.getM_age() > 0 && dto.getM_age() <10){
                aCount++;
              }
            }
          }
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() > 0 && dto.getM_age() <10){
                aCount++;
              }
            }
          }
        }
        break;
      case 1:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=10 && dto.getM_age()<20){
              aCount++;
            }
          }
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=10 && dto.getM_age()<20){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto2: movieList){
              if (movie== dto2.getIdx() && dto.getM_age() >= 10 && dto.getM_age() <20){
                aCount++;
              }
            }
          }
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 10 && dto.getM_age() <20){
                aCount++;
              }
            }
          }
        }
        break;
      case 2:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=20 && dto.getM_age()<30){
              aCount++;
            }
          }
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=20 && dto.getM_age()<30){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto2: movieList){
              if (movie== dto2.getIdx() && dto.getM_age() >= 20 && dto.getM_age() <30){
                aCount++;
              }
            }
          }
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 20 && dto.getM_age() <30){
                aCount++;
              }
            }
          }
        }
        break;
      case 3:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=30 && dto.getM_age()<40){
              aCount++;
            }
          }
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=30 && dto.getM_age()<40){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto2: movieList){
              if (movie== dto2.getIdx() && dto.getM_age() >= 30 && dto.getM_age() <40){
                aCount++;
              }
            }
          }
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 30 && dto.getM_age() <40){
                aCount++;
              }
            }
          }
        }
        break;
      case 4:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=40 && dto.getM_age()<50){
              aCount++;
            }
          }
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=40 && dto.getM_age()<50){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto2: movieList){
              if (movie== dto2.getIdx() && dto.getM_age() >= 40 && dto.getM_age() <50){
                aCount++;
              }
            }
          }
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 40 && dto.getM_age() <50){
                aCount++;
              }
            }
          }
        }
        break;
      case 5:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=50 && dto.getM_age()<60){
              aCount++;
            }
          }
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=50 && dto.getM_age()<60){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto2: movieList){
              if (movie== dto2.getIdx() && dto.getM_age() >= 50 && dto.getM_age() <60){
                aCount++;
              }
            }
          }
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 50 && dto.getM_age() <60){
                aCount++;
              }
            }
          }
        }
        break;
      case 6:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=60){
              aCount++;
            }
          }
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=60){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto2: movieList){
              if (movie== dto2.getIdx() && dto.getM_age() >= 60){
                aCount++;
              }
            }
          }
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 60){
                aCount++;
              }
            }
          }
        }
        break;
      }
      result.put("resultCount", aCount);
    } else if (member.equals("member")){ //회원만
      switch (age){
      case 100: //나이구분 전부
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: memberData){
            aCount++;
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (dto3.getIdx()==movie){
                aCount++;
              }
            }
          }
        }
        break;
      case 0:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >0 && dto.getM_age()<10){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() > 0 && dto.getM_age() <10){
                aCount++;
              }
            }
          }
        }
        break;
      case 1:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=10 && dto.getM_age()<20){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 10 && dto.getM_age() <20){
                aCount++;
              }
            }
          }
        }
        break;
      case 2:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=20 && dto.getM_age()<30){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 20 && dto.getM_age() <30){
                aCount++;
              }
            }
          }
        }
        break;
      case 3:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=30 && dto.getM_age()<40){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 30 && dto.getM_age() <40){
                aCount++;
              }
            }
          }
        }
        break;
      case 4:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=40 && dto.getM_age()<50){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 40 && dto.getM_age() <50){
                aCount++;
              }
            }
          }
        }
        break;
      case 5:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=50 && dto.getM_age()<60){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 50 && dto.getM_age() <60){
                aCount++;
              }
            }
          }
        }
        break;
      case 6:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: memberData){
            if (dto.getM_age() >=60){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: memberData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 60){
                aCount++;
              }
            }
          }
        }
        break;
      }
      result.put("resultCount", aCount);
    } else if (member.equals("guest")){
      switch (age){
      case 100: //나이구분 전부
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            aCount++;
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto3: movieList){
              if (dto3.getIdx()==movie){
                aCount++;
              }
            }
          }
        }
        break;
      case 0:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >0 && dto.getM_age()<10){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() > 0 && dto.getM_age() <10){
                aCount++;
              }
            }
          }
        }
        break;
      case 1:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=10 && dto.getM_age()<20){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 10 && dto.getM_age() <20){
                aCount++;
              }
            }
          }
        }
        break;
      case 2:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=20 && dto.getM_age()<30){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 20 && dto.getM_age() <30){
                aCount++;
              }
            }
          }
        }
        break;
      case 3:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=30 && dto.getM_age()<40){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 30 && dto.getM_age() <40){
                aCount++;
              }
            }
          }
        }
        break;
      case 4:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=40 && dto.getM_age()<50){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 40 && dto.getM_age() <50){
                aCount++;
              }
            }
          }
        }
        break;
      case 5:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=50 && dto.getM_age()<60){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 50 && dto.getM_age() <60){
                aCount++;
              }
            }
          }
        }
        break;
      case 6:
        if (movie==0){ //영화구분 전부
          for (Insang_TicketDTO dto: guestData){
            if (dto.getM_age() >=60){
              aCount++;
            }
          }
        } else { //영화구분 전부 아님
          for (Insang_TicketDTO dto: guestData){
            for (Insang_MovieDTO dto3: movieList){
              if (movie== dto3.getIdx() && dto.getM_age() >= 60){
                aCount++;
              }
            }
          }
        }
        break;
      }
      result.put("resultCount", aCount);
    }
    return result;
  }
  
}
