<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
#sangjin a:hover {
	color: #ffffff;
	font: bold;
	background: #000000;
}

#sangjin ul {
	padding-top: 10px;
	margin-left: 220px;
	text-align: center;
}

#sangjin ul li {
	display: inline;
	font: bold 18px Dotum;
	padding: 0 10px;
}

#sangjin ul li a {
	padding: 0.5em 1em 0.5em 1em;
	text-decoration: none;
	color: #000000;
}

img {
	display: block;
    max-width: 100%;
    width: 1250px;
    margin-left: auto;
    margin-right: auto;
    height: auto;
}

</style>

<div class="nav-container">
	<nav class="nav-inner transparent">

		<div class="navbar">
			<div class="container">
				<div class="row">
					<div class="brand">
						<a href="${path}">MVCINEMA</a>
					</div>
					<div class="navicon" style="padding-top: 30px;">
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
				<div id="sangjin">
					<ul style="align:center;">
						<li><a href="#">HOME</a></li>
						<li><a href="#">MENU1</a></li>
						<li><a href="#">MENU2</a></li>
						<li><a href="#">MENU3</a></li>
						<li><a href="#">MENU4</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</div>
<br><br>
