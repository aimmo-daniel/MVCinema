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
	var rndNum;
	var pwd_rule =false;
	var pwd_match=false;
	$(function() {
		//비밀번호 찾기 버튼클릭이벤트
		$("#btnFindPwd").click(function() {
			var userid = $("#userid").val();
			var email = $("#pwd_email").val();
			if (userid == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return;
			}
			if (email == "") {
				alert("이메일 입력하세요");
				$("#pwd_email").focus();
				return;
			}
			var param = "userid="+userid+"&email="+email;
			$.ajax({
				type:"post",
				url:"${path}/member/findpwd.do",
				data:param,
				success:function(result){
					if(result.name == 'fail'){
						$("#pwd_fail").css("display", "block");
					}else{
						$("#check_mail").modal(); 
						var param ="email="+email;
						$.ajax({
							type:"post",
							url:"${path}/mail/findpwdMail.do",
							data:param,
							success:function(result){
								rndNum = result;				
							}
						});
					}
				}
			});
		});
		//아이디 찾기 버튼클릭 이벤트
		$("#btnFindId").click(function() {
			var name = $("#name").val();
			var email = $("#id_email").val();
			if (name == "") {
				alert("이름을 입력하세요.");
				$("#name").focus();
				return;
			}
			if (email == "") {
				alert("이메일 입력하세요");
				$("#id_email").focus();
				return;
			}
			var param = "name=" + name + "&email=" + email;
			$.ajax({
				type : "post",
				url : "${path}/member/findid.do",
				data : param,
				success : function(result) {
					if (result.userid != null) {
						$("#id_fail").css("display", "none");
						$("#result_success").css("display", "block");
						$("#id_txt").html(result.userid);
					} else {
						$("#id_fail").css("display", "block");
						$("#result_success").css("display", "none");
					}
				}
			});
		});
		$("#id_email").keypress(function(e) {
			if (e.which == 13) {
				Find_id();
			}
		});
	});
		
	
	function match_pwdNum(){
		var userNum = $("#pwd_rndNum").val();
		if(userNum == ""){
			alert("인증번호를 입력하세요 ");
			return;
		}
		if(userNum != rndNum){
			alert("인증번호가 다릅니다.\n 정확히 확인후 입력해주세요");
			return;
		}
		if(userNum == rndNum){
			$("#check_mail").modal('hide'); 
		 	$("#change_pwd").modal(); 	
		}
	}
	
	//비밀번호 정규화
	function checkPwd() {
		var password = $("#passwd").val();

		if (password == '') {
			$("#ck_pwdrule_icon").addClass(false);
			$("#ck_pwdrule").attr("hidden", 'hidden');
			$("#resultPwd").html('');
			pwd_rule = false;
			return;
		}

		if (!/^[a-zA-Z0-9]{6,15}$/.test(password)) {
			$("#ck_pwdrule").attr("hidden", false);
			$("#ck_pwdrule_icon").attr("style", 'color:red');
			$("#ck_pwdrule_icon").attr("class", 'glyphicon glyphicon-remove');
			$("#resultPwd").html('숫자와 영문자 조합으로 6~15자리를 사용해야 합니다.');
			pwd_rule = false;
			return;
		}

		var checkNumber = password.search(/[0-9]/g);
		var checkEnglish = password.search(/[a-z]/ig);

		if (checkNumber < 0 || checkEnglish < 0) {
			$("#ck_pwdrule").attr("hidden", false);
			$("#ck_pwdrule_icon").attr("style", 'color:red')
			$("#ck_pwdrule_icon").attr("class", 'glyphicon glyphicon-remove');
			$("#resultPwd").html("숫자와 영문자를 혼용하여야 합니다.");
			pwd_rule = false;
			return;
		}
		if (/(\w)\1\1\1/.test(password)) {
			$("#ck_pwdrule").attr("hidden", false);
			$("#ck_pwdrule_icon").attr("style", 'color:red')
			$("#ck_pwdrule_icon").attr("class", 'glyphicon glyphicon-remove');
			$("#resultPwd").html('같은 문자를 3번 이상 사용하실 수 없습니다.');
			pwd_rule = false;
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
			pwd_match= false;
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
			pwd_match= false;
		}
	}
	function change_pwd(){
		if(!pwd_rule){
			alert("비밀번호 형식이 올바르지 않습니다.");
			pwd_rule=false;
			return;
		}
		if(!pwd_match){
			alert("비밀번호가 일치 하지 않습니다.");
			pwd_match= false;
			return;
		}
		if(pwd_rule && pwd_match){
			var param ="userid="+$("#userid").val()+"&passwd="+$("#passwd").val(); 
			$.ajax({
				type:"post",
				data:param,
				url:"${path}/member/changePwd.do",
				success:function(result){
					if(result.message == 'fail'){
						alert("비밀번호 변경에 실패했습니다.\n 잠시후 다시시도해주세요");
						return;
					}else if(result.message == 'success'){
						alert("비밀번호 변경이 완료되었습니다.");
						document.location.href="${path}/member/login_page.do";
					}		
				}
			});
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

	<section>
		<img src="../sungwon/etc/images/findaccount.jpg" style="height: 250px;">
	</section>
	<section id="about" style="background-color: white; padding-top: 3em;">
		<!-- 아이디 찾기 -->
		<div class="container">
			<div class="col-md-6 col-sm-2">
				<h1>아이디 찾기</h1>
				<hr>
				<p>이름과 이메일 주소를 입력하면 아이디 를 확인하실수있습니다.</p>
				<div
					style="border: 2px solid gray; padding: 20px 10px 20px 10px; border-radius: 20px;
					position: relative; top: 50px">
					<form method="post" name="find_id">
					<table>
						<tr>
							<td><label for="name" class="label label-default">이름</label></td>
							<td><input name="name" id="name" class="form-control" tabindex="0"></td>
							<td rowspan="2"><input style="width: 100%; height: 50%;" 
							type="button" id="btnFindId" value="조회" class="btn btn-default" tabindex="2"></td>
						</tr>
						<tr>
							<td><label for="id_email" class="label label-default" tabindex="1">이메일</label></td>
							<td><input name="email" id="id_email" class="form-control"></td>
						</tr>
					</table>
					</form>
				</div>
					<br>
				<span style="display:none; position:relative; left: 160px; font-size: 16px;" id="result_success">
				아이디는 [&nbsp;&nbsp;<b style="color:#0033ff" id="id_txt"></b>&nbsp;&nbsp;]입니다.
				</span>
				<span style="display:none; position:relative; left: 160px; font-size: 16px; color: red;" id="id_fail">
				일치하는 정보가 없습니다.
				</span>
			</div>
			<!-- 비밀번호찾기 -->
			<div class="col-md-6 col-sm-2">
				<h1>비밀번호 재설정</h1>
				<hr>
				<p>아이디와 이메일 주소를 입력후 인증을 하시면 비밀번호를 변경하실수 있습니다.</p>
				<div
					style="border: 2px solid gray; padding: 20px 10px 20px 10px; border-radius: 20px;
					position: relative; top: 21px;">
					<form method="post" name="find_pwd">
					<table>
						<tr>
							<td><label for="name" class="label label-default">아이디</label></td>
							<td><input name="userid" id="userid" class="form-control" tabindex="0"></td>
							<td rowspan="2"><input style="width: 100%; height: 50%;" 
							type="button" id="btnFindPwd" value="확인" class="btn btn-default" tabindex="2"></td>
						</tr>
						<tr>
							<td><label for="pwd_email" class="label label-default" tabindex="1">이메일</label></td>
							<td><input name="email" id="pwd_email" class="form-control"></td>
						</tr>
					</table>
					</form>
				</div>
				<span style="display:none; position:relative; left: 160px; top:-10px; font-size: 16px; color: red;" id="pwd_fail">
				일치하는 정보가 없습니다.</span>
			</div>
		</div>
	</section>
	<!-- 이메일 인증 modal -->
	<div class="modal fade" id="check_mail">
		<div class="modal-dialog" style="width: 400px;">
			<div class="modal-content" style="width: 400px;">
				<div class="modal-header" style="width: 400px;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">이메일 인증</h4>
				</div>
				<div class="modal-body" style="width: 400px;">
					<label>요청하신 메일로 인증메일이 발송되었습니다.</label>
					<input type="text" class="form-control" id="pwd_rndNum" placeholder="인증번호">
				</div>
				<div class="modal-footer" style="width: 400px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="match_pwdNum()">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 비밀번호 변경 modal -->
	<div class="modal fade" id="change_pwd">
		<div class="modal-dialog" style="width: 400px;">
			<div class="modal-content" style="width: 400px;">
				<div class="modal-header" style="width: 400px;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">비밀번호 재설정</h4>
				</div>
				<div class="modal-body" style="width: 400px;">
					<label>비밀번호</label>
					<input type="password" class="form-control" id="passwd" onkeyup="checkPwd()" 
					placeholder="숫자와 영문자 조합으로 6~15자리">
					<div id="ck_pwdrule" hidden="hidden"><span id="ck_pwdrule_icon"></span><b id=resultPwd></b></div>
					<br>
					<label>비밀번호 확인</label>
					<input type="password" class="form-control" id="passwd2" onkeyup="matchPwd()">
					<div id="ck_pwdmatch" hidden="hidden">
								<span id="ck_pwdmatch_icon"></span><b id=matchPwd></b></div>
				</div>
				<div class="modal-footer" style="width: 400px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="change_pwd()">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="../sw_include/footer_menu.jsp"%>
</body>
</html>