<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<style>
li {
	list-style: none;
}
</style>
<title>MVCINEMA</title>
<%@ include file="include/header.jsp"%>
<%@ include file="include/template.jsp"%>
<%@ include file="sangjin/sj_include/sangjincss.jsp"%>
<script src="${path }/admin/resources/template/js/zzo_main.js"></script>
<script>
	$(document).ready(function() {
		$("#expand").click(function() {
			$("[id^=mlist]").show();
			$("#expand").hide();
		});
		listMovie();
	});
	
	function listMovie() {
		var order_type = $("#order_type").val();
		if (order_type == undefined) {
			order_type = String("rank");
		}
		$.ajax({
			type : "get",
			url : "${path}/sort.do?order_type=" + order_type,
			success : function(result) {
				$("#listMovie").html(result);
				$("#order_type").show();
				$("#btnSearch").show();
				$("#expand").show();
				$("#hr_name").html("무비차트");
				$("#on_2").removeClass("on");
				$("#on_1").addClass("on");
			}
		});
	}
	
	function scheduleMovie() {
		$.ajax({
			type : "get",
			url : "${path}/schedule.do",
			success : function(result) {
				$("#listMovie").html(result);
				$("#order_type").hide();
				$("#btnSearch").hide();
				$("#expand").hide();
				$("#hr_name").html("상영예정작");
				$("#on_1").removeClass("on");
				$("#on_2").addClass("on");
			}
		});
	}
</script>
</head>
<body>
	<div class="preloader">
		<div class="sk-spinner sk-spinner-pulse"></div>
	</div>
	<%@ include file="sangjin/home/loginbar.jsp"%>
	<%@ include file="sangjin/sj_include/carousel.jsp"%>
	<!-- ajax방식으로 영화목록 출력 -->
	<div class="wrap-movie-chart" style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3 id="hr_name"></h3>
			<div class="submenu">
				<ul>
					<li id="on_1" class="on"><a href='javascript:void(0);' onclick='listMovie();'>무비차트</a></li>
					<li id="on_1"><a href='javascript:void(0);' onclick='scheduleMovie();'>상영예정작</a></li>
				</ul>
			</div>
		</div>
		
		<div id="listMovie"></div>
		
	</div>
	<div class="wrap-movie-chart"
		style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap" style="margin-top: 0px;">
			<a style="margin-top: 20px; float: right;" id="expand"><span>+더보기</span></a>
		</div>
	</div>
</body>
</html>