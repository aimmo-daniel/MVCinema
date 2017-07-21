<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../sw_include/template.jsp"%>
<style>
table {
	width: 100%;
	cellpadding: 15px;
}

td {
	padding: 10px;
}

td.td_lable {
	width: 20%;
}



td.td_input {
	width: 50%;
}

td.td_button {
	width: 50%;
}
label.label.label-default{
font-size: 18px;
}
</style>
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

	<section id="about" style="background-color: #e0e0e0;">
		<div class="container">
			<h1>회원가입</h1>
			<div class="row">
				<div class="wow fadeInUp col-md-5 col-sm-5" data-wow-delay="0.4s">
					<textarea class="form-control col-sm-70" rows="20" style="resize: none;"
						disabled="disabled"><%@include file="../etc/terms.jsp"%></textarea>
					<input style="width: 25px; height: 25px;" type="checkbox" id="agree"
						name="agree" value="" onchange="agreeBox()">
					<label for="agree" style="position: relative; top: -9px">MVCinema
						이용약관에 동의<span style="color: red;">(필수)</span>
					</label>
				</div>
				<div class="wow fadeInUp col-md-7 col-sm-7" data-wow-delay="0.7s">
					<form method="post" name="signup">
						<table>
							<tr>
								<td class="td_label"><label class="label label-default">아이디</label></td>
								<td class="td_input"><input class="form-control" name=userid
										id="userid"></td>
								<td class="td_button">
									<button class="btn btn-default" id="checkId">중복확인</button>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><span class="@2x glyphicon glyphicon-remove"
									style="color: red;"></span><b>중복확인값</b></td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">비밀번호</label></td>
								<td class="td_input"><input type="password" class="form-control"
										name="password" id="password"></td>
								<td><span class="glyphicon glyphicon-lock" style="color: #FFB432;"></span><b>비밀번호
										정규화결과</b></td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">비밀번호
										확인</label></td>
								<td class="td_input"><input type="password" class="form-control"
										name="password2" id="password2"></td>
								<td><span class="glyphicon glyphicon-remove" style="color: red;"></span><b>비밀번호
										일치여부</b></td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">이름</label></td>
								<td class="td_input"><input class="form-control" name="name"
										id="name"></td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">생년월일</label></td>
								<td class="td_input" style="max-height: 20px;"><input
										style="width: 40%;" class="form-control col-md-5 col-sm-5"
										name="birth" id="birth" placeholder="930625"><b
									class="col-md-1 col-sm-1">-</b> <input style="width: 30px;"
										class="form-control col-md-5 col-sm-5" name="gender" id="gender"
										placeholder="1">
									<p class="col-md-1 col-sm-1">XXXXXX</p></td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">이메일</label></td>
								<td class="td_input"><input type="email" name="email" id="email"
										class="form-control"></td>
								<td class="td_button">
									<button class="btn btn-default" id="check_eamil">인증메일 발송</button>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><span class="glyphicon glyphicon-ok" style="color: green;"></span><b>이메일
										인증결과</b></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<br><br>
		<button class="btn btn-default" style="position: relative; left: 50%;">회원가입</button>
	</section>
	<p>&nbsp;Copyright © 2016 Your Company Name - Designed by Tooplate</p>
</body>
</html>