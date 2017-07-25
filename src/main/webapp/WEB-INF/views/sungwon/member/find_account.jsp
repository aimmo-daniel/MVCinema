<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../include/header.jsp"%>
<%@ include file="../sw_include/template.jsp"%>
<link rel="stylesheet" href="${path}/sungwon/etc/css/sw_style.css?v=4">
<title>MVCinema</title>
<script>
	$(function() {
		$(function() {
			$("#login").addClass("active");
			$("#title").prop("hidden", false)
		});
		$("#btnFindid").click(function() {
			Find_id();
		});

		$("#email").keypress(function(e) {
			if (e.which == 13) {
				Find_id();
			}
		});
	});
	function Find_id() {
		var name = $("#user_name").val();
		var email = $("#email").val();
		if (name == "") {
			alert("이름을 입력하세요.");
			$("#user_name").focus();
			return;
		}
		if (email == "") {
			alert("이메일 입력하세요");
			$("#email").focus();
			return;
		}
		document.form_login.action = "${path}/member/findid.do";
		document.form_login.submit();
	}
</script>
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

	<section>
		<img src="../sungwon/etc/images/findaccount.jpg" style="height: 250px;">
	</section>
	<section id="about" style="background-color: white; padding-top: 3em;">
		<div class="container">
			<div class="col-md-6 col-sm-2">
				<h1>아이디 찾기</h1>
				<hr>
				<p>이름과 이메일 주소를 입력하면 아이디 를 확인하실수있습니다.</p>
				<div style="border: 2px solid gray; padding: 20px 10px 20px 10px; border-radius: 20px" >
				<table>
					<tr>
						<td><label for="name">이름</label></td>
						<td><input name="name" id="name"></td>
						<td rowspan="2"><input type="button" id="btnfindid" value="조회"></td>
					</tr>
					<tr>
						<td><label for="email">이메일</label></td>
						<td><input name="email" id="email"></td>
					</tr>
				</table>
				</div>
			</div>
			<div class="col-md-6 col-sm-2">
				<h1>비밀번호 찾기</h1>
				<hr>
				<p>아이디와 이메일 주소를 입력후 인증을 하시면 비밀번호를 변경하실수 있습니다.</p>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<%@ include file="../sw_include/footer_menu.jsp"%>
	<c:if test="${userid != null}">
		<br>
		<script>
			alert("아이디는 [ ${userid} ]입니다.");
		</script>
	</c:if>
</body>
</html>