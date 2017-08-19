<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../../include/header.jsp"%>
<title>Insert title here</title>
<script>
var movieName= [];
var movieCount= [];
</script>
<c:set var="insang_aCount" value="0" />
<c:forEach var="item" items="${chart_movie.movieName}" varStatus="status">
  <script>
  	movieName[${status.index}]= '${chart_movie.movieName[status.index]}';
  	movieCount[${status.index}]= '${chart_movie.movieCount[status.index]}';
  </script>
</c:forEach>
<script type="text/javascript" src="${path}/admin/resources/template/js/chart.js"></script>
<script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        function drawChart(action) {
      	var data = new google.visualization.DataTable();
      	data.addColumn('string', 'Topping');
      	data.addColumn('number', 'Slices');
          if (action== 'member'){
            data.addRows([
              	['비회원예매', Number('${chart_member.guestSize}')],
              	['회원예매', Number('${chart_member.memberSize}')],
          	]);
            var options = {'title':'회원 구분 예매',
                           'width':800,
                           'height':300};
            var chart = new google.visualization.PieChart(document.getElementById('default1'));
          } else if (action== 'age'){
            data.addRows([
            	['10세 미만', Number('${chart_age.size0}')],
            	['10대 (10~19)', Number('${chart_age.size1}')],
            	['20대 (20~29)', Number('${chart_age.size2}')],
            	['30대 (30~39)', Number('${chart_age.size3}')],
            	['40대 (40~49)', Number('${chart_age.size4}')],
            	['50대 (50~59)', Number('${chart_age.size5}')],
            	['60대 이상', Number('${chart_age.size6+chart_age.size7+chart_age.size8+chart_age.size9}')],
        	]);
          	var options = {'title':'연령별 예매',
                         'width':800,
                         'height':300};
          	var chart = new google.visualization.PieChart(document.getElementById('default2'));
          } else if (action== 'movie'){
            for (var i=0; i<${chart_movie.movieSize}; i++){
              data.addRows([
              	[movieName[i], Number(movieCount[i])],
          	  ]);
            }
          	var options = {'title':'영화별 예매',
                         'width':800,
                         'height':300};
            var chart = new google.visualization.PieChart(document.getElementById('default3'));
          }
          chart.draw(data, options);
        }
      </script>
</head>
<body>
  <jsp:useBean id="toDay" class="java.util.Date" />
  <c:set var="now" value="${java.string.date}" />
  <div>
    <label for="sub_theater_subject">
      <p class="wow fadeIn" data-wow-delay="0s" id="sub_theater_subject">예매율 통계</p>
    </label>
  </div>

  <div>
    <table class="table table-default">
      <tr>
        <td><label>회원구분</label></td>
        <td><select id="searchMemb">
            <option value="all">모든예매</option>
            <option value="member">회원예매</option>
            <option value="guest">비회원예매</option>
        </select></td>
      </tr>
      <tr>
        <td><label>통계치 연령</label></td>
        <td><select id="searchAge">
            <option value="100">모든 연령</option>
            <option value="0">10대 미만</option>
            <option value="1">10~19</option>
            <option value="2">20~29</option>
            <option value="3">30~39</option>
            <option value="4">40~49</option>
            <option value="5">50~59</option>
            <option value="6">60대 이상</option>
        </select></td>
      </tr>
      <tr>
        <td><label>영화제목</label></td>
        <td><select id="searchMovie">
            <option value="0">모든영화</option>
            <c:forEach var="row" items="${movieList}">
              <fmt:formatDate var="nowDate" value="${toDay}" pattern="yyyy-MM-dd" />
              <fmt:formatDate var="releaseDate" value="${row.release_date}" pattern="yyyy-MM-dd" />
              <c:if test="${releaseDate < nowDate}">
                <option value="${row.idx}">${row.title}</option>
              </c:if>
            </c:forEach>
        </select></td>
      </tr>
      <tr>
        <td colspan="2" align="right"><input type="button" class="btn btn-primary" value="기본 통계" onclick="defaultSetting();">
          <input type="button" class="btn btn-success" value="검색" onclick="searchSetting();"></td>
      </tr>
    </table>
  </div>
  <hr>

  <table style="display: none;" id="searchSet">
    <tr>
      <td><label style="font-size: x-large;">검색 결과 통계</label></td>
    </tr>
    <tr>
      <td>
        <div id="searchResult"></div>
      </td>
    </tr>
  </table>

  <table style="display: none;" id="defaultSet">
    <tr>
      <td style="font-size: x-large;"><label>기본 통계</label></td>
    </tr>
    <tr>
      <td>
        <div id="default1"></div>
      </td>
    </tr>
    <tr>
      <td>
        <div id="default2"></div>
      </td>
    </tr>
    <tr>
      <td>
        <div id="default3"></div>
      </td>
    </tr>
  </table>


  <script>
  google.charts.load('current', {'packages':['corechart']});
  function searchSetting(){
    var memb= $("#searchMemb option:selected").val();
    var age= $("#searchAge option:selected").val();
    var movie= $("#searchMovie option:selected").val();
    var param= "member="+memb+"&age="+age+"&movie="+movie;
    var resultCount;
    var resultAllCount;
    $.ajax({
      type: "post",
      data: param,
      url: "${path}/tong/searchDetail.do",
      async: false,
      success: function(result){
        resultCount= result.resultCount;
        resultAllCount= result.resultAllCount;
      }
    });
    
    var data = new google.visualization.DataTable();
  	data.addColumn('string', 'Topping');
  	data.addColumn('number', 'Slices');
  	data.addRows([
	  [$("#searchMemb option:selected").text()+" / "+$("#searchAge option:selected").text()+" / "+$("#searchMovie option:selected").text(), resultCount],
      ['그외', resultAllCount-resultCount],
	]);
    var options = {'title':'검색값',
                   'width':800,
                   'height':300};
    var chart = new google.visualization.PieChart(document.getElementById('searchResult'));
    chart.draw(data, options);
    $("#searchSet").show();
    $("#defaultSet").hide();
  }
  function defaultSetting(){
    google.charts.setOnLoadCallback(drawChart("member"));
    google.charts.setOnLoadCallback(drawChart("age"));
    google.charts.setOnLoadCallback(drawChart("movie"));
    $("#defaultSet").show();
    $("#searchSet").hide();
  }
  </script>

</body>
</html>