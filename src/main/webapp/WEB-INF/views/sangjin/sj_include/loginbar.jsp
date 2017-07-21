<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<div class="nav-container">
	<nav class="nav-inner transparent">

		<div class="navbar">
			<div class="container">
				<div class="row">
					<div class="brand">
						<a href="index.html">Pure Mix</a>
					</div>
					<div class="navicon">
						<c:choose>
							<c:when test="${sessionScope.userid == null}">
								<div style="padding-top: 13px; padding-right: 5px;">
									<a class="btn btn-default" role="button"
										href="${path}/member/login_page.do">로그인</a>
								</div>
							</c:when>
							<c:when test="${sessionScope.userid != null}">
								<div style="padding-top: 13px; padding-right: 5px;">
									<b><a href="{path}/member/account.do">${sessionScope.userid}님</a></b>
									<a class="btn btn-default" role="button"
										href="${path}/main/logout.do">로그아웃</a>
								</div>
							</c:when>
						</c:choose>
						<div class="menu-container">
							<div class="circle dark inline">
								<i class="icon ion-navicon"></i>
							</div>
							<div class="list-menu">
								<i class="icon ion-close-round close-iframe"></i>
								<div class="intro-inner">
									<ul id="nav-menu">
										<li><a href="index.html">Home</a></li>
										<li><a href="about.html">About</a></li>
										<li><a href="blog.html">Blog</a></li>
										<li><a href="contact.html">Contact</a></li>
									</ul>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
</div>