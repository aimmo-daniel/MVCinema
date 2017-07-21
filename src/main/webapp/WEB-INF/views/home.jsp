<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<style>
li {
 list-style: none;
}
</style>

<title>MVCINEMA</title>
<%@ include file="include/header.jsp"%>
<%@ include file="include/template.jsp"%>
<%@ include file="sangjin/sj_include/sangjincss.jsp"%>
</head>
<body>
	<div class="preloader">
		<div class="sk-spinner sk-spinner-pulse"></div>
	</div>

	<%@ include file="sangjin/sj_include/loginbar.jsp"%>
	<%@ include file="sangjin/sj_include/carousel.jsp"%>


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

	<div class="wrap-movie-chart"
		style="padding-right: 200px; padding-left: 200px;">
		<!-- Heading Map Multi -->
		<div class="tit-heading-wrap">
			<h3>상영 예정작</h3>
			<a href="#" style="margin-top: 20px; float: right;"><span>+더보기</span></a>
		</div>
		<div class="sect-movie-chart">
			<ol>
				<!-- 영화1 -->
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
						</a>  <span class="txt-info"> <strong> 2017.07.20 <span>개봉</span>
						</strong>
						</span>
					</div>
				</li>
			</ol>
		</div>
	</div>
</body>
</html>