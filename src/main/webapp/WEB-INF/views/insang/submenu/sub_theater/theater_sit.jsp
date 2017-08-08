<%@page import="java.util.List"%>
<%@page import="com.comnawa.mvcinema.insang.model.dto.TheaterSitDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp"%>
</head>
<body>

  <div>
    <label for="sub_theater_subject">
      <p class="wow fadeIn" data-wow-delay="0s" id="sub_theater_subject">좌석 관리</p>
    </label>
  </div>

  <c:if test="${theaterList == null}">
    <label for="sub_theater_add_theaternull">
      <p id="sub_theater_add_theaternull">등록된 상영관이 없습니다.</p>
    </label>
  </c:if>

  <%
    char row_en = 'A';
  pageContext.setAttribute("row_en", String.valueOf(row_en).toLowerCase());
  %>
  <c:if test="${theaterList != null}">
    <c:forEach var="row" items="${theaterList}" varStatus="status">
      <div class="wow fadeInUp col-md-6 col-sm-6" data-wow-delay="0.2s" style="padding: 20px 10px 10px 10px;"
        class="nav-inner transparent">
        <div class="blog-thumb">
          <a href="#Theater_sitTheater?${theaterList[status.index].idx}">
            <div
              style="height: ${theaterSitMax * 28}px; border: 1px solid rgba(250,190,230,.4); text-align: center; padding-top: 10px;"
              id="zzo_theaterThumbDiv">
              <label for="zzo_theaterThumb">
                <table style="width: 100%;" id="zzo_theaterThumb">
                  <tr>
                    <th colspan="${theaterSitList[status.index].seat_col +3}" style="text-align: center;">| SCREEN |</th>
                  </tr>
                  <tr>
                    <th>&nbsp;</th>
                  </tr>
                  <c:forEach var="rows" begin="1" end="${theaterSitList[status.index].seat_row}">
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <font color="lightgray"><b><%=row_en%></b></font>
                      </td>
                      <c:forEach var="cols" begin="1" end="${theaterSitList[status.index].seat_col}">
                          <td style="width: 30px;">
                            <c:set var="emptyResult" value="false"/>
                            <c:set value="${pageScope.row_en}${cols}" var="sit_empty"/>
                              <c:forEach var="theaterSit" items="${theater_sit_empty}">
                                <c:if test="${theaterSit.seat_empty==sit_empty && theaterList[status.index].idx == theaterSit.idx}">
                                  <c:set var="emptyResult" value="true"/>
                                </c:if>
                              </c:forEach>
                              <c:if test="${emptyResult==false}">
                                ${cols}
                              </c:if>
                          </td>
                        </c:forEach>
                      <td>&nbsp;</td>
                    </tr>
                    <%
                      row_en++;
                    pageContext.setAttribute("row_en", String.valueOf(row_en).toLowerCase());
                    %>
                  </c:forEach>
                    <%
                    row_en = 'A';
                    pageContext.setAttribute("row_en", String.valueOf(row_en).toLowerCase());
                    %>
                </table>
              </label>
            </div>
          </a>
          <h1>${row.name}</h1> <p style="color: green;">[ ${row.seat_now}좌석 ]</p>
          <p>${row.preview}</p>
        </div>
      </div>
    </c:forEach>
  </c:if>
  
  <script>
  
  </script>

</body>
</html>