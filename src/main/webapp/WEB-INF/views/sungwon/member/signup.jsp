<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/template.jsp"%>
</head>
<body>

	<div class="nav-container">
		<nav class="nav-inner transparent">
			<div class="navbar">
				<div class="container">
					<div class="row">
						<div class="brand">
							<a href="index=.html">MVCinema</a>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>

	<section id="about" style="background-color: #DDDDDD;">
		<div class="container">
			<h1>회원가입</h1>
			<div class="row">
				<div class="wow fadeInUp col-md-5 col-sm-5" data-wow-delay="0.4s">
					<textarea class="form-control col-sm-70" rows="20" style="resize: none;"
						disabled="disabled"><%@include file="../etc/terms.jsp"%></textarea>
					<br>
					<input style="width: 25px; height: 25px;" type="checkbox" id="agree"
						name="agree" value="" onchange="agreeBox()">
					<label for="agree" style="position: relative; top: -9px">MVCinema
						이용약관에 동의<span style="color: white;">(필수)</span>
					</label>
				</div>
				<div class="wow fadeInUp col-md-7 col-sm-7" data-wow-delay="0.7s">
					<form class="form-inline" role="form" method="post" name="signup">
						<div class="form-group">
							<label class="label label-default" style="height:30px;">아이디</label>
							<input class="form-control" name=userid id="userid">
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<p>&nbsp;Copyright © 2016 Your Company Name - Designed by Tooplate</p>
</body>
</html>