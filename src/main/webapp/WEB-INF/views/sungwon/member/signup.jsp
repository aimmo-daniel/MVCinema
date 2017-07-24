<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../sw_include/template.jsp"%>
<link rel="stylesheet" href="${path}/sungwon/etc/css/sw_style.css?v=4">
<script>
	var date = new Date();
	var this_year = date.getFullYear();

	//아이디 중복확인 체크
	var id_status = false;
	//비밀번호 양식상태 체크
	var pwd_rule = false;
	//비밀번호 일치여부 체크
	var pwd_match = false;
	//이메일 중복확인
	var email_check = true;
	//이메일 인증상태 체크
	var email_status = false;
	//약관동의상태 체크
	var cb_status = false;
	//인증번호 
	var rndNum;
	//나이
	var age = 0;
	var gender = "";
	$(function() {
		//중복확인 체크이벤트
		$("#btnCheckid").click(
				function() {
					var userid = $("#userid").val();
					if (userid == "") {
						alert("아이디를 입력하세요");
						$("#userid").focus();
						return;
					}
					var param = "userid=" + userid;
					$.ajax({
						type : "post",
						url : "${path}/member/checkid.do",
						data : param,
						success : function(result) {
							if (result.name == null) {
								$("#td_checkid").attr("hidden", false);
								$("#ck_id_icon").attr("style", 'color:green')
								$("#ck_id_icon").addClass(
										'glyphicon glyphicon-ok');
								$("#ck_id_result").html("사용 가능한 아이디 입니다.");
								$("#passwd").focus();
								id_status = true;
							} else {
								$("#td_checkid").attr("hidden", false);
								$("#ck_id_icon").attr("style", 'color:red')
								$("#ck_id_icon").addClass(
										'glyphicon glyphicon-remove');
								$("#ck_id_result").html("이미 사용중인 아이디 입니다.");
								$("#userid").val("");
								$("#userid").focus();
							}
						}
					});
				});
	});

	//비밀번호 정규화
	function checkPwd() {
		var password = $("#passwd").val();

		if (password == '') {
			$("#ck_pwdrule_icon").addClass(false);
			$("#ck_pwdrule").attr("hidden", 'hidden');
			$("#resultPwd").html('');
			return;
		}

		if (!/^[a-zA-Z0-9]{6,15}$/.test(password)) {
			$("#ck_pwdrule").attr("hidden", false);
			$("#ck_pwdrule_icon").attr("style", 'color:red');
			$("#ck_pwdrule_icon").attr("class", 'glyphicon glyphicon-remove');
			$("#resultPwd").html('숫자와 영문자 조합으로 6~15자리를 사용해야 합니다.');
			return;
		}

		var checkNumber = password.search(/[0-9]/g);
		var checkEnglish = password.search(/[a-z]/ig);

		if (checkNumber < 0 || checkEnglish < 0) {
			$("#ck_pwdrule").attr("hidden", false);
			$("#ck_pwdrule_icon").attr("style", 'color:red')
			$("#ck_pwdrule_icon").attr("class", 'glyphicon glyphicon-remove');
			$("#resultPwd").html("숫자와 영문자를 혼용하여야 합니다.");
			return;
		}
		if (/(\w)\1\1\1/.test(password)) {
			$("#ck_pwdrule").attr("hidden", false);
			$("#ck_pwdrule_icon").attr("style", 'color:red')
			$("#ck_pwdrule_icon").attr("class", 'glyphicon glyphicon-remove');
			$("#resultPwd").html('같은 문자를 3번 이상 사용하실 수 없습니다.');
			return;
		}
		$("#ck_pwdrule").attr("hidden", false);
		$("#ck_pwdrule_icon").attr("style", 'color:#FFB432')
		$("#ck_pwdrule_icon").attr("class", 'glyphicon glyphicon-lock');
		$("#resultPwd").html('사용가능한 비밀번호 입니다.');
		pwd_rule = true;
	}
	//1차 2차 비밀번호 일치 확인
	function matchPwd() {
		var passwd1 = $("#passwd").val();
		var passwd2 = $("#passwd2").val();
		if (passwd1 == "") {
			alert(" 비밀번호를 입력하세요.");
			$("#passwd").val("");
			$("#passwd2").val("");
			$("#passwd").focus();
			return;
		}
		if (passwd1 == passwd2) {
			$("#ck_pwdmatch").attr("hidden", false);
			$("#ck_pwdmatch_icon").attr("style", 'color:green');
			$("#ck_pwdmatch_icon").attr("class", 'glyphicon glyphicon-ok');
			$("#matchPwd").html("일치");
			pwd_match = true;
		} else {
			$("#ck_pwdmatch").attr("hidden", false);
			$("#ck_pwdmatch_icon").attr("style", 'color:red');
			$("#ck_pwdmatch_icon").attr("class", 'glyphicon glyphicon-remove');
			$("#matchPwd").html("불일치");
		}
	}
	//약관동의 체크여부
	function agreeBox() {
		var isChecked = $("#agree").is(':checked');
		if (isChecked == true) {
			$("#agree").attr('value', 'agree');
			cb_status = true;
		} else {
			$("#agree").attr('value', 'disagree');
		}
	}
	//아이디 포커스
	function id_focus() {
		$("#userid").val("");
		$("#td_checkid").attr("hidden", "hidden");
		$("#ck_id_icon").attr("class", '');
		id_status = false;
	}
	//비밀번호 포커스
	function pwd_focus() {
		$("#passwd").val("");
		$("#passwd2").val("");
		$("#resultPwd").html('');
		$("#ck_pwdrule_icon").attr("class", '');
		$("#matchPwd").html('');
		$("#ck_pwdmatch_icon").attr("class", '');
		pwd_match = false;
		pwd_rule = false;
	}
	function getAge() {
		var birth = $("#birth").val();
		if (birth.length == 2) {
			var tmp_year = birth.substr(0, 2);
			if (tmp_year < 17) {
				var my_year = '20' + tmp_year;
			} else {
				var my_year = '19' + tmp_year;
			}
			var date = new Date();
			var this_year = date.getFullYear();
			age = this_year - my_year;
		}
		if (birth.length > 5) {
			$("#gender").focus();
		}
	}

	function resetAge() {
		$("#gender").val("");
		$("#birth").val("");
		age = 0;
		gender = "";
	}

	function getGender() {
		if (age == 0) {
			alert("생년월일을 먼저입력해주세요");
			$("#gender").val("");
			$("#birth").focus();
			return;
		}
		var sex = $("#gender").val();
		if (sex.length > 0) {
			$("#email").focus();
		}
		if (age > 17 && sex == 1 || age <= 17 && sex == 3) {
			gender = "남";
		} else if (age > 17 && sex == 2 || age <= 17 && sex == 4) {
			gender = "여";
		} else {
			alert("양식에 맞지 않습니다.");
			$("#gender").val("");
			$("#birth").val("");
			$("#birth").focus();
			return;
		}
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

	<section id="about" style="background-color: #e0e0e0;">
		<div class="container">
			<h1>회원가입</h1>
			<div class="row">
				<div class="col-md-5 col-sm-5">
					<textarea class="form-control col-sm-70" rows="20" style="resize: none;"
						disabled="disabled"><%@include file="../etc/terms.jsp"%></textarea>
					<input style="width: 25px; height: 25px;" type="checkbox" id="agree"
						name="agree" value="" onchange="agreeBox()">
					<label for="agree" style="position: relative; top: -9px">MVCinema
						이용약관에 동의<span style="color: red;">(필수)</span>
					</label>
				</div>
				<div class="col-md-7 col-sm-7">
					<form method="post" name="signup">
						<table >
							<tr>
								<td class="td_label"><label class="label label-default">아이디</label>
								</td>
								<td colspan="6" class="td_input"><input class="form-control"
										name=userid id="userid" onfocus="id_focus()"></td>
								<td class="td_button"><input type="button" role="button"
										class="btn btn-default" id="btnCheckid" value="중복확인"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="6" id="td_checkid" hidden="hidden"><span
									id="ck_id_icon" style="color: red;"></span><b id="ck_id_result"></b></td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">비밀번호</label></td>
								<td colspan="6" class="td_input"><input type="password"
										class="form-control" name="passwd" id="passwd" onkeyup="checkPwd()"
										onfocus="pwd_focus()"></td>
								<td class="td_button" id="ck_pwdrule" hidden="hidden"><span
									id="ck_pwdrule_icon"></span><b id=resultPwd></b></td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">비밀번호
										확인</label></td>
								<td colspan="6" class="td_input"><input type="password"
										class="form-control" name="passwd2" id="passwd2" onkeyup="matchPwd()"></td>
								<td class="td_button" id="ck_pwdmatch" hidden="hidden"><span
									id="ck_pwdmatch_icon"></span><b id=matchPwd></b></td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">이름</label></td>
								<td colspan="6" class="td_input"><input class="form-control"
										name="name" id="name"></td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">생년월일</label></td>
								<td class="td_input" style="width: 37%"><select
									class="form-control">
										<%
											for (int i = 1900; i <= 2017; i++) {
										%>
										<option><%=i%>
										</option>
										<%
											}
										%>
								</select></td>
								<td style="width: 3%"><b>년</b></td>
								<td style="width: 25%"><select class="form-control">
										<%
											for (int i = 1; i <= 12; i++) {
										%>
										<option><%=i%>
										</option>
										<%
											}
										%>
								</select></td>
								<td style="width: 3%"><b>월</b></td>
								<td style="width: 29%"><select class="form-control">
										<%
											for (int i = 1; i <= 31; i++) {
										%>
										<option><%=i%>
										</option>
										<%
											}
										%>
								</select></td>
								<td style="width: 3%"><b>일</b></td>
							</tr>
							<tr>
								<td><label class="label label-default">성별</label></td>
								<td colspan="3">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="group" value="남" checked="checked"><b>남</b> 
								</td>
								<td colspan="3">
								<input type="radio" name="group" value="여"><b>여</b>
								</td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">이메일</label></td>
								<td colspan="6" class="td_input"><input type="email" name="email"
										id="email" class="form-control" placeholder="mvcinema@example.com"></td>
								<td class="td_button">
									<button class="btn btn-default" id="check_eamil">인증메일 발송</button>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="6"><input class="form-control" placeholder="인증번호"></td>
								<td><button class="btn btn-default" id="rndNum_check">확인</button></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="6"><span class="glyphicon glyphicon-ok"
									style="color: green;"></span><b>이메일 인증결과</b></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<br>
		<br>
		<button class="btn btn-default btn-lg" style="position: relative; left: 45%;">회원가입</button>
	</section>
	<%@ include file="../sw_include/footer_menu.jsp"%>
</body>
