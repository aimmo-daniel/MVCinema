<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.dto.userid == null}">
	<script>
		alert("정상적인 접근경로가 아닙니다");
		location.href="${path}/member/login_page.do";
	</script>
</c:if>