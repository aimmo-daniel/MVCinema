<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../../sangjin/home/loginbar.jsp"%>
<%@include file="../../include/header.jsp"%>
<%@include file="../sw_include/template.jsp"%>
<link rel="stylesheet" href="${path}/sungwon/etc/css/sw_style.css?v=4">
<script>
	var pwd_rule = false;
	var pwd_match = false;
	var notyet = "";
	var already = "";
	/*오늘 날짜 구하기*/
	// 오늘 날짜  yyyy-MM-dd 
	var tmp_today = new Date();

	$(function() {
		var param = "t_userid=${sessionScope.dto.userid}"
		$
				.ajax({
					type : "post",
					url : "${path}/ticket/myTicketList.do",
					data : param,
					success : function(result) {
						/* alert(result.list[0].t_start_time+"-"+tmp_today); */
						$("#count").html(result.list.length);
						for (var i = 0; i < result.list.length; i++) {
							var m_time = changeString(result.list[i].t_start_time);
							var c_time = new Date(m_time - 30 * 60 * 1000);
							if (m_time < tmp_today) {
								already += '<table class="table table-default"><tr>'
										+ '<td style="width:30%; padding:0px;">'
										+ '<img style="padding:0px; height:200px;"src="${img_ad}/'
										+ result.list[i].img_url+'"></td>'
										+ '<td style="width:70%; padding:0px;">'
										+ '<table class="table table-default" style="height:100%" >'
										+ '<tr>'
										+ '<td style="width:20%"><label>제목</label></td>'
										+ '<td>'
								if (result.list[i].t_age == 0) {
									already += '<label class="label label-success">전체이용가</label>'
								} else if (result.list[i].t_age > 0
										&& result.list[i].t_age < 15) {
									already += '<label class="label label-primary">'
											+ result.list[i].t_age
											+ '세 이용가</label>'
								} else if (result.list[i].t_age >= 15
										&& result.list[i].t_age < 19) {
									already += '<label class="label label-warning">'
											+ result.list[i].t_age
											+ '세 이용가</label>'
								} else if (result.list[i].t_age >= 19) {
									already += '<label class="label label-danger">'
											+ result.list[i].t_age
											+ '세 이용가</label>'
								}
								already += '<b>  '
										+ result.list[i].t_title
										+ '</b></td></tr>'
										+ '<tr>'
										+ '<tr>'
										+ '<td style="width:20%"><label>상영시간</label></td>'
										+ '<td><label>'
										+ result.list[i].t_start_time
										+ '</label></td></tr>'
										+ '<tr>'
										+ '<td style="width:20%"><label>인원수</label></td>'
										+ '<td><b>'
										+ result.list[i].t_people
										+ '명</b></td></tr>'
										+ '<td style="width:20%"><label>좌석</label></td>'
										+ '<td><b>'
										+ result.list[i].t_seat
										+ '<b></td></tr>'
										+ '<tr>'
										+ '<td style="width:20%"><label>티켓번호</label></td>'
										+ '<td><b>'
										+ result.list[i].t_serial_num
										+ '<b></td></tr>'
										+ '</table></td></tr>'
										+ '<tr><td colspan="2" align="right"><input class="btn btn-danger" type="button" value="삭제" onclick="t_delete(\''+result.list[i].t_serial_num+'\')"></td></tr>'
										+ '</table>'
							} else if (m_time > tmp_today) {
								notyet += '<table class="table table-default"><tr>'
										+ '<td style="width:30%; padding:0px;">'
										+ '<img style="padding:0px; height:200px;"src="${img_ad}/'
									+ result.list[i].img_url+'"></td>'
										+ '<td style="width:70%; padding:0px;">'
										+ '<table class="table table-default" style="height:100%" >'
										+ '<tr>'
										+ '<td style="width:20%"><label>제목</label></td>'
										+ '<td>'
								if (result.list[i].t_age == 0) {
									notyet += '<label class="label label-success">전체이용가</label>'
								} else if (result.list[i].t_age > 0
										&& result.list[i].t_age < 15) {
									notyet += '<label class="label label-primary">'
											+ result.list[i].t_age
											+ '세 이용가</label>'
								} else if (result.list[i].t_age >= 15
										&& result.list[i].t_age < 19) {
									notyet += '<label class="label label-warning">'
											+ result.list[i].t_age
											+ '세 이용가</label>'
								} else if (result.list[i].t_age >= 19) {
									notyet += '<label class="label label-danger">'
											+ result.list[i].t_age
											+ '세 이용가</label>'
								}
								notyet += '<b>'
										+ result.list[i].t_title
										+ '</b></td></tr>'
										+ '<tr>'
										+ '<tr>'
										+ '<td style="width:20%"><label>상영시간</label></td>'
										+ '<td><label>'
										+ result.list[i].t_start_time
										+ '</label></td></tr>'
										+ '<tr>'
										+ '<td style="width:20%"><label>인원수</label></td>'
										+ '<td><b>'
										+ result.list[i].t_people
										+ '명</b></td></tr>'
										+ '<td style="width:20%"><label>좌석</label></td>'
										+ '<td><b>'
										+ result.list[i].t_seat
										+ '<b></td></tr>'
										+ '<tr>'
										+ '<td style="width:20%"><label>티켓번호</label></td>'
										+ '<td><b>'
										+ result.list[i].t_serial_num
										+ '<b></td></tr>'
										+ '</table></td></tr>'
								if (tmp_today < c_time) {
									notyet += '<tr><td colspan="2" align="right"><input class="btn btn-warning" type="button" value="예매 취소" onclick="t_cancel(\''
											+ result.list[i].ticket_idx
											+ '\',\''
											+ result.list[i].screen_idx
											+ '\',\'' 
											+ result.list[i].t_seat 
											+ '\',\''
											+ result.list[i].t_title
											+ '\')"></td></tr>'
								}
								+'</table>'
							}
						}
						if (notyet == "") {
							notyet = '<b>상영 예정인 예매 내역이없습니다.';
						}
						if (already == "") {
							already = '<b>지난 예매 내역이 없습니다.';
						}
						$("#already").html($("#already").html() + already);
						$("#notYet").html($("#notYet").html() + notyet);
					}
				});
	});

	function myInfo() {
		$("#myInfo").css("display", 'block');
		$("#changePwd").css("display", 'none');
	}
	
	//비밀번호 수정시 비밀번호 체크 폼
	function checkPwd() {
		$("#myInfo").css("display", 'none');
		$("#modalPwd").modal();
	}
	//비밀번호 수정
	function changePwd() {
		var nowpwd = $("#now_pwd").val();
		var param = "userid=${sessionScope.dto.userid}&passwd=" + nowpwd;
		console.log(param);
		$.ajax({
			type : "post",
			url : "${path}/member/checkpwd.do",
			data : param,
			success : function(result) {
				if (result.result == 'fail') {
					$("#checkpwd_result").css("display", 'block');
				} else {
					$("#now_pwd").val("");
					$("#checkpwd_result").css("display", 'none');
					$("#modalPwd").modal('hide');
					$("#changePwd").css("display", 'block');
				}
			}
		});
	}

	//비밀번호 정규화
	function pwdRule() {
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
			pwd_match = false;
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
			pwd_match = false;
		}
	}
	function change_pwd() {
		if (!pwd_rule) {
			alert("비밀번호 형식이 올바르지 않습니다.");
			pwd_rule = false;
			return;
		}
		if (!pwd_match) {
			alert("비밀번호가 일치 하지 않습니다.");
			pwd_match = false;
			return;
		}
		if (pwd_rule && pwd_match) {
			var param = "userid=${sessionScope.dto.userid}&passwd="
					+ $("#passwd").val();
			$.ajax({
				type : "post",
				data : param,
				url : "${path}/member/changePwd.do",
				success : function(result) {
					if (result.message == 'fail') {
						alert("비밀번호 변경에 실패했습니다.\n 잠시후 다시시도해주세요");
						return;
					} else if (result.message == 'success') {
						alert("비밀번호 변경이 완료되었습니다.");
						document.location.href = "${path}";
					}
				}
			});
		}
	}
	//회원 탈퇴 폼
	function check_signOut() {
		if(confirm("정말로 탈퇴하시겠습니까?")){
		$("#changePwd").css("display", 'none');
		$("#myInfo").css("display", 'block');
		$("#modalOut").modal();
		}
	}
	//회원 탈퇴
	function signOut(){
		var nowpwd2 = $("#now_pwd2").val();
		var param = "userid=${sessionScope.dto.userid}&passwd=" + nowpwd2;
		console.log(param);
		$.ajax({
			type : "post",
			url : "${path}/member/signout.do",
			data : param,
			success : function(result) {
				if (result.message == 'fail') {
					alert("회원 탈퇴에 실패하였습니다. \n\n비밀번호를 확인해주세요");
					$("#now_pwd2").val("");
				} else {
					alert("회원 탈퇴 되었습니다.");
					$("#now_pwd2").val("");
					$("#now_pwd2").modal('hide');
					document.location.href="${path}/logout.do";
				}
			}
		});
	}

	function changeString(date) {
		var tmp_time = new Date(date);
		return tmp_time;
	}
	function t_cancel(t_idx, s_idx, t_seat, t_title) {
		if(confirm("정말로 예매를 취소하시겠습니까?")){
		$.ajax({
			type : "get",
			url : "${path}/ticket/cancel.do?ticket_idx=" + t_idx + "&screen_idx="
					+ s_idx + "&t_seat=" + t_seat+"&t_title="+t_title,
			success : function(result) {
				 if (result.message == 'success') {
					alert("예매가 취소 되었습니다.");
					document.location.reload();
				} else {
					alert("예매 취소에 실패하였습니다. 잠시 후 다시 시도해주세요");
				} 
			}
		});
		}
	}
	function t_delete(serial){
		if(confirm("정말로 예매내역을 삭제하시겠습니까?")){
			$.ajax({
				type : "get",
				url : "${path}/ticket/delete.do?t_serial_num="+serial ,
				success : function(result) {
					 if (result.message == 'success') {
						alert("삭제가 완료 되었습니다.");
						document.location.reload();
					} else {
						alert("삭제에 실패하였습니다. 잠시 후 다시 시도해주세요");
					} 
				}
			});
		}
	}
