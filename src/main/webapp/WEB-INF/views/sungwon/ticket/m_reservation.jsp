<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../../sangjin/home/loginbar.jsp"%>
<%@include file="../../include/header.jsp"%>
<%@include file="../sw_include/template.jsp"%>
<script src="${path}/sungwon/etc/js/myCalendar.js?v=2"></script>
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

	//선택한 날짜 구하기
	function selectDay(y, m, d) {
		if(movie_idx == ""){
			alert("영화를 선택해주세요");
			return;
		}
		if (m < 10) {
			m = '0' + m
		}
		if (d < 10) {
			d = '0' + d
		}
		date = y + "-" + m + "-" + d;
		choose_day = date;
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
			url : "${path}/ticket/sreen_time.do?movie_idx=" + movie_idx
					+ "&start_date=" + choose_day,
			success : function(result) {
				$("#ticket_time").html(result);
			}
		});
	}

	function noSelect() {
		alert("영화를 먼저 선택해주세요");
	}

	//선택한 영화
	function selectMovie(tagid) {
		$("#ticket_time").html(
				'<h1 align="center"><span class="label label-warning">시간 선택</span></h1><br>'
					+'<ul class="list-group" style="overflow: auto; height: 400px;">'
						+'<c:forEach var="i" begin="1" end="8">'
							+'<li class="list-group-item">&nbsp;</li>'
								+'<c:if test="${i == 2 }">'
									+'<li class="list-group-item" style="text-align: center;">'
										+'<b>영화와시간을 선택해주세요</b>'
									+'</li>'
								+'</c:if>'
							+'</c:forEach>'
					+'</ul>');
		choose_day = "";
		start_time = "";
		var li = $("#movieList li");
		for (var i = 0; i < li.length; i++) {
			if (li[i].id == tagid) {
				$("#" + tagid).css("background-color", '#6699FF');
				var r_date = $("#" + tagid + " input").val();
				myCalendar('myCalendar', today, r_date);
				movie_idx = tagid;
			} else {
				$("#" + li[i].id).css("background-color", '#FFFFFF');
			}
		}
	}

	function selectTime(timeid) {
		if(movie_idx == ""){
			alert("영화를 선택해주세요");
			return;
		}
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
		/* alert("영화:" + movie_idx + "날짜:" + choose_day + "상영정보" + start_time); */
	}
</script>
</head>
<body>
	<div align="left" style="margin-left: 70%">
		<a href="${path}/ticket/movie_ticket_page.do" role="button"
			class="btn btn-primary">영화별 예매</a> <a href="#" role="button"
			class="btn btn-info">날짜별 예매</a>
	</div>
	<div class="container" style="width: 100%">
		<div class="row">
			<div class="col-md-4" id="ticket_movie">
				<h1 align="center">
					<span class="label label-warning">영화 선택</span>
				</h1>
				<br>
				<div id="movieList">
					<ul class="list-group" style="overflow: auto; height: 400px;">
						<c:forEach var="row" items="${map.list}">
							<li class="list-group-item" onclick="selectMovie('${row.movie_idx}')"
								id="${row.movie_idx}"><c:if test="${row.age >=19 }">
									<span class="label label-danger">${row.age}</span>
								</c:if> <c:if test="${row.age >=15 && row.age <19 }">
									<span class="label label-warning">${row.age}</span>
								</c:if> <c:if test="${row.age > 0 && row.age <15 }">
									<span class="label label-primary">${row.age}</span>
								</c:if> <c:if test="${row.age == 0 }">
									<span class="label label-success">전체이용가</span>
								</c:if> <b>${row.title}</b> <input type="hidden" id="release_date"
									value="<fmt:formatDate value="${row.release_date}" pattern="yyyy-MM-dd"/>">
							</li>
						</c:forEach>
						<c:set var="idx" value="${map.idx}" />
					</ul>
				</div>
			</div>
			<div class="col-md-4" id="myCalendar" style="height: 500px;"></div>
			<div class="col-md-4" id="ticket_time">
				<h1 align="center">
					<span class="label label-warning">시간 선택</span>
				</h1>
				<br>
				<ul class="list-group" style="overflow: auto; height: 400px;">
					<c:forEach var="i" begin="1" end="8">
						<li class="list-group-item">&nbsp;</li>
						<c:if test="${i == 2 }">
							<li class="list-group-item" style="text-align: center;"><b>영화와
									시간을 선택해주세요</b></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<script>
		myCalendar('myCalendar');
		var hash = document.location.href;
		if (hash.indexOf('?movie_idx=') != -1) {
			selectMovie('${idx}');
		}
	</script>
</body>
</html>