<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
</head>
<body>

<h1 style="color: #ff8888; text-align: center;'">상영시간표 수정</h1>
<br>
<fmt:formatDate var="dto_date" value="${dto.start_time}" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="dto_time" value="${dto.start_time}" pattern="HH:mm:ss"/>
<table class="table table-default" style="margin-bottom: 50px;">
  <tr>
    <td><label>상영관 선택</label></td>
    <td>
      <select id="theaterIDX">
        <c:forEach var="th_rows" items="${theaterList}" varStatus="status">
          <option value="${th_rows.idx}" <c:if test="${dto.theater_idx==th_rows.idx}">selected</c:if>>${th_rows.name}</option>
        </c:forEach>
      </select>
    </td>
  </tr>
  <tr>
    <td><label>상영 시작날짜</label></td>
    <td>
      <input type="date" id="sDate" value="${dto_date}">
    </td>
  </tr>
  <tr>
    <td><label>상영 시작시간</label></td>
    <td>
      <input type="time" id="sTime" value="${dto_time}">
    </td>
  </tr>
  <tr>
    <td><label>영화선택</label></td>
    <td>
      <select id="movieIDX">
        <c:forEach var="mv_rows" items="${movieList}" varStatus="status">
          <option value="${mv_rows.idx}" <c:if test="${dto.movie_idx==mv_rows.idx}">selected</c:if>>${mv_rows.title}</option>
        </c:forEach>
      </select>
    </td>
  </tr>
  <tr style="text-align: right;">
    <td colspan="2">
      <input type="button" value="수정 완료!!" class="btn btn-success" id="btnModSchedule">
      <input type="hidden" value="${dto.screen_idx}" id="screenIDX">
    </td>
  </tr>
</table>

<script>
$("#btnModSchedule").click(function(screen_idx){
  if ($("#sTime").val() == ""){
    alert('상영시작시간을 입력하지 않으셨습니다.');
    $("#sTime").focus();
    return;
  }
  if ($("#sDate").val() == ""){
    alert("상영시작날짜를 선택하지 않으셨습니다.");
    $("#sDate").focus();
    return;
  }
  if (confirm("이 내용으로 상영일정을 수정하시겠습니까?")){
    var theaterIDX= $("#theaterIDX option:selected").val();
    var starttime= $("#sDate").val()+$("#sTime").val();
    var movieIDX= $("#movieIDX option:selected").val();
    var screenIDX= $("#screenIDX").val();
    var param= "theaterIDX="+theaterIDX+"&starttime="+starttime+"&movieIDX="+movieIDX+"&screenIDX="+screenIDX;
    $.ajax({
      type: "get",
      url: "${path}/subMenu/movie/modSchedule.do?"+param,
      success: function(result){
        alert('상영일정 수정이 완료되었습니다.');
        location.href="${path}/admin";
      }
    });
  }
});
</script>

</body>
</html>