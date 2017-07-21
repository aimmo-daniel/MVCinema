<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../sw_include/template.jsp"%>
<link rel="stylesheet" href="${path}/sungwon/etc/css/sw_style.css?v=3">
<script>

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

$(function() {
	//중복확인 체크이벤트
	$("#btnCheckid").click(function() {
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
					$("#td_checkid").attr("hidden",false);
					$("#ck_id_icon").attr("style",'color:green')
					$("#ck_id_icon").addClass('glyphicon glyphicon-ok');
					$("#ck_id_result").html("사용 가능한 아이디 입니다.");
					$("#passwd").focus();
					id_status = true; 
				} else {
					$("#td_checkid").attr("hidden",false);
					$("#ck_id_icon").attr("style",'color:red')
					$("#ck_id_icon").addClass('glyphicon glyphicon-remove');
					$("#ck_id_result").html("이미 사용중인 아이디 입니다.");
					$("#userid").val("");
					$("#userid").focus();
				}  
			},
			error: function(x,e){
		            if(x.status==0){
		            alert('You are offline!!n Please Check Your Network.');
		            }else if(x.status==404){
		            alert('Requested URL not found.');
		            }else if(x.status==500){
		            alert('Internel Server Error.');
		            }else if(e=='parsererror'){
		            alert('Error.nParsing JSON Request failed.');
		            }else if(e=='timeout'){
		            alert('Request Time out.');
		            }else {
		            alert('Unknow Error.n'+x.responseText);
		            }
			} 
		});
	});
});
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
								<td class="td_input"><input class="form-control" name=userid
										id="userid"></td>
								<td class="td_button">
									<input type="button" role="button" class="btn btn-default" id="btnCheckid" value="중복확인">
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td  id="td_checkid" hidden="hidden" ><span id="ck_id_icon" style="color: red;"></span><b
									id="ck_id_result"></b></td>
							</tr>
							<tr>
								<td class="td_label"><label class="label label-default">비밀번호</label></td>
								<td class="td_input"><input type="password" class="form-control"
										name="passwd" id="passwd"></td>
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
										name="birth" id="birth" placeholder="930625"> <b
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
								<td><input class="form-control" placeholder="인증번호"></td>
								<td><button class="btn btn-default" id="rndNum_check">확인</button></td>
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
		<br>
		<br>
		<button class="btn btn-default btn-lg" style="position: relative; left: 45%;">회원가입</button>
	</section>
	<%@ include file="../sw_include/footer_menu.jsp"%>
</body>
</html>