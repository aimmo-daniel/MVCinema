<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<% pageContext.setAttribute("newLineChar", "\n"); %>
	<!-- 공백문자 처리 -->
	<c:set var="str" value="${fn:replace(dto.content,'  ','&nbsp;&nbsp;') }" />
	<!-- 줄바꿈 처리 -->
	<c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />
	${str}
</body>
</html>