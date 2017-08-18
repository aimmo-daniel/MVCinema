<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
<script type="text/javascript" src="${path}/admin/resources/template/js/chart.js"></script>
<script>
google.charts.load('current', {'packages':['corechart']});
</script>
</head>
<body>

  <div>
    <label for="sub_theater_subject">
      <p class="wow fadeIn" data-wow-delay="0s" id="sub_theater_subject">월별매출</p>
    </label>
  </div>
  
  <div>
    <table class="table table-defualt">
      <tr>
        <td><label>시작 년/월</label></td>
        <td><input type="month" id="s_date"></td>
      </tr>
      <tr>
        <td><label>마지막 년/월</label></td>
        <td><input type="month" id="e_date"></td>
      </tr>
    </table>
    <input type="button" value="검색" class="btn btn-success" id="btnSearch" style="float: right;">
  </div>
  
  <div id="chartResult" style="margin-top: 100px; padding: 0;"></div>
  
  

<script>
$("#btnSearch").click(function(){
  var s_year= $("#s_date").val().split('-')[0];
  var s_month= $("#s_date").val().split('-')[1];
  var e_year= $("#e_date").val().split('-')[0];
  var e_month= $("#e_date").val().split('-')[1];
  var param= "start_year="+s_year+"&start_month="+s_month+"&end_year="+e_year+"&end_month="+e_month;
  var results= [];
  var results_month= [];
  $.ajax({
    type: "post",
    data: param,
    url: "${path}/tong/monthlySalesChart.do",
    async: false,
    success: function(result){
	  for (var i=0; i<result.length; i++){
	    results[i]= result[i].sale;
	    results_month[i]= result[i].month;
	  }  
    }
  });
  
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Topping');
  data.addColumn('number', '매출');
    for (var i=0; i<results.length; i++){
      data.addRows([
        [results_month[i], Number(results[i])],
      ]);
    }
    var options = {'title':'선택기간 월매출통계',
                   'width':700,
                   'height':400,
                   };
    var chart = new google.visualization.LineChart(document.getElementById('chartResult'));
    chart.draw(data, options);

})
</script>
</body>
</html>