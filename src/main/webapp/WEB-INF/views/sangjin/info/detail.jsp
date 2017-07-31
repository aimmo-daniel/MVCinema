<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../sj_include/sangjincss.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../sangjin/home/loginbar.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>영화 상세정보</h2>
	<form method="post" name="form1">
		<table border="1" width="500px">
			<tr>
				<td>포스터</td>
				<td>${dto.img_url}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${dto.title}</td>
			</tr>
			<tr>
				<td>관람나이</td>
				<td>${dto.age}</td>
			</tr>
			<tr>
				<td>평점</td>
				<td>${dto.grade}</td>
			</tr>
			<tr>
				<td>감독</td>
				<td>${dto.director}</td>
			</tr>
			<tr>
				<td>배우</td>
				<td>${dto.actors}</td>
			</tr>
			<tr>
				<td>content</td>
				<td>${dto.content}</td>
			</tr>
			<tr>
				<td>개봉일</td>
				<td><fmt:formatDate value="${dto.release_date}"
						pattern="yyyy.MM.dd" /></td>
			</tr>
			<tr>
				<td>상영시간</td>
				<td>${dto.runtime}</td>
			</tr>
			<tr>
				<td>상영시간</td>
				<td><textarea name="preview" id="preview">${dto.preview}</textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>