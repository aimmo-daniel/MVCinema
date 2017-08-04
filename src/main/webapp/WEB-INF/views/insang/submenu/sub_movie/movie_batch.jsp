<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file ="../../../include/header.jsp" %>
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

  <div>
    <label for="sub_movie_add_lab">
      <p class="wow fadeIn lab" data-wow-delay="0s" id="sub_movie_add_lab" style="font-size: 20px; margin: 10px 20px 20px 20px;">
        상영관 영화 등록</p>
    </label>
  </div>
  <div>
    <jsp:useBean id="todayy" class="java.util.Date" />
    <table class="table table-default">
      <tr>
        <td>날짜 선택</td>
        <td colspan="2"><input type="Date" value="<fmt:formatDate value='${todayy}' pattern='yyyy-MM-dd'/>" id="selectDate"></td>
      </tr>
      <tr>
        <td>상영관 선택</td>
        <td>
          <select id="theaterIDX">
            <c:forEach var="rows" items="${theaterList}" varStatus="status">
              <option value="${rows.idx}"  <c:if test="${status.index == 0}">selected</c:if>>${rows.name}</option>
            </c:forEach>
          </select>
        </td>
        <td align="right"><input type="button" value="검색" class="btn btn-success" id="btn_search"></td>
      </tr>
      <tr><td colspan="3"></td></tr>
    </table>
  </div>
  
  <div id="insang_batch_searchResult"></div>
  
  <hr>
  <div style="text-align: right;" id="insang_batch_addSchedule">
    <label for="movie_batch_addMovie">
      <p id="movie_batch_addMovie">영화 등록하기</p>
    </label>
  </div>

<script>
$("#btn_search").click(function(){
  var param= "idx="+$("#theaterIDX option:selected").val()+"&date="+$("#selectDate").val();
  $.ajax({
    type: "post",
    data: param,
    url: "${path}/subMenu/movie/searchBatch.do",
    success: function(result){
      $("#insang_batch_searchResult").html(result);
    }
  });
});
$("#insang_batch_addSchedule").click(function(){
  $.ajax({
    url: "${path}/subMenu/movie/addBatch.do",
    success: function(result){
      $("#insang_batch_searchResult").html(result);
    }
  });
});

</script>
  
</body>
</html>