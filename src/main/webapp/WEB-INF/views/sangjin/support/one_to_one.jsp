<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../../sangjin/sj_include/sangjincss.jsp"%>
<script>

</script>
</head>
<body>
	<%@ include file="../../sangjin/home/loginbar.jsp"%>
	<div class="wrap-movie-chart" style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>1:1 문의</h3>
		</div>
	</div>
	<div class="one_to_one" style="width:900px; height: auto; margin-left: 320px; margin-top: 50px;">
		<div style="float: right;">
			<button type="button" class="btn btn-success btn" onclick="location.href='${path}/support/write'">
		  		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		  		<span>문의하기</span>
			</button>
		</div>
		<br><br>
	<table class="table table-bordered" style="width:900px;">
		<tr style="background: #0082bf; color:white;">
			<th style="width:15%; text-align:center;">문의번호</th>
			<th style="width:55%; text-align:center;">제목</th>
			<th style="width:15%; text-align:center;">작성일</th>
			<th style="width:15%; text-align:center;">답변상태</th>
		</tr>
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td>${row.idx}</td>
				<td>${row.title}</td>
				<td><fmt:formatDate	value="${row.post_date}" pattern="yyyy.MM.dd"/></td>
				<td>
					<c:if test="${row.admin_contact == null}">답변대기중</c:if>
					<c:if test="${row.admin_contact != null}">답변완료</c:if>
				</td>
			</tr>
		</c:forEach>
		<!-- 페이지 네비게이션 -->
		<tr>
			<td colspan="5" align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="javascript:list('1')"> [처음]</a>
				</c:if> 
				<c:if test="${map.pager.curBlock > 1 }">
					<a href="javascript:list('${map.pager.prevPage}')">[이전]</a>
				</c:if> 
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지이면 하이퍼링크 제거 -->
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')"> ${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach> 
				<!-- 전체페이지블록 개수가 현재페이지 블록이거나 더 크면 [다음] -->
				<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
					<a href="javascript:list('${map.pager.nextPage}')"> [다음]</a>
				</c:if> 
				<c:if test="${map.pager.curPage <= map.pager.totPage}">
					<a href="javascript:list('${map.pager.totPage}')"> [끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
</div>
</body>
</html>