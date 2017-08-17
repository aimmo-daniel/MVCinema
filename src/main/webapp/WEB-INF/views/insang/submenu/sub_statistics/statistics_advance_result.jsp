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
      .getElementById('chart_result'));
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

<div id="chart_result"></div>

</body>
</html>