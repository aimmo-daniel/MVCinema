<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
</head>
<body>

<h1 style="color: #ff8888; text-align: center;'">상영시간표 등록</h1>
    <br>

<table class="table table-default" style="margin-bottom: 50px;">
  <tr>
    <td><label>상영관 선택</label></td>
    <td>
      <select id="theaterIDX">
        <c:forEach var="th_rows" items="${theaterList}" varStatus="status">
          <option value="${th_rows.idx}">${th_rows.name}</option>
        </c:forEach>
      </select>
    </td>
  </tr>
  <tr>
    <td><label>상영 시작날짜</label></td>
    <td>
      <input type="date" id="sDate">
    </td>
  </tr>
  <tr>
    <td><label>상영 시작시간</label></td>
    <td>
      <input type="time" id="sTime">
    </td>
  </tr>
  <tr>
    <td><label>영화선택</label></td>
    <td>
      <select id="movieIDX">
        <c:forEach var="mv_rows" items="${movieList}" varStatus="status">
          <option value="${mv_rows.idx}">${mv_rows.title}</option>
        </c:forEach>
      </select>
    </td>
  </tr>
  <tr style="text-align: right;">
    <td colspan="2"><input type="button" value="등록 완료!!" class="btn btn-success" id="btnAddSchedule"></td>
  </tr>
</table>

<script>
$("#btnAddSchedule").click(function(){
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
  if (confirm("이 내용으로 상영일정을 등록하시겠습니까?")){
    var theaterIDX= $("#theaterIDX option:selected").val();
    var starttime= $("#sDate").val()+$("#sTime").val();
    var movieIDX= $("#movieIDX option:selected").val();
    var param= "theaterIDX="+theaterIDX+"&starttime="+starttime+"&movieIDX="+movieIDX;
    $.ajax({
      type: "get",
      url: "${path}/subMenu/movie/addSchedule.do?"+param,
      success: function(result){
        alert('영화 추가가 완료되었습니다.');
        location.href="${path}/admin";
      }
    });
  }
});
</script>

</body>
</html>