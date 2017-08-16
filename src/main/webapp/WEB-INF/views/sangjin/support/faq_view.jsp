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
<script>
	function list() {
		location.href = "${path}/support/faq/";
	}
</script>
</head>
<body>
	<%@ include file="../../sangjin/home/loginbar.jsp"%>
	<div class="wrap-movie-chart"
		style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>자주찾는질문</h3>
		</div>
	</div>
	<div class="form_class" style="padding-top: 50px; padding-left: 390px; text-align: center;">
		<table border="1">
			<tr style="background: #0082bf; color: white; height: 50px;">
				<td><b style="font-size: 15pt;">&nbsp;&nbsp;&nbsp;[ ${dto.category} ] ${dto.question}</b></td>
			</tr>
			<%
				pageContext.setAttribute("newLineChar", "\n");
			%>
			<!-- 공백문자 처리 -->
			<c:set var="str" value="${fn:replace(dto.ask,'  ','&nbsp;&nbsp;')}" />
			<tr>
				<td>
					<textarea style="resize: none;" readonly="readonly"
						id="content" name="content" rows="15" cols="100"><%="\n\n"%>${str}</textarea>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<div style="padding-right: 200px; padding-left: 200px; text-align: center;">
		<button style="width: 120px; height: 50px; font-size: 15pt;"
			type="button" id="btnWrite" class="btn btn-info"
			onclick="list();">목록</button>
	</div>
</body>
</html>