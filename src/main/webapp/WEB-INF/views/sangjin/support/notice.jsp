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
</head>
<body>
	<%@ include file="../../sangjin/home/loginbar.jsp"%>
	<div class="wrap-movie-chart" style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>공지사항</h3>
		</div>
	</div>
	<div class="form_class" style="padding-top: 50px; padding-left: 380px;">
		<table border="1">
			<tr>
				<td style="text-align: center; background:#0082bf">
					<b style="color: white; font-size:25pt;">${dto.title}</b><br> [ <fmt:formatDate value="${dto.post_date}" pattern="yyyy-MM-dd HH:mm" /> ]</td>
			</tr>
					<c:set var="str" value="${fn:replace(dto.content,'  ','&nbsp;&nbsp;') }" />
					<c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />
			<tr>
				<td>
					<textarea style="resize: none;" readonly="readonly"
							id="content" name="content" rows="15" cols="130"><%="\n\n"%>${str}</textarea>
				</td>
			</tr>
		</table>
	</div>
	<div style="height: 350px;"></div>
	<%@ include file="../../insang/footer/footer.jsp" %>
</body>
</html>