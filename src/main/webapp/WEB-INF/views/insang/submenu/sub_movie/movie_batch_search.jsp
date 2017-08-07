<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
<style>
.table > tbody > tr > td {
  vertical-align: middle;
}
</style>
</head>
<body>
  
  <c:choose>
    <c:when test="${scheduleList[0] == null}">
      <label for="movie_batch_notice">
        <span id="movie_batch_notice" style="color: red; text-align: right;">현재 날짜에 등록된 영화가 없습니다.</span>
      </label>
      <hr>
    </c:when>
    <c:otherwise>
      <div>
        <h1 style="color: #ff8888; text-align: center;'">${theater_idx}관 상영시간표</h1>
        <br>
        <table class="table table-default" style="font-size: medium; text-align: center;">
          <tr style="color: #77aa77;">
            <td><label>이미지</label></td>
            <td><label>영화제목</label></td>
            <td><label>시작시간</label></td>
            <td><label>종료시간</label></td>
            <td><label>남은좌석</label></td>
            <td>&nbsp;</td>
          </tr>
        <c:forEach var="rows" items="${scheduleList}">
          <tr style="font-size: large;">
            <td>
              <img src="${img_ad}/${rows.img_url}" style="width: 120px; height: auto;">
            </td>
            <td><label>${rows.title}</label></td>
            <td><label><fmt:formatDate value="${rows.start_time}" pattern="HH시 mm분"/></label></td>
            <td><label><fmt:formatDate value="${rows.end_time}" pattern="HH시 mm분"/></label></td>
            <td><label>${rows.empty_sit}</label></td>
            <td><input type="button" value="수정" class="btn btn-success" onclick="modMovieSchedule('${rows.screen_idx}')"></td>
          </tr>
        </c:forEach>
        </table>
      </div>
    </c:otherwise>
  </c:choose>
  
  
</body>
</html>