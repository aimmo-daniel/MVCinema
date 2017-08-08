<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../sj_include/sangjincss.jsp"%>
<%@ page import="java.util.*, java.text.*"%>
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("MM-dd");
	String today = formatter.format(new java.util.Date());
%>
<!DOCTYPE html>
<html>
<script>
//페이지 로드시 줄거리 출력
$(document).ready(function() {
	content();
});

//줄거리탭 ajax
function content() {
	var idx=$("#movie_idx").val();
	$("#tab1").addClass("active");
	$("#tab2").removeClass("active");
	$("#tab3").removeClass("active");
	$("#tab4").removeClass("active");
	$.ajax({
		type : "get",
		url : "${path}/info/content.do?idx=" + idx,
		success : function(result) {
			$("#bottom_content").html(result);
		}
	});
}

//배우탭 ajax
function actors() {
	var idx=$("#movie_idx").val();
	$("#tab1").removeClass("active");
	$("#tab2").addClass("active");
	$("#tab3").removeClass("active");
	$("#tab4").removeClass("active");
	$.ajax({
		type : "get",
		url : "${path}/info/actors.do?idx=" + idx,
		success : function(result) {
			$("#bottom_content").html(result);
		}
	});
}

//스틸컷탭 ajax
function stillcut() {
	var idx=$("#movie_idx").val();
	$("#tab1").removeClass("active");
	$("#tab2").removeClass("active");
	$("#tab3").addClass("active");
	$("#tab4").removeClass("active");
	$.ajax({
		type : "get",
		url : "${path}/info/stillcut.do?idx=" + idx,
		success : function(result) {
			$("#bottom_content").html(result);
		}
	});
}

//예고편탭 ajax
function video() {
	var idx=$("#movie_idx").val();
	$("#tab1").removeClass("active");
	$("#tab2").removeClass("active");
	$("#tab3").removeClass("active");
	$("#tab4").addClass("active");
	$.ajax({
		type : "get",
		url : "${path}/info/video.do?idx=" + idx,
		success : function(result) {
			$("#bottom_content").html(result);
		}
	});
}

//예매하기버튼 하이퍼링크
function buy_ticket(idx){
	location.href="${path}/ticket/movie_ticket_page.do?movie_idx="+idx;
}


</script>
<head>
<!-- 메뉴바 -->
<%@ include file="../../sangjin/home/loginbar.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 상세정보</title>
</head>
<body>
	<!-- 영화 상세정보 표시 -->
 	<div class="wrap-movie-chart" id="bg" style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>영화 상세</h3>
		</div>
		<div class="sect-movie-chart" style="height: 400px; margin-left: 50px;">
			<div class="box-image">
				<span class="thumb-image"> <img
					src="${img_ad}/${dto.img_url}">
				</span>
				<a class="btn btn-danger" role="button" onclick="buy_ticket('${dto.idx}')">예매하기</a>
			</div>
			<div style="position: relative; left: 250px; top: -250px;">
				<input id="movie_idx" type="hidden" value="${dto.idx}"/>
				<h2>[ ${dto.title} ]</h2>
				<hr>
				<b>개봉 :</b> <fmt:formatDate value="${dto.release_date}" pattern="yyyy.MM.dd" /><br> 
				<b>감독 :</b> ${dto.director} <br>
				<b>출연 :</b> ${dto.actors} <br>
				<b>장르 :</b> ${dto.genre} <br> 
				<b>기본 :	${dto.age}</b>세 이상 / ${dto.runtime}분<br>
				<b>누적관객 :</b> <fmt:formatNumber value="${dto.people}" type="number"/>명 (<%=today%> 기준) &nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<!-- ajax탭 -->
		<div>
			<ul class="nav nav-tabs">
			  <li id="tab1"><a href='javascript:void(0);' onclick='content();'>줄거리</a></li>
			  <li id="tab2"><a href='javascript:void(0);' onclick='actors();'>출연/제작진</a></li>
			  <li id="tab3"><a href='javascript:void(0);' onclick='stillcut();'>스틸컷</a></li>
			  <li id="tab4"><a href='javascript:void(0);' onclick='video();'>예고편</a></li>
			</ul>
		</div>
		<!-- ajax 결과를 출력할 div -->
		<div style="margin-top: 40px; margin-bottom: 100px; margin-left: 50px;" id="bottom_content"></div>
		<!-- 댓글폼 -->
		<div style="margin-left: 50px;"><%@ include file="../../sangjin/info/memo.jsp"%></div>
	</div>
</body>
</html>