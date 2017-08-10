<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
<style>
.insangContactTitle {
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
  width: 300px;
  height: 20px;
}
.table > tbody > tr > td {
  vertical-align: middle;
}
</style>
</head>
<body>

  <div>
    <label for="sub_movie_add_lab">
      <p class="wow fadeIn lab" data-wow-delay="0s" id="sub_movie_add_lab" style="font-size: 20px; margin: 10px 20px 20px 20px;">
        1:1문의 내용 관리</p>
    </label>
  </div>
  
  <div>
    <table class="table table-default">
      <tr style="color: green;">
        <th style="width: 20%; border-right: 1px solid lightgray; border-left: 1px solid lightgray; text-align: center;">
          <label>질문자 아이디</label>
        </th>
        <th style="width: 20%; border-right: 1px solid lightgray; text-align: center;"><label>질문자 이름</label></th>
        <th style="width: 40%; border-right: 1px solid lightgray; text-align: center;"><label>제목</label></th>
        <th style="width: 20%; text-align: center; border-right: 1px solid lightgray;"><label>질문 날짜</label></th>
      </tr>
      <c:forEach var="row" items="${contactList}" varStatus="status">
        <tr
          onclick="contactDetail('${row.idx}')" 
          <c:if test="${status.last == true}">
            style="border-bottom: 1px solid lightgray;"
          </c:if>
        >
          <td style="width: 20%; border-right: 1px solid lightgray; border-left: 1px solid lightgray; text-align: center;">
            <label>
              ${row.userid}
            </label>
          </td>
          <td style="width: 20%; border-right: 1px solid lightgray; text-align: center;">
            <label>
              ${row.name}
            </label>
          </td>
          <td style="border-right: 1px solid lightgray; text-align: center;">
            <div class="insangContactTitle" style="text-align: center;">
              <label>
                ${row.title}
              </label>
            </div>
          </td>
          <td style="width: 20%; text-align: center; border-right: 1px solid lightgray;">
            <label>
              <fmt:formatDate value="${row.post_date}" pattern="yyyy-MM-dd HH:mm"/>
            </label>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
  
  <div id="contactDetailDiv"></div>

<script>
function contactDetail(idx){
  $.ajax({
    type: "get",
    url: "${path}/subMenu/member/contactDetail.do?idx="idx,
    success: function(result){
      $("#contactDetailDiv").html(result);
    }
  })
}
</script>
</body>
</html>