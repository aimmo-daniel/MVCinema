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
      <select id="add_theaterIDX">
        <c:forEach var="th_rows" items="${theaterList}" varStatus="status">
          <option value="${th_rows.idx}">${th_rows.name}</option>
        </c:forEach>
      </select>
    </td>
  </tr>
  <tr>
    <td><label>상영 시작날짜</label></td>
    <td>
      <input type="date" id="add_sDate">
    </td>
  </tr>
  <tr>
    <td><label>상영 시작시간</label></td>
    <td>
      <input type="time" id="add_sTime">
    </td>
  </tr>
  <tr>
    <td><label>영화선택</label></td>
    <td>
      <select id="add_movieIDX">
        <c:forEach var="mv_rows" items="${movieList}" varStatus="status">
          <option value="${mv_rows.idx}">${mv_rows.title}</option>
        </c:forEach>
      </select>
    </td>
  </tr>
  <tr style="text-align: right;">
    <td colspan="2">
      <input type="button" value="등록 완료!!" class="btn btn-success" id="btnAddSchedule">
      <label id="insang_spinner" style="display: none;">
        <img style="width: 30px;" src='${path}/admin/resources/adminImages/loader.gif'>
      </label>
    </td>
  </tr>
</table>

<script>
$("#btnAddSchedule").click(function(){
  if ($("#add_sTime").val() == ""){
    alert('상영시작시간을 입력하지 않으셨습니다.');
    $("#add_sTime").focus();
    return;
  }
  if ($("#add_sDate").val() == ""){
    alert("상영시작날짜를 선택하지 않으셨습니다.");
    $("#add_sDate").focus();
    return;
  }
    $("#btnAddSchedule").hide();
    $("#insang_spinner").show();
  if (confirm("이 내용으로 상영일정을 등록하시겠습니까?")){
    var theaterIDX= $("#add_theaterIDX option:selected").val();
    var starttime= $("#add_sDate").val()+$("#add_sTime").val();
    var movieIDX= $("#add_movieIDX option:selected").val();
    var param= "theaterIDX="+theaterIDX+"&starttime="+starttime+"&movieIDX="+movieIDX;
    $.ajax({
      type: "get",
      url: "${path}/subMenu/movie/addSchedule.do?"+param,
      success: function(result){
        alert('상영일정 추가가 완료되었습니다.');
        sub_movie_loadSub('sub_theater_2');
      }
    });
  }
});
</script>

</body>
</html>