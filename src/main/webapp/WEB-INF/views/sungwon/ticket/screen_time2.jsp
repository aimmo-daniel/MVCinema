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
			<jsp:useBean id="now" class="java.util.Date" />
			<c:set var="count" value="0"></c:set>
			<c:if test="${row.start_time >  now }">
				<li id="t_${row.screen_idx}" class="list-group-item"
					onclick="selectTime('t_${row.screen_idx}')">
					<div class="col-md-1">
						<b> <fmt:formatDate value="${row.start_time}" pattern="HH:mm" /></b>
					</div>
					<div class=col-md-6>
						<c:if test="${row.age >=19 }">
							<span class="label label-danger" style="margin-left: 50px;">${row.age}</span>
						</c:if>
						<c:if test="${row.age >=15 && row.age <19 }">
							<span class="label label-warning" style="margin-left: 50px;">${row.age}</span>
						</c:if>
						<c:if test="${row.age > 0 && row.age <15 }">
							<span class="label label-primary" style="margin-left: 50px;">${row.age}</span>
						</c:if>
						<c:if test="${row.age == 0 }">
							<span class="label label-success" style="margin-left: 50px;">전체</span>
						</c:if>
						<b>${row.title }</b>
					</div> <b style="margin-left: 96px;">${row.t_name }</b> <span class="badge"
					style="margin-right: 20px;">${row.empty_sit}</span>
					 <c:set var="count"
						value="${count +1 }"></c:set>
				</li>
			</c:if>
			<c:set var="i" value="${status.index}"></c:set>
		</c:forEach>
		<c:if test="${count <= 0 }">
			<c:forEach var="i" begin="1" end="8">
				<li class="list-group-item">&nbsp;</li>
				<c:if test="${i == 2 }">
					<li class="list-group-item" style="text-align: center;"><b
						style="color: red;">해당일에 상영중인 영화가 없습니다.</b></li>
				</c:if>
			</c:forEach>
		</c:if>
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
					style="color: red;">해당일에 상영중인 영화가 없습니다.</b></li>
			</c:if>
		</c:forEach>
	</c:if>
</ul>
