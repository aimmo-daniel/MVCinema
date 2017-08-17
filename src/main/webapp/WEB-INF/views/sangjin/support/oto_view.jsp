<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../include/header.jsp"%>
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
	function delete_one() {
		var idx = $("#idx").val();
		if (confirm('문의내역을 삭제하시겠습니까?')) {
			location.href = "${path}/support/deleteOne?idx=" + idx;
		} else {
			return false;
		}
	}

	function list() {
		location.href = "${path}/support/one_to_one";
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
		<input type="hidden" id="idx" name="idx" value="${dto.idx}">
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
					<input disabled="disabled" value="${dto.name}" style="border-radius: 5px;">
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input id="userid" name="userid" disabled="disabled"
						value="${dto.userid}" style="border-radius: 5px;">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input disabled="disabled" value="${dto.email}" style="border-radius: 5px;">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<b><input style="width: 740px;" readonly="readonly"	value="${dto.title}"></b>
				</td>
			</tr>
			<%
				pageContext.setAttribute("newLineChar", "\n");
			%>
			<!-- 공백문자 처리 -->
			<c:set var="uc"	value="${fn:replace(dto.content,'  ','&nbsp;&nbsp;')}" />
			<c:set var="ac"	value="${fn:replace(dto.admin_content,'  ','&nbsp;&nbsp;')}" />
			<tr>
				<th>내용</th>
				<c:if test="${ac != ''}">
					<td>
						<textarea style="resize: none;" readonly="readonly" id="content"
							name="content" rows="15" cols="100">문의내용 :<%="\n\n"%>${uc}<%="\n\n"
						+"========================================================"
						+"===============\n\n"%>문의하신 질문에 대한 답변입니다. [ <fmt:formatDate value="${dto.admin_post_date}" pattern="yyyy-MM-dd HH:mm" /> ]<%="\n\n"%>${ac}</textarea>
					</td>
				</c:if>
				<c:if test="${ac == ''}">
					<td>
						<textarea style="resize: none;" readonly="readonly"
							id="content" name="content" rows="15" cols="100">문의내용 :<%="\n"%>${uc}
						</textarea>
					</td>
				</c:if>
			</tr>
		</table>
	</div>
	<br>
	<div
		style="padding-right: 200px; padding-left: 200px; text-align: center;">
		<button style="width: 120px; height: 50px; font-size: 15pt;"
			type="button" id="btnWrite" class="btn btn-info"
			onclick="list();">목록</button>
		<button style="width: 120px; height: 50px; font-size: 15pt;"
			type="button" id="btnWrite" class="btn btn-danger"
			onclick="delete_one();">삭제</button>
	</div>
</body>
</html>