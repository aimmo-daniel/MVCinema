<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../sangjin/sj_include/session_check.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../../sangjin/sj_include/sangjincss.jsp"%>
<title>MVCINEMA</title>
<style>
th {
	width: 80px;
	background: #0082bf;
	color: white;
}
</style>
<script>
function write_oto(){
	var title=document.form1.title.value;
	var content=document.form1.content.value;
	if (title == "") {
		alert("제목을 입력하세요.");
		document.form1.title.focus();
		return;
	}
	if (content == "") {
		alert("내용을 입력하세요.");
		document.form1.content.focus();
		return;
	}
	document.form1.action = "${path}/support/write_oto.do";
	document.form1.submit();
}
</script>
</head>
<body>
	<%@ include file="../../sangjin/home/loginbar.jsp"%>
	<div class="wrap-movie-chart"
		style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>1:1문의</h3>
		</div>
	</div>
	<div class="form_class" style="padding-top: 50px; padding-left: 350px;">
		<form name="form1" id="form1" method="post" action="${path}/support/write_oto.do">
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input disabled="disabled"
						value="${dto.name}" style="border-radius: 5px;"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input id="userid" name="userid" disabled="disabled"
						value="${dto.userid}" style="border-radius: 5px;"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input disabled="disabled"
						value="${dto.email}" style="border-radius: 5px;"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input style="width: 740px;" id="title" name="title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea style="resize: none;" id="content"
							name="content" rows="15" cols="100"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<br>
	<div
		style="padding-right: 200px; padding-left: 200px; text-align: center;">
		<button style="width: 120px; height: 50px; font-size: 15pt;"
			type="button" id="btnWrite" class="btn btn-success" onclick="write_oto();">등록</button>
	</div>
</body>
</html>