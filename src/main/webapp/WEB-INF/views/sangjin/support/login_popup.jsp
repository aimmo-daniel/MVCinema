<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVCinema</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../sungwon/sw_include/template.jsp"%>
<script>
	$(function() {
		$(function() {
			$("#btnLogin").click(function() {
				Login();
			});

			$("#passwd").keypress(function(e) {
				if (e.which == 13) {
					Login();
				}
			});
		});
	});
	function Login() {
		var userid = $("#userid").val();
		var passwd = $("#passwd").val();
		if (userid == "") {
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return;
		}
		if (passwd == "") {
			alert("비밀번호를 입력하세요");
			$("#passwd").focus();
			return;
		}
			document.login_form.method = "post";
			document.login_form.action = "${path}/support/login.do";
			document.login_form.submit();
	}
	
	function signup_page(){
		window.close();
		opener.location.href="${path}/member/signup_page.do";
	}
	function findaccount_page(){
		window.close();
		opener.location.href="${path}/member/findAccount_page.do";
	}
</script>
</head>
<body>
<div class="container">
			<div class="row" style="height: 220px;">
				<div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8">
					<div class="header-thumb" style="height: 220px;">
						<form name="login_form" class="wow fadeInUp" data-wow-delay="0.4s">
							<table class="table table-primary">
								<caption>
									<b style="color: black; font-size: 18px;">로그인 이 필요한 서비스입니다.</b>
								</caption>
								<tbody>
									<tr>
										<td align="center"><label for="userid">아이디</label></td>
										<td align="center"><input style="width: 250px; height: 30px" name=userid
												id="userid"></td>
									</tr>
									<tr>
										<td align="center"><label for="passwd">비밀번호</label></td>
										<td align="center"><input style="width: 250px; height: 30px" type="password"
												name=passwd id="passwd"></td>
									</tr>
									<tr>
										<td colspan="2" style="padding-top: 20px;"align="center">
										<input type="button" id="btnLogin" class="btn btn-primary"
												style="width: 200px; height: 40px; margin-bottom: 5px;" 
												value="로그인">
											<br>
											<c:if test="${message == 'error' }">
											<b class="text text-danger">아이디또는 비밀번호가 일치하지않습니다.</b> 
											</c:if>
											<c:if test="${message == 'success' }">
												<script>
												window.close();
												opener.location.href="${path}/support/main";
												</script>
											</c:if>
											</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div align="center" class="wow fadeInUp" data-wow-delay="0.5s">
			<a href="javascript:signup_page()" class="btn btn-default" role="button">
			<span class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a> 
			<a href="javascript:findaccount_page()" class="btn btn-default" role="button"><span
				class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;아이디/비밀번호찾기</a>
		</div>
		<hr>
		<span class="glyphicons glyphicons-search"></span> <i class="icon-search"></i>
</body>
</html>