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
  
  <c:if test="${theaterList != null}">
    <c:forEach var="row" items="${theaterList}">
      <div class="wow fadeInUp col-md-6 col-sm-6" data-wow-delay="0.2s" style="margin-bottom: 100px; margin-top:20px;"
        onclick="testtt();">
        <div class="blog-thumb">
          <img src="images/blog-img3.jpg" class="img-responsive" alt="좌석표">
          <h1>${row.name}</h1>
          <p>${row.preview}</p>
        </div>
      </div>
    </c:forEach>
  </c:if>
  
  <div style="padding-left: 10%;" class="wow fadeInUp" data-wow-delay="0.7s">
    <a href="#theater_addTheater">
      <label for="sub_theater_add_addTheater"
        onmouseover="sub_theater_add_addTheater('sub_theater_add_addTheater', 'over')"
        onmouseout="sub_theater_add_addTheater('sub_theater_add_addTheater', 'out')"
        onclick="">
        <p id="sub_theater_add_addTheater" style="color: gray;">
          상영관 추가하기
        </p>
      </label>
    </a>
  </div>

</body>
</html>