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
<script src="${path}/sungwon/etc/js/myCalendar.js?v=4"></script>
<link rel="stylesheet" href="${path}/sungwon/etc/css/sw_style.css?v=2">
<style>
#mvc_caleandar td:HOVER {
	background-color: #6699FF;
}

#mvc_caleandar td:ACTIVE {
	background-color: green;
}
.list-group li:HOVER {
	background-color: #aaaaaa;
}
</style>
<script>
var count=[];
var today;
var selectMovie;
var selectDay;

	//페이지가 로딩되면
	window.onload = function() {
		myCalendar('myCalendar');
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

		selectDay = date;
		alert("선택 영화 :" + selectMovie + "선택 일자 :" + selectDay);
		var param = "movie_idx=" + selectMovie + "&start_date=" + selectDay;
		/* $.ajax({
			type : "post",
			url : "${path}/ticket/sreenTime.do",
			data : param,
			success : function(result) {
				 $("#ticket_time").html(result);
			}
		}); */
	}

	function noSelect() {
		alert("영화를 먼저 선택해주세요");
		
		$("#movieList li").onclick(function(){
			
		});
	}

	//선택한 영화
	function selectMovie(tagid) {
		var li = $("#movieList li");
		for (var i = 0; i < li.length; i++) {
			if (li[i].id == tagid) {
				$("#" + tagid).css("background-color", '#6699FF');
				var r_date = $("#" + tagid + " input").val();
				myCalendar('myCalendar', today, r_date);
				selectMovie = tagid;
			} else {
				$("#" + li[i].id).css("background-color", '#FFFFFF');
			}
		}
	}
</script>
</head>
<body>
	<div class="container" style="width: 100%">
		<div class="row">
			<div class="col-md-4" id="ticket_movie">
				<h1 align="center">
					<span class="label label-danger">영화 선택</span>
				</h1>
				<br>
				<div id="movieList">
				<ul class="list-group" style="overflow: auto; height: 400px;">
					<c:forEach var="row" items="${map.list}">
						<li class="list-group-item" onclick="selectMovie('${row.movie_idx}')" id="${row.movie_idx}" > 
							<c:if test="${row.age >=19 }">
								<span class="label label-danger">${row.age}</span>
							</c:if> 
							<c:if test="${row.age >=15 && row.age <19 }">
								<span class="label label-warning">${row.age}</span>
							</c:if> 
							<c:if test="${row.age > 0 && row.age <15 }">
								<span class="label label-primary">${row.age}</span>
							</c:if> 
							<c:if test="${row.age == 0 }">
								<span class="label label-success">전체이용가</span>
							</c:if>
							<b>${row.title}</b>
							<input type="hidden" id="release_date" value="<fmt:formatDate value="${row.release_date}" pattern="yyyy-MM-dd"/>">
						</li>
					</c:forEach>
				</ul>
				</div>
			</div>
			<div class="col-md-4" id="myCalendar" style="height: 500px;"></div>
			<div class="col-md-4" id="ticket_time"></div>
		</div>
	</div>
<table>

<tr>
<td >
</td>
</tr>

</table>	
</body>
</html>