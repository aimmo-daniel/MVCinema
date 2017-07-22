<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
</head>
<body>

  <div>
    <label for="sub_theater_subject">
      <p class="wow fadeIn" data-wow-delay="0s" id="sub_theater_subject">현재 상영관</p>
    </label>
  </div>

  <c:if test="${theaterList == null}">
    <label for="sub_theater_add_theaternull">
      <p id="sub_theater_add_theaternull">
        등록된 상영관이 없습니다.
      </p>
    </label>
  </c:if>
  
  <% char row_en= 'A'; %>
  <c:if test="${theaterList != null}">
    <c:forEach var="row" items="${theaterList}" varStatus="status">
      <div class="wow fadeInUp col-md-6 col-sm-6" data-wow-delay="0.2s" style="padding: 20px 10px 10px 10px;"
        onclick="testtt();" class="nav-inner transparent">
        <div class="blog-thumb">
        
          <div style="height: ${theaterSitMax * 28}px; border: 1px solid rgba(250,190,230,.4); text-align: center; padding-top: 10px;"
            id="zzo_theaterThumbDiv">
            <label for="zzo_theaterThumb">
              <table style="width:100%;" id="zzo_theaterThumb">
                <tr>
                  <th colspan="${theaterSitList[status.index].seat_col +3}" style="text-align: center;"> | SCREEN |</th>
                </tr>
                <tr>
                  <th>&nbsp;</th>
                </tr>
                <c:forEach var="rows" begin="1" end="${theaterSitList[status.index].seat_row}">
                  <tr>
                    <td>&nbsp;</td>
                    <td><font color="lightgray"><b><%=row_en %></b></font></td>
                    <c:forEach var="cols" begin="1" end="${theaterSitList[status.index].seat_col}">
                      <td style="width: 30px;">
                        <input type="hidden" value="<%= (int)row_en-64 %>">
                        ${cols}
                      </td>
                    </c:forEach>
                    <td>&nbsp;</td>
                  </tr>
                  <% row_en++; %>
                </c:forEach>
              </table>
            </label>
          </div>
          
          <h1>${row.name}</h1>
          <p>${row.preview}</p>
        </div>
      </div>
      <% row_en= 'A'; %>
    </c:forEach>
  </c:if>

  <div style="padding-left: 10%; float: right;" class="wow fadeInUp" data-wow-delay="0.7s">
  <hr>
    <a href="#theater_addTheater">
      <label for="sub_theater_add_addTheater"
        onmouseover="sub_theater_add_addTheater('sub_theater_add_addTheater', 'over')"
        onmouseout="sub_theater_add_addTheater('sub_theater_add_addTheater', 'out')">
        <p id="sub_theater_add_addTheater" style="color: gray;">
          상영관 추가하기
        </p>
      </label>
    </a>
  </div>

</body>
</html>