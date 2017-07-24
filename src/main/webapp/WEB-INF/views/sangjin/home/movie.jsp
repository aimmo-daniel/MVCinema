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
	style="padding-right: 300px; padding-left: 300px;">
	<!-- Heading Map Multi -->
	<div class="tit-heading-wrap">
		<h3>무비차트</h3>
		<a href="#" style="margin-top: 20px; float: right;"><span>+더보기</span></a>
	</div>
	<div class="sect-sorting">
		<label for="order_type" class="hidden">정렬</label> 
		<select	id="order_type" name="order-type" style="width:auto; height: 30px;">
			<option title="현재 선택됨" selected="" value="1">예매율순</option>
			<option value="2">평점순</option>
			<option value="3">관람객순</option>
		</select>
		<button type="button"><span>GO</span></button>
	</div>
	<div class="sect-movie-chart">
		<ol>
			<!-- 영화1 -->
			<c:forEach var="i" begin="1" end="6">
				<c:if test=${i == 4}>
				</c:if>
				<li>
					<div class="box-image">
						<c:choose>
							<c:when test="${i < 4}">
								<strong class="rank"
									style="width: auto; height: auto; background: red;">No.${i}</strong>
							</c:when>
							<c:otherwise>
								<strong class="rank" style="width: auto; height: auto;">&nbsp;&nbsp;&nbsp;</strong>
							</c:otherwise>
						</c:choose>
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