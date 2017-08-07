<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
google.load('visualization', '1', {
  'packages' : [ 'corechart' ]
});
google.setOnLoadCallback(drawChart);
function drawChart() {
  var jsonData = $.ajax({
    url : "${path}/chart/cart_money_list.do",
    dataType : "json",
    async : false
  }).responseText;
  console.log(jsonData);
  //데이터 테이블 생성
  var data = new google.visualization.DataTable(jsonData);
  //차트를 출력할 div
  // LineChart, ColumnChart, PieChart
  //var chart = new google.visualization.PieChart(document
  var chart = new google.visualization.LineChart(document
  //var chart = new google.visualization.ColumnChart(document
      .getElementById('chart_div'));
  // 차트객체.draw( 데이터테이블, 옵션 )
  // curveType : "function", 곡선 처리
  chart.draw(data, {
    title : "차트 예제",
    curveType : "function",
    width : 600,
    height : 440
  });
}
</script>
</head>
<body>

  <div>
    <label for="sub_theater_subject">
      <p class="wow fadeIn" data-wow-delay="0s" id="sub_theater_subject">예매율 통계</p>
    </label>
  </div>
  
  <div>
    <table class="table table-default">
      <tr>
        <td><label>통계치 연령</label></td>
        <td>
          <select>
            <option value="100">모든 연령</option>
            <option value="0">10대 미만</option>
            <option value="1">10~19</option>
            <option value="2">20~29</option>
            <option value="3">30~39</option>
            <option value="4">40~49</option>
            <option value="5">50~59</option>
            <option value="6">60대 이상</option>
          </select>
        </td>
      </tr>  
      <tr>
        <td><label>영화제목</label></td>
        <td>
          <select>
            <option>모든영화</option>
            <c:forEach var="row" items="${movieList}">
              <option value="${row.idx}">${row.title}</option>
            </c:forEach>
          </select>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="right">
          <input type="button" class="btn btn-success" value="검색">
        </td>
      </tr>
    </table>
  </div>
  <hr>
  
  <div id="chart_div"></div>
  
</body>
</html>