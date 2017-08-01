<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../sj_include/sangjincss.jsp"%>
<script>
	$(document).ready(function() {
		for (var i = 0; i < 7; i++) {
			$("#mlist" + i).show();
		}
	});
	
	//영화 상세정보
	function movie_detail(idx){
		location.href="${path}/info/detail/"+idx;
	}
</script>
<div class="sect-sorting">
	<label for="order_type" class="hidden">정렬</label>
	 <select id="order_type" name="order_type" style="width: auto; height: 30px;">
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
	<button class="btn btn-primary" type="button" id="btnSearch" onclick="listMovie()">
		<span>GO</span>
	</button>
</div>
<div class="sect-movie-chart"> 
	<ol>
		<!-- 영화 7건만 표시 -->
		<c:forEach var="row" items="${map.list}" varStatus="status">
			<li style="display: none;" id="mlist${status.index}">
				<div class="box-image">
					<c:choose>
						<c:when test="${status.index < 3}">
							<strong class="rank" style="width: auto; height: auto; background: red;">
								No.${status.index+1}
							</strong>
						</c:when>
						<c:otherwise>
							<strong class="rank" style="width: auto; height: auto;">
								No.${status.index+1}
							</strong>
						</c:otherwise>
					</c:choose>
					<!-- 상세정보 페이지 URL입력 -->
					<a href="#" onclick="movie_detail('${row.idx}')"> 
						<span class="thumb-image">
							<img src="http://192.168.0.5/mvcinema/img/${row.img_url}"> <!-- 영화포스터 -->
						</span>
					</a>
					<button style="width: 96px;" class="btn btn-primary" type="button" onclick="movie_detail('${row.idx}')">
						<span>상세정보</span>
					</button>
					<button style="width: 96px;" class="btn btn-danger" type="button">
						<span>예매하기</span>
					</button>
				</div>
				<div class="box-contents">
					<strong class="title">${row.title}</strong>  <!-- 영화제목 --> 
					<span>${row.age}세 이상</span>
					<span class="txt-info"> 
					<strong> <!-- 개봉일자 --> 
						<fmt:formatDate	value="${row.release_date}" pattern="yyyy.MM.dd" /> 
						<span>개봉</span>
					</strong>
					</span>
				</div>
			</li>
		</c:forEach>
	</ol>
</div>