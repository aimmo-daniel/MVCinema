<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../sj_include/sangjincss.jsp"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
 	<div class="wrap-movie-chart" style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>영화 상세</h3>
		</div>
		<div class="sect-movie-chart" style="height: 400px;">
			<div class="box-image">
				<span class="thumb-image"> <img
					src="D:/mvcinema/img/${row.img_url}">
				</span>
				<a class="btn btn-danger" role="button" href="#">예매하기</a>
			</div>
			<div style="position: relative; left: 250px; top: -150px;">
				<b>개봉 :</b> <fmt:formatDate value="${dto.release_date}" pattern="yyyy.MM.dd" /><br> 
				<b>감독 :</b> ${dto.director} <br>
				<b>출연 :</b> ${dto.actors} <br>
				<b>장르 :</b> ${dto.genre} <br> 
				<b>기본 :	${dto.age}</b>세 이상 / <b>${dto.runtime}</b>분<br>	
				<b>누적관객 :</b> ${dto.people} (<%=today%> 기준) &nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<div id="sangjin">
			<ul>
				<li><a href="#">줄거리</a></li>
				<li><a href="#">배우/제작진</a></li>
				<li><a href="#">스틸컷</a></li>
				<li><a href="#">예고편</a></li>
			</ul>
		</div>
		<div class="content">
			<h4>줄거리</h4>
			<% pageContext.setAttribute("newLineChar", "\n"); %>
			<!-- 공백문자 처리 -->
			<c:set var="str" value="${fn:replace(dto.content,'  ','&nbsp;&nbsp;') }" />
			<!-- 줄바꿈 처리 -->
			<c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />
			${str}
		</div>
	</div>
</body>
</html>