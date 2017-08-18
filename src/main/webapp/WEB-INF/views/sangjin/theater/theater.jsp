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
<%@ include file="../../sangjin/sj_include/Top.jsp" %>
</head>
<body>
	<%@ include file="../../sangjin/home/loginbar.jsp"%>
	<div class="wrap-movie-chart"
		style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>상영관 소개</h3>
		</div>
	</div>
			<img style="height:550px; padding-top: 30px; padding-left:50px;
				 padding-right:50px;" src="${path}/sangjin/resource/image/intro1.jpg">
			<br><br>
	<div class="sect-sorting" style="margin-top: 50px; padding-right:200px; padding-left:200px;">
			<img src="${path}/sangjin/resource/image/intro3.jpg">
	</div>
	<div style="height: 350px;"></div>
	<%@ include file="../../insang/footer/footer.jsp" %>
</body>
</html>