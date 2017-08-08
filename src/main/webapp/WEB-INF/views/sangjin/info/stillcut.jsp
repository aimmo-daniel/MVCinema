<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<table>
		<!-- 영화 스틸컷 -->
		<tr>
		<c:forEach var="row" items="${map.list}" varStatus="status">
			<td><img src="${stc}/${row.img_url}.jpg"></td>
			<c:if test="${status.count mod 4 == 0 }"></tr><tr></c:if>
		</c:forEach>
		</tr>
</table>
</body>
</html>