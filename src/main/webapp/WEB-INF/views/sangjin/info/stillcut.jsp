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
		<c:forEach var="row" items="${map.list}" varStatus="status">
				<td><img src="${stc}/${row.img_url}.jpg"></td>
		</c:forEach>
</table>
</body>
</html>