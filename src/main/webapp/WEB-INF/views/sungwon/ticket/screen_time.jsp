<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../include/header.jsp"%>

<h1 align="center">
	<span class="label label-warning">시간 선택</span>
</h1>
<br>
<ul class="list-group" style="overflow: auto; height: 400px;">
	<c:if test="${map.list != null }">
		<c:forEach var="row" items="${map.list}" varStatus="status">
			<li class="list-group-item"><a href=# style="margin-left: 10px;"> <fmt:formatDate
						value="${row.start_time}" pattern="HH:mm" /></a> <b
				style="margin-left: 96px;">${row.t_name }</b> <span class="badge"
				style="margin-right: 20px;">${row.empty_sit}</span></li>
			<c:set var="i" value="${status.index}"></c:set>
		</c:forEach>
		<c:if test="${i < 7  }">
			<c:forEach var="i" begin="${i}" end="7">
				<li class="list-group-item">&nbsp;</li>
			</c:forEach>
		</c:if>
	</c:if>
	<c:if test="${map.list[0] == null }">
		<c:forEach var="i" begin="1" end="8">
			<li class="list-group-item">&nbsp;</li>
			<c:if test="${i == 2 }">
				<li class="list-group-item" style="text-align: center;"><b
					style="color: red;">해당일에 상영중인 시간이 없습니다.</b></li>
			</c:if>
		</c:forEach>
	</c:if>
</ul>

