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
		$.ajax({
			type : "get",
			url : "${path}/sort.do?order_type=" + order_type,
			success : function(result) {
				$("#listMovie").html(result);
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
	<div class="wrap-movie-chart"
		style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>무비차트</h3>
			<div class="submenu">
				<ul>
					<li class="on"><a href="/movies/" title="선택">무비차트</a></li>
					<li><a href="/movies/pre-movies.aspx">상영예정작</a></li>
				</ul>
			</div>
		</div>
		<div class="sect-sorting">
			<label for="order_type" class="hidden">정렬</label> <select
				id="order_type" name="order_type" style="width: auto; height: 30px;">
				<c:choose>
					<c:when test="${map.order_type == 'grade' }">
						<option value="rank">예매율순</option>
						<option value="grade" selected>평점순</option>
						<option value="people">관람객순</option>
					</c:when>
					<c:when test="${map.order_type == 'people' }">
						<option value="rank">예매율순</option>
						<option value="grade">평점순</option>
						<option value="people" selected>관람객순</option>
					</c:when>
					<c:otherwise>
						<option value="rank" selected>예매율순</option>
						<option value="grade">평점순</option>
						<option value="people">관람객순</option>
					</c:otherwise>
				</c:choose>
			</select>
			<button type="button" id="btnSearch" onclick="listMovie()">
				<span>GO</span>
			</button>
		</div>
		<!-- ajax 방식으로 영화목록 출력 -->
		<div class="sect-movie-chart" id="listMovie"></div>
	</div>
	<div class="wrap-movie-chart"
		style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap" style="margin-top: 0px;">
			<a style="margin-top: 20px; float: right;" id="expand"><span>+더보기</span></a>
		</div>
	</div>
</body>
</html>