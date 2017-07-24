<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<title>MVCINEMA</title>
<%@ include file="include/header.jsp"%>
<%@ include file="include/template.jsp"%>
<%@ include file="sangjin/sj_include/sangjincss.jsp"%>
</head>
<body>
	<div class="preloader">
		<div class="sk-spinner sk-spinner-pulse"></div>
	</div>

	<%@ include file="sangjin/home/loginbar.jsp"%>
	<%@ include file="sangjin/sj_include/carousel.jsp"%>
	<%@ include file="sangjin/home/movie.jsp" %>
	<%@ include file="sangjin/home/scheduled.jsp" %>
	
</body>
</html>