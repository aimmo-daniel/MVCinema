<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
li {
 list-style: none;
}
</style>
<div class="wrap-movie-chart"
	style="padding-right: 200px; padding-left: 200px;">
	<!-- Heading Map Multi -->
	<div class="tit-heading-wrap">
		<h3>무비차트</h3>
		<a href="#" style="margin-top: 20px; float: right;"><span>+더보기</span></a>
	</div>
	<div class="sect-movie-chart">
		<ol>
			<!-- 영화1 -->
			<c:forEach var="i" begin="1" end="6">
				<li>
					<div class="box-image">
						<!-- 상세정보 페이지 URL입력 -->
						<a href="#"> <!-- DB에서 이미지를 받아옴 영화포스터--> <span
							class="thumb-image"> <img
								src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000079/79729/79729_185.jpg"
								alt="덩케르크 포스터" onerror="errorImage(this)"> <!-- 관람 등급 -->
								<span class="ico-grade grade-12">12세 이상</span>
						</span>
						</a>
					</div> <!-- 포스터 아래 영화이름과 개봉일자 -->
					<div class="box-contents">
						<a href="#"> <strong class="title">덩케르크</strong>
						</a> <span class="txt-info"> <strong> 2017.07.20 <span>개봉</span>
						</strong>
						</span>
					</div>
				</li>
			</c:forEach>
		</ol>
	</div>
</div>