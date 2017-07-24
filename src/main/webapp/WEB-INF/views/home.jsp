<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<title>MVCINEMA</title>
<%@ include file="include/header.jsp"%>
<%@ include file="include/template.jsp"%>
<%@ include file="sangjin/sj_include/sangjincss.jsp"%>
<script>
	function search(){
		var order_type=$('#order_type').val();
		var param="order_type="+order_type;
 		$.ajax({
			type: "post",
			url: "${path}/sort.do",
			data: param,
			success: function(result){
				console.log("result"+result);
			}
		});
	}
</script>
</head>
<body>
	<div class="preloader">
		<div class="sk-spinner sk-spinner-pulse"></div>
	</div>

	<%@ include file="sangjin/home/loginbar.jsp"%>
	<%@ include file="sangjin/sj_include/carousel.jsp"%>
	<div class="wrap-movie-chart"
		style="padding-right: 200px; padding-left: 200px;">
		<!-- Heading Map Multi -->
		<div class="tit-heading-wrap">
			<h3>무비차트</h3>
			<a href="#" style="margin-top: 20px; float: right;"><span>+더보기</span></a>
		</div>
		<div class="sect-sorting">
			<%-- <form name="form1" method="post" action="${path}/sort.do"> --%>
			<label for="order_type" class="hidden">정렬</label> <select
				id="order_type" name="order_type" style="width: auto; height: 30px;">
				<c:choose>
					<c:when test="${map.order_type == 'grade' }">
						<option value="rank">예매율순</option>
						<option value="grade" selected>평점순</option>
						<option value="people">관람객순</option>
					</c:when>
					<c:when test="${map.order_type == 'people' }">
						<option value="rank">예매율순</option>
						<option value="grade">평점순</option>
						<option value="people" selected>관람객순</option>
					</c:when>
					<c:otherwise>
						<option value="rank" selected>예매율순</option>
						<option value="grade">평점순</option>
						<option value="people">관람객순</option>
					</c:otherwise>
				</c:choose>
			</select>
			<button type="button" id="btnSearch" onclick="search()">
				<span>GO</span>
			</button>
			<!-- 		</form> -->
		</div>
		<div class="sect-movie-chart">
			<ol>
				<!-- 영화 7건만 표시 -->
				<c:forEach var="row" begin="0" end="6" items="${map.list}"
					varStatus="status">
					<li>
						<div class="box-image">
							<c:choose>
								<c:when test="${status.index < 3}">
									<strong class="rank"
										style="width: auto; height: auto; background: red;">No.${status.index+1}</strong>
								</c:when>
								<c:otherwise>
									<strong class="rank" style="width: auto; height: auto;">&nbsp;&nbsp;&nbsp;</strong>
								</c:otherwise>
							</c:choose>
							<!-- 상세정보 페이지 URL입력 -->
							<a href="#"> <span class="thumb-image"> <img
									src="${path}/sangjin/resource/image/${row.img_url}"> <!-- 영화포스터 -->
									<span class="ico-grade grade-12">12세이상</span> <!-- 관람 등급 -->
							</span>
							</a>
						</div>
						<div class="box-contents">
							<a href="#"> <strong class="title">${row.title}</strong> <!-- 영화제목 -->
							</a> <span class="txt-info"> <strong> <!-- 개봉일자 --> <fmt:formatDate
										value="${row.release_date}" pattern="yyyy.MM.dd" /> <span>개봉</span>
							</strong>
							</span>
						</div>
					</li>
				</c:forEach>
			</ol>
		</div>
	</div>
	<%@ include file="sangjin/home/scheduled.jsp"%>
</body>
</html>