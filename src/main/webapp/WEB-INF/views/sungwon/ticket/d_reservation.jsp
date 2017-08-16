<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../../include/header.jsp"%>
<%@include file="../sw_include/template.jsp"%>
<script src="${path}/sungwon/etc/js/myCalendar2.js?v=2"></script>
<link rel="stylesheet" href="${path}/sungwon/etc/css/sw_style.css?v=2">

<style>
#mvc_caleandar td:HOVER {
	background-color: #6699FF;
}

.list-group li:HOVER {
	background-color: #aaaaaa;
}
</style>
<script>
	var count = [];
	var today;
	
	var movie_idx;    //영화   movie table idx
	var choose_day;	  //선택한 일자 
	var start_time;   //상영정보 screen_info table idx

	
	function changeDate(date){
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth()+1;
		if(month < 10){
			month = "0" + month;
		}
		day = date.getDate();
		if(day < 10){
			day = "0"+ day;
		}
		hour = date.getHours();
		if(hour < 10){
			hour = "0"+ hour;
		}
		minute = date.getMinutes();
		if(minute < 10){
			minute = "0"+ minute;
		}
		strDate = year +"-" +month +"-"+day+" "+hour+":"+minute;
		return strDate;
	}
	
	
	
	//선택한 날짜 구하기
	function selectDay(y, m, d) {
		if (m < 10) {
			m = '0' + m
		}
		if (d < 10) {
			d = '0' + d
		}
		date = y + "-" + m + "-" + d;
		choose_day = date;
		var t_li = $("#ticket_time li");
		var td = $("#cal_body td");
		for (var i = 0; i < td.length; i++) {
			if (td[i].id != "") {
				if (td[i].id == date) {
					$("#" + date).css("background-color", '#6699FF');
				} else {
					$("#" + td[i].id).css("background-color", '#FFFFFF');
				}
			}
		}
		$.ajax({
			type : "get",
			url : "${path}/ticket/date_screen_time.do?start_date=" + choose_day,
			success : function(result) {
				$("#ticket_time").html(result);
			}
		});
	}
	
	function selectTime(timeid) {
		if(choose_day == ""){
			alert("상영일을 먼저 선택해주세요");
			return;
		}
		var t_li = $("#ticket_time li");
		for (var i = 0; i < t_li.length; i++) {
			if (t_li[i].id != '') {
				if (t_li[i].id == timeid) {
					$("#" + timeid).css("background-color", '#6699FF');
					start_time = timeid.split("_")[1];
				} else {
					$("#" + t_li[i].id).css("background-color", '#FFFFFF');
				}
			}
		}
		$.ajax({
			type:"get",
			url:"${path}/ticket/date_select_time.do?screen_idx="+start_time,
			success:function(result){
				$("#m_title").html(result.title);
				if(result.age == 0 ){
					$("#m_age").html('<label class="label label-success">전체이용가</label>');
				}else if(result.age > 0 && result.age <15){
					$("#m_age").html('<label class="label label-primary">'+result.age+'세 이용가</label>');					
				}else if(result.age >= 15 && result.age <19){
					$("#m_age").html('<label class="label label-warning">'+result.age+'세 이용가</label>');					
				}else if(result.age >= 19){
					$("#m_age").html('<label class="label label-danger">'+result.age+'세 이용가</label>');					
				}
				$("#m_poster").css("display",'block');
				$("#m_noselect").css("display",'none');
				$("#m_poster").attr("src",'${img_ad}/'+result.img_url);
				$("#d_select").css("display",'none');
				$("#select_screen").css("display",'block');
				var s_date = changeDate(result.start_time);
				$("#d_date").html("시간: "+s_date);
				$("#d_tname").html("상영관: "+result.t_name);
				$("#s_title").css("display",'none');
				$("#s_screen").css("display",'block');
			}
		});
	}
	
	function seat_page(){
		if( ${ sessionScope.dto.userid == null } ){
			      var uri = '${path}/member/s_login_page.do?screen_idx='+start_time;
			       var width = 600;
			       var height = 290;
			       var top = (screen.availHeight - height) / 2;
			       var left = (screen.availWidth - width) / 2;

			       var strFeature;
			       strFeature = 'height=' + height + ',width=' + width + ',menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no,top=' + top + ',left=' + left;
			      window.open(uri, 'popup', strFeature);
		}else{
			document.location.href="${path}/ticket/select_seat_page.do?screen_idx="+start_time;
		}
	}
	
</script>
</head>
<body>
<%@include file="../../sangjin/home/loginbar.jsp"%>
	<div align="left" style="margin-left: 70%">
		<a href="${path}/ticket/movie_ticket_page.do" role="button"
			class="btn btn-primary">영화별 예매</a> 
			<a href="${path}/ticket/date_ticket_page.do" role="button" class="btn btn-info">날짜별 예매</a>
	</div>
	<div class="container" style="width: 100%">
		<div class="row">
			<div class="col-md-4 col-md-offset-1" id="myCalendar2" style="height: 500px;"></div>
			<div class="col-md-6" id="ticket_time">
				<h1 align="center">
					<span class="label label-warning">시간 선택</span>
				</h1>
				<br>
				<ul class="list-group" style="overflow: auto; height: 400px;">
					<c:forEach var="i" begin="1" end="8">
						<li class="list-group-item">&nbsp;</li>
						<c:if test="${i == 2 }">
							<li class="list-group-item" style="text-align: center;"><b>날짜를  선택해주세요</b></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="container" style="width: 100%; height: 150px; background-color:gray">
		<div class="row">
			<div class="col-md-3"id="result_m" style="margin-left: 200px;">
				<div class="col-md-6" id="movie_poster" style="height: 150px;width:150px; padding:0px;" >
				<img src="" id="m_poster" style="height: 150px; padding: 0px; display: none;">
				<h2 id="m_noselect"align="center" style="margin-top:70px;"><label class="label label-default">영화선택</label></h2>
				</div>
				<div class="col-md-6" id="movie_title" style="height: 150px;width:150px; color:white" align="center">
				<p id="m_age" style="margin-top: 30px;"></p>
				<b id="m_title" style="height: 50%"></b>
				</div>
			</div>
			<div class="col-md-3" id="result_d" >
			<h2 id="d_select"align="center" style="margin-top:70px; display: block"><label class="label label-default">시간선택</label></h2>
			<div class="col-md-6" id="select_screen" style="height: 150px;width:150px; color:white; display: none; " align="center">
				<p id="d_date" style="margin-top: 30px; color:white; font-size: 13px; font-weight:bold;"></p>
				<b id="d_tname" style="height: 50%;color: white; font-size: 13px;"></b>
				</div>
			</div>
			<div class="col-md-3" id="result_s">
				<h2 id="s_title" align="center" style="margin-top: 70px; display: block">
					<label class="label label-default">인원/좌석선택</label>
				</h2>
				<div class="col-md-6" id="s_screen"
					style="margin-top:60px; height: 90px; width: 150px; color: white; display: none;"
					align="center">
					<a href="javascript:seat_page()" role="button" class="btn btn-default btn-lg"><span
						class="glyphicon glyphicon-film">&nbsp;인원/좌석선택</span></a>
				</div>
			</div>
		</div>
	</div>
	<script>
		myCalendar2('myCalendar2');
		var hash = document.location.href;
		if (hash.indexOf('?movie_idx=') != -1) {
			selectMovie('${idx}');
		}
	</script>
</body>
</html>	