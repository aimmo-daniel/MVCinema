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
	margin-left: 280px;
	margin-top: 3px;
	text-align: center;
}

#sangjin ul li {
	display: inline;
	font: bold 18px Dotum;
	padding: 0 10px;
	padding-left: 30px;
}

#sangjin ul li a {
	padding: 0.5em 1em 0.5em 1em;
	text-decoration: none;
	font: bold;
	color: #000000;
	font-family: 'NanumBarunGothic';
}

img {
	display: block;
	max-width: 100%;
	width: 1250px;
	margin-left: auto;
	margin-right: auto;
	height: auto;
	width: 1250px;
	margin-left: auto;
	margin-right: auto;
	margin-left: auto;
	margin-right: auto;
	margin-right: auto;
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
				</div>
				<div id="sangjin" style="margin-top: 30px;">
					<ul>
						<li><a href="#">영화</a></li>
						<li><a href="#">예매</a></li>
						<li><a href="#">극장</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
					<div style="float: right;">
						<c:choose>
							<c:when test="${sessionScope.userid == null}">
								<a class="btn btn-default" role="button"
									href="${path}/member/login_page.do">로그인</a>
							</c:when>
							<c:when test="${sessionScope.userid != null}">
								<b><a href="{path}/member/account.do">${sessionScope.userid}님</a></b>
								<a class="btn btn-default" role="button"
									href="${path}/main/logout.do">로그아웃</a>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</nav>
</div>
<br>
<br>
