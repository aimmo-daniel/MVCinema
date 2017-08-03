<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
<style>
#movie_batch_addMovie {
  transition: color 0.5s
}
#movie_batch_addMovie:hover {
  color: green;
}
</style>
</head>
<body>

  <c:if test="${result == null}">
    <label for="movie_batch_notice">
      <span id="movie_batch_notice" style="color: red; text-align: right;">현재 날짜에 등록된 영화가 없습니다.</span>
    </label>
    <hr>
  </c:if>
  
  <!-- 상영시간표 검색 결과 -->
  <div>
    <c:forEach var="rows" items="${scheduleList}">
      ${rows.movie_idx}
    </c:forEach>
  </div>
  
  <div style="text-align: right;">
    <label for="movie_batch_addMovie">
      <p id="movie_batch_addMovie">영화 등록하기</p>
    </label>
  </div>
  
  <!-- 상영시간표 등록 폼 -->
  <div></div>

</body>
</html>