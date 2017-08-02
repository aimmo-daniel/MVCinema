<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
이건스틸컷임
<c:forEach var="row" items="${map.list}" varStatus="status">
	이미지 : ${row.img_url}
</c:forEach>
</body>
</html>