<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../include/header.jsp"%>

<h1 align="center">
	<span class="label label-warning">시간 선택</span>
</h1>
<br>
<ul class="list-group" style="overflow: auto; height: 400px;">
	<c:if test="${map.list != null }">
		<c:forEach var="row" items="${map.list}">
			<li class="list-group-item"><a href=#>${row.start_time}</a><span class="badge">${row.empty_sit}</span></li>
		</c:forEach>
	</c:if>
</ul>