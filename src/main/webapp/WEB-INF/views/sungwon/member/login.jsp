<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../sw_include/template.jsp"%>
</head>
<body>
	<div class="nav-container">
		<nav class="nav-inner transparent">
			<div class="navbar">
				<div class="container">
					<div class="row">
						<div class="brand">
							<a href="${path}">MVCinema</a>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<section id="header" class="header-one">
		<div class="container">
			<div class="row" style="height: 280px;">
				<div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8">
					<div class="header-thumb" style="height: 280px;">
						<form name="login_form" class="wow fadeInUp" data-wow-delay="0.4s">
							<table class="table table-primary">
								<caption>
									<b style="color: black; font-size: 18px;">로그인</b>
								</caption>
								<tbody>
									<tr>
										<td><label for="userid">아이디</label></td>
										<td><input style="width: 250px; height: 30px" name=userid
												id="userid"></td>
									</tr>
									<tr>
										<td><label for="password">비밀번호</label></td>
										<td><input style="width: 250px; height: 30px" type="password"
												name=password id="password"></td>
									</tr>
									<tr>
										<td colspan="2" style="padding-top: 20px;">
											<button class="btn btn-default"
												style="width: 200px; height: 40px; margin-bottom: 5px;">
												<span class="glyphicon glyphicon-off"></span>&nbsp;로그인
											</button> <!--  
											<br><b class="text text-danger">아이디또는 비밀번호가 일치하지않습니다.</b> -->
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<br>
				</div>
			</div>
		</div>
	</section>
	<br>
	<section>
		<div align="center" class="wow fadeInUp" data-wow-delay="0.5s">
			<a href="${path}/member/signup_page.do" class="btn btn-default" role="button"><span
				class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a> <a href="#"
				class="btn btn-default" role="button"><span
				class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;아이디/비밀번호찾기</a>
		</div>
		<hr>
		<span class="glyphicons glyphicons-search"></span> <i class="icon-search"></i>
	</section>
	
	<%@ include file="../sw_include/footer_menu.jsp" %>
</body>
</html>