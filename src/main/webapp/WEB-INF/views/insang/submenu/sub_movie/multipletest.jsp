<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
</head>
<body>
<form action="${path}/insang/test/multipletest.do" method="post" enctype="multipart/form-data">
<input type="file" name="multiplefile" multiple>
<input type="submit" value="go">
</form>
</body>
</html>