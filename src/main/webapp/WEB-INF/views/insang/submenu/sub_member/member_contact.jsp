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
}
.insangContactDetailTitle {
  display: inline-block;
  word-wrap: break-word;
  word-break: break-all;
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
  
  <div class="wow fadeIn lab" data-wow-delay="0s">
    <table class="table table-default">
      <tr style="color: green;">
        <th style="width: 20%; border-right: 1px solid lightgray; border-left: 1px solid lightgray; text-align: center;">
          <label>아이디</label>
        </th>
        <th style="width: 10%; border-right: 1px solid lightgray; text-align: center;"><label>이름</label></th>
        <th style="width: 30%; border-right: 1px solid lightgray; text-align: center;"><label>제목</label></th>
        <th style="width: 20%; text-align: center; border-right: 1px solid lightgray;"><label>질문 날짜</label></th>
        <th style="width: 20%; text-align: center; border-right: 1px solid lightgray;">답변</th>
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
            <div style="text-align: center;">
              <label class="insangContactTitle" style="vertical-align: middle;">
                ${row.title}
              </label>
            </div>
          </td>
          <td style="width: 20%; text-align: center; border-right: 1px solid lightgray;">
            <label>
              <fmt:formatDate value="${row.post_date}" pattern="yyyy-MM-dd HH:mm"/>
            </label>
          </td>
          <td style="border-right: 1px solid lightgray;">
              <c:choose>
                <c:when test="${row.admin_post_date == null}">
                  <label style="color: red;">
                    대기
                  </label>
                </c:when>
                <c:otherwise>
                  <label style="color: green;">
                    완료
                  </label>
                </c:otherwise>
              </c:choose>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
  
  <div id="contactDetailDiv" style="display: none;">
    <div>
      <label for="sub_movie_add_lab">
        <p class="wow fadeIn lab" data-wow-delay="0s" id="sub_movie_add_lab" style="font-size: 20px; margin: 10px 20px 20px 20px;">
          답변하기</p>
      </label>
    </div>
  </div>

<script>
var contactDetailDiv_common = "<div><label for='sub_movie_add_lab'><p class='wow fadeIn lab' data-wow-delay='0s' id='sub_movie_add_lab' style='font-size: 20px; margin: 10px 20px 20px 20px;'>답변하기</p></label></div>" 
function contactDetail(idx){
  $.ajax({
    type: "get",
    url: "${path}/subMenu/member/contactDetail.do?idx="+idx,
    success: function(result){
      $("#contactDetailDiv").show();
      $("#contactDetailDiv").html(contactDetailDiv_common+result);
      $("#answerForm").show();
    }
  })
}
</script>
</body>
</html>