</script>
</head>
<body>
	<section id="single-project">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1 col-md-3 col-sm-offset-1 col-sm-4"
					style="margin-left: 10px;">
					<div class="project-info">
						<input type="button" class="btn btn-primary" value="내정보"
							style="width: 100%" onclick="myInfo()">
					</div>
					<br>
					<div class="project-info">
						<input type="button" class="btn btn-success" value="비밀번호 변경"
							style="width: 100%" onclick="checkPwd()">
					</div>
					<br>
					<div class="project-info">
						<input type="button" class="btn btn-warning" value="회원 탈퇴"
							style="width: 100%" onclick="check_signOut()">
					</div>
				</div>
				<!-- 내정보 -->
				<div class="wow fadeInUp col-md-7 col-sm-7" data-wow-delay="0.2s"
					id="myInfo" style="display: block;">
					<h1>내 정보</h1>
					<hr>
					<br>
					<table class="table table-striped">
						<tr>
							<td><label>아이디</label></td>
							<td><p>${sessionScope.dto.userid}</p></td>
						</tr>
						<tr>
							<td><label class=>이메일</label></td>
							<td><p>${sessionScope.dto.email}</p></td>
						</tr>
						<tr>
							<td><label>이름</label></td>
							<td><p>${sessionScope.dto.name}</p></td>
						</tr>
						<tr>
							<td><label>성별</label></td>
							<td><p>${sessionScope.dto.gender}</p></td>
						</tr>
						<tr>
							<td><label>나이</label></td>
							<td><p>${sessionScope.dto.age}</p></td>
						</tr>
					</table>
					<b>예매 내역&nbsp;&nbsp;&nbsp;&nbsp;<span id="count">0</span>건
					</b>
					<hr>
					<div id="myTicketList">
						<div id="notYet">
							<h2>
								<label class="label label-default">상영 전 영화</label>
							</h2>
						</div>
						<hr>
						<div id="already">
							<h2>
								<label class="label label-default">지난영화</label>
							</h2>
						</div>
					</div>
				</div>
				<!-- 비밀번호 변경 -->
				<div class="wow fadeInUp col-md-7 col-sm-7" data-wow-delay="0.2s"
					id="changePwd" style="display: none;">
					<h1>비밀번호 변경</h1>
					<br>
					<hr>
					<div>
						<label>비밀번호</label>
						<input type="password" class="form-control" id="passwd"
							onkeyup="pwdRule()" placeholder="숫자와 영문자 조합으로 6~15자리">
						<div id="ck_pwdrule" hidden="hidden">
							<span id="ck_pwdrule_icon"></span><b id=resultPwd></b>
						</div>
						<br>
						<label>비밀번호 확인</label>
						<input type="password" class="form-control" id="passwd2"
							onkeyup="matchPwd()">
						<div id="ck_pwdmatch" hidden="hidden">
							<span id="ck_pwdmatch_icon"></span><b id=matchPwd></b>
						</div>
					</div>
					<div class="modal-footer" style="width: 400px;">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="change_pwd()">확인</button>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 비밀번호 변경 확인 modal -->
	<div class="modal fade" id="modalPwd">
		<div class="modal-dialog" style="width: 400px;">
			<div class="modal-content" style="width: 400px;">
				<div class="modal-header" style="width: 400px;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">비밀번호 확인</h4>
				</div>
				<div class="modal-body" style="width: 400px;">
					<label>현재 비밀번호를 입력해주세요</label>
					<input type="password" class="form-control" id="now_pwd" placeholder="비밀번호">
					<p id="checkpwd_result" style="color: red; display: none;">비밀번호가 일치하지
						않습니다.</p>
				</div>
				<div class="modal-footer" style="width: 400px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="changePwd()">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원 탈퇴 확인 modal -->
	<div class="modal fade" id="modalOut">
		<div class="modal-dialog" style="width: 400px;">
			<div class="modal-content" style="width: 400px;">
				<div class="modal-header" style="width: 400px;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">비밀번호 확인</h4>
				</div>
				<div class="modal-body" style="width: 400px;">
					<label>현재 비밀번호를 입력해주세요</label>
					<input type="password" class="form-control" id="now_pwd2" placeholder="비밀번호">
					<p id="checkout_result" style="color: red; display: none;">비밀번호가 일치하지
						않습니다.</p>
				</div>
				<div class="modal-footer" style="width: 400px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="signOut()">확인</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>