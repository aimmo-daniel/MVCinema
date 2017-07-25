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
	//아이디 중복확인 체크
	var id_status = false;
	//아이디 양식 체크
	var id_rule= false;
	//비밀번호 양식 체크
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
	//이름
	var name;
	//나이
	var age = 0;
	//성별
	var gender = "";
	
	$(function() {
		//현재년도-100 부터 현재년도까지 select박스 에 추가
		var date = new Date();
		var this_year = date.getFullYear();
		for (var i = this_year - 100; i <= this_year; i++) {
			$("#year").append("<option value="+i+">" + i + "</option>");
		}
		//중복확인 체크이벤트
		$("#btnCheckid").click(function() {
					var userid = $("#userid").val();
					if (userid == "") {
						alert("아이디를 입력하세요");
						$("#userid").focus();
						return;
					}
					if(id_rule){
						var param = "userid=" + userid;
						$.ajax({
							type : "post",
							url : "${path}/member/checkid.do",
							data : param,
							success : function(result) {
								if (result.name == null) {
									$("#td_checkid").attr("hidden", false);
									$("#ck_id_icon").attr("style", 'color:green')
									$("#ck_id_icon").attr("class",'glyphicon glyphicon-ok');
									$("#ck_id_result").html("사용 가능한 아이디 입니다.");
									$("#userid").attr("disabled","disabled");
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
					}else{
						alert("아이디 양식이 맞지않습니다.");
						return;
					}
				});
		$("#check_email").click(function(){
			var email = $("#email").val();
			if (email == "") {
				alert("이메일을 입력해주세요");
				return;
			}
			if (!/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/.test(email)) {
				alert("이메일 형식이 아닙니다.");
				return;
			}
			var param = "email=" + email;
			//이메일 중복확인
			$.ajax({
				type : "post",
				url : "${path}/member/checkemail.do",
				data : param,
				success : function(result) {
					if (result.name == null) {
						alert("인증메일이 발송되었습니다.");
						$(".emailResult").attr("hidden", false);
						$("#user_num").focus();
						$.ajax({
							type : "post",
							url : "${path}/mail/sendMail.do",
							data : param,
							success : function(result) {
								rndNum = result;
							}
						});
					}else{
						alert("이미사용중인 이메일입니다.");
					}
				}
			});
		});
		//인증번호 체크
		$("#rndNum_check").click(function() {
			var userNum = $("#user_num").val();
			if (userNum == "") {
				alert("인증번호 7자리를 입력하세요");
				return;
			}
			if (userNum != rndNum) {
				$("#td_rndNum").attr("hidden",false);
				$("#icon_rndNum").attr("class", 'glyphicon glyphicon-remove');
				$("#icon_rndNum").attr("style", 'color:red');
				$("#text_rndNum").html("인증번호가 일치 하지 않습니다.");
				return;
			}
			if (userNum == rndNum) {
				$("#td_rndNum").attr("hidden",false);
				$("#icon_rndNum").attr("class", 'glyphicon glyphicon-ok');
				$("#icon_rndNum").attr("style", 'color:green');
				$("#text_rndNum").html("인증 완료");
				$("#user_num").attr("disabled",'disabled');
				$("#email").attr("disabled",'disabled');
				email_status = true;
			}
		});
		//회원가입 버튼 클릭이벤트
		$("#btnSignUp").click(
				function() {
					var userid = $("#userid").val();
					var name = $("#name").val();
					var password = $("#passwd").val();
					var email = $("#email").val();
					//아이디 정규화 양식에 맞지않다면
					if (!id_rule) {
						alert("아이디 양식이 맞지않습니다.")
						return;
					}
					//아이디 중복확인이 안된상태라면
					if (!id_status) {
						alert("아이디 중복확인이 완료되지않았습니다.")
						return;
					}
					//비밀번호 정규화 약식에 맞지않다면
					if (!pwd_rule) {
						alert("비밀번호가 적절하지 않습니다.")
						return;
					}
					//1차2차 비밀번호가일치하지않다면
					if (!pwd_match) {
						alert("비밀번호가 일치하지  않습니다.")
						return;
					}
					//이름이 입력안된상태라면
					if (name == "") {
						alert("이름이 입력되지않았습니다.")
						return;
					}
					//생년월일을 입력하지 않았다면
					if($("#year").val() == '' || $("#month").val() == '' || $("#day").val() == '' ){
						alert("생년월일을 모두 입력해주세요");
						return;
					}
					if(gender == ''){
						alert("성별을 입력해주세요");
						return;
					}
					//메일 인증이 안된상태라면 
					if (!email_status) {
						alert("이메일 인증이 완료되지않았습니다.")
						return;
					}
					//이용약관에 동의하지않았다면
					if (!cb_status) {
						alert("이용약관에 동의해주세요.")
						return;
					}
						var age = this_year - $("#year").val();
						var param = "userid=" + $("#userid").val()+
						"&passwd=" + $("#passwd").val() + 
						"&email=" + $("#email").val() + 
						"&name=" + $("#name").val() +
						"&gender=" +gender +
						"&age="+ age;

						$.ajax({
							type : "post",
							url : "${path}/member/signup.do",
							data : param,
							success : function(result) {
								if (result.message == 'success') {
									alert("회원가입이 완료되었습니다.");
									location.href = "${path}/member/login_page.do";
								} else {
									alert("회원 가입에 실패하였습니다.\n 잠시후 다시 시도해주세요");
								}
							}
						});

				});
	});
	//년도 선택후 월 출력하기
	function getMonth() {
		for (var i = 1; i <= 12; i++) {
			$("#month").append("<option value="+i+">" + i + "</option>");
		}
	}
	//월선택후 해당 월의 마지막 날구하기(윤달계산)
	function getLastDay() {
		var year = $("#year option:selected").val();
		var month = $("#month option:selected").val();
		//month 는 0 부터 시작해서..
		var day = 32 - new Date(year, month - 1, 32).getDate();
		if (day > 0) {
			for (var i = 0; i <= day; i++) {
				$("#day").append("<option value="+i+">" + i + "</option>");
			}
		}
	}
	//아이디 정규화
	function checkId(){
		var userid = $("#userid").val();
		if(userid == ''){
			$("#ck_id_icon").attr("class", '');
			$("#ck_id_result").html("");
			return;
		}
		if (!/^[a-zA-Z0-9]{6,15}$/.test(userid)) {
			$("#td_checkid").attr("hidden", false);
			$("#ck_id_icon").attr("style", 'color:red');
			$("#ck_id_icon").attr("class", 'glyphicon glyphicon-remove');
			$("#ck_id_result").html(" 숫자와 영문자 조합으로 6~15자리를 사용해야 합니다.");
			return;
		}
		$("#td_checkid").attr("hidden", false);
		$("#ck_id_icon").attr("style", 'color:orange');
		$("#ck_id_icon").attr("class", 'glyphicon glyphicon-warning-sign');
		$("#ck_id_result").html(" 사용가능한 양식입니다.\n 중복확인을 해주세요.");
			id_rule=true;
		}
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
	//성별 확인
	function getGender() {
		gender = $(":input:radio[name=group]:checked").val();
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
						<table>
							<tr>
								<td class="td_label"><label class="label label-default">아이디</label>
								</td>
								<td colspan="6" class="td_input"><input class="form-control"
										name=userid id="userid" onkeyup="checkId()"></td>
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
									class="form-control" name="year" id="year" onchange="getMonth()">
										<option value="">-</option>
								</select></td>
								<td style="width: 2.5%"><b>년</b></td>
								<td style="width: 28%"><select class="form-control" name="month"
									id="month" onchange="getLastDay()">
										<option value="">-</option>
								</select></td>
								<td style="width: 2.5%"><b>월</b></td>
								<td style="width: 28%"><select class="form-control" name="day"
									id="day">
										<option value="">-</option>
								</select></td>
								<td style="width: 3%"><b>일</b></td>
							</tr>
							<tr>
								<td><label class="label label-default">성별</label></td>
								<td colspan="3">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										type="radio" id="male" name="group" value="남" onclick="getGender()"><label for="male">남</label>
								</td>
								<td colspan="3"><input type="radio" id="female" name="group" value="여"
										onclick="getGender()"><label for="female">여</label></td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">이메일</label></td>
								<td colspan="6" class="td_input"><input type="email" name="email"
										id="email" class="form-control" placeholder="mvcinema@example.com"></td>
								<td class="td_button">
									<input type="button" class="btn btn-default" role="button" id="check_email" value="인증메일 발송">
								</td>
							</tr>
							<tr class="emailResult" hidden="hidden">
								<td>&nbsp;</td>
								<td colspan="6"><input class="form-control" placeholder="인증번호" id="user_num"></td>
								<td><input type="button" role="button" class="btn btn-default" id="rndNum_check" value="확인"></td>
							</tr>
							<tr class="emailResult" hidden="hidden">
								<td>&nbsp;</td>
								<td colspan="6" id="td_rndNum">
								<span id="icon_rndNum"></span>
								<b id="text_rndNum"></b></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<br>
		<br>
		<input type="button" role="button" class="btn btn-default btn-lg" id="btnSignUp"  value="회원 가입">
	</section>
	<%@ include file="../sw_include/footer_menu.jsp"%>
</body>