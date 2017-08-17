<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVCINEMA</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../../sangjin/sj_include/sangjincss.jsp"%>
</head>
<body>
	<%@ include file="../../sangjin/home/loginbar.jsp"%>
	<div class="wrap-movie-chart"
		style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>상영관 소개</h3>
		</div>
		<div class="sect-sorting" style="width:1120px; height: auto; margin-top: 50px;">
			<img src="${path}/sangjin/resource/image/intro1.jpg">
			<img src="${path}/sangjin/resource/image/intro2.jpg">
			<br><br><br><br><br><br>
			<img src="${path}/sangjin/resource/image/intro3.jpg">
		</div>
	</div>
	<div style="height: 350px;"></div>
	<%@ include file="../../insang/footer/footer.jsp" %>
</body>
</html>