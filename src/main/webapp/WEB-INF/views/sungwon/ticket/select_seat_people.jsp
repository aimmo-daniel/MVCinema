<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVCinema</title>
<%@include file="../../include/header.jsp"%>
<%@include file="../sw_include/template.jsp"%>
</head>
<body>
	<%@include file="../../sangjin/home/loginbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>
					<label class="label label-default">인원 선택</label>
				</h2>
				<div class="toolbar" role="toolbar" aria-label="...">
					<div class="btn btn-default btn-group" role="group" aria-label="1">1</div>
					<div class="btn btn-default btn-group" role="group" aria-label="2">2</div>
					<div class="btn btn-default btn-group" role="group" aria-label="3">3</div>
					<div class="btn btn-default btn-group" role="group" aria-label="3">4</div>
					<div class="btn btn-default btn-group" role="group" aria-label="3">5</div>
				</div>
			</div>
			<div class="col-md-6">
				<h2>
					<label class="label label-default">영화 정보</label>
				</h2>
				<p>시부랄</p>
			</div>
		</div>
	</div>
	<div>
		<h1>좌석 선택</h1>
		<p>좌석</p>
	</div>


	${screen_idx }
</body>
</html>