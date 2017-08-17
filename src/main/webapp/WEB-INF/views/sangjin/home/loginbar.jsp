<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies. %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<%@ include file="../../sangjin/sj_include/sangjincss.jsp"%>
<div class="nav-container">
	<nav class="nav-inner transparent">
		<div class="navbar">
			<div class="container">
				<div class="row">
					<div class="brand">
						<a href="${path}">MVCINEMA</a>
					</div>
				</div> 
			</div>
		</div>
	</nav>
</div>
<nav id="topMenu">
	<ul>
		<li class="topMenuLi"><a class="menuLink" href="${path}">무비차트</a></li>
		<li class="topMenuLi"><a class="menuLink" href="${path}/ticket/date_ticket_page.do">예매</a>	</li>
		<li class="topMenuLi"><a class="menuLink" href="${path}/theater">상영관</a></li>
		<li class="topMenuLi"><a class="menuLink" href="${path}/support/main">고객센터</a></li>
		<li style="margin-left: 210px;" >
			<c:choose>
				<c:when test="${sessionScope.dto.userid == null}">
					<a class="btn btn-default" role="button"
						href="${path}/member/login_page.do">로그인</a>&nbsp;
					<a class="btn btn-default" role="button"
						href="${path}/member/signup_page.do">회원가입</a>
				</c:when>
				<c:when test="${sessionScope.dto.userid != null}">
					<b style="color: white;"><a href="${path}/member/myaccount_page.do" style="color: white;">${sessionScope.dto.name}</a>&nbsp;님&nbsp;&nbsp;</b>
					<a class="btn btn-default" role="button" href="${path}/logout.do">로그아웃</a>
				</c:when>
			</c:choose>
		</li>
	</ul>
</nav>