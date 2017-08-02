<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
배우목록
<c:forEach var="row" items="${map.list}" varStatus="status">
	이름 : ${row.name}
	이미지 : ${row.img_url}	
</c:forEach>
</body>
</html>