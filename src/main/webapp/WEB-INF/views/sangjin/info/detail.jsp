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
<head>
<%@ include file="../../sangjin/home/loginbar.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap-movie-chart"
		style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>영화 상세정보</h3>
		</div>
		<div class="sect-movie-chart">
			<div class="box-image">
				<span class="thumb-image"> <img
					src="D:/mvcinema/img/${row.img_url}">
				</span>
			</div>
			<div style="position: relative; left: 250px; top: -150px;">
				개봉일 : <fmt:formatDate value="${dto.release_date}" pattern="yyyy.MM.dd" /><br> 
				감독 : ${dto.director} <br>
				출연진 : ${dto.actors} <br>
				장르 : ${dto.genre} <br> 
				누적관객 : ${dto.people} (<%=today%> 기준) <br>
				<a class="btn btn-default" role="button" href="#">예매하기</a>
			</div>
		</div>
		<br>
		<div>
			<h4>줄거리</h4>
			${dto.content}
		</div>
	</div>
</body>
</html>