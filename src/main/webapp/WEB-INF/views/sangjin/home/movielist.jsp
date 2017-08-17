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
	
	function buy_ticket(idx){
		location.href="${path}/ticket/movie_ticket_page.do?movie_idx="+idx;
	}
</script>
<div class="sect-sorting">
	<label for="order_type" class="hidden">정렬</label>
	 <select id="order_type" name="order_type" style="width: auto; height: 30px;">
		<c:choose>
			<c:when test="${map.order_type == 'grade' }">
				<option value="grade" selected>평점순</option>
				<option value="people">관람객순</option>
			</c:when>
			<c:when test="${map.order_type == 'people' }">
				<option value="grade">평점순</option>
				<option value="people" selected>관람객순</option>
			</c:when>
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
							<img src="${img_ad}/${row.img_url}"> <!-- 영화포스터 -->
						</span>
					</a>
					<button style="width: 96px;" class="btn btn-primary" type="button" onclick="movie_detail('${row.idx}')">
						<span>상세정보</span>
					</button>
					<button style="width: 96px;" class="btn btn-danger" type="button" onclick="buy_ticket('${row.idx}')">
						<span>예매하기</span>
					</button>
				</div>
				<div class="box-contents">
					<c:if test="${row.age >=19 }">
						<span class="label label-danger">${row.age}</span><b>${row.title}</b>
					</c:if> 
					<c:if test="${row.age >=15 && row.age <19 }">
						<span class="label label-warning">${row.age}</span><b>${row.title}</b>
					</c:if> 
					<c:if test="${row.age > 0 && row.age <15 }">
						<span class="label label-primary">${row.age}</span><b>${row.title}</b>
					</c:if> 
					<c:if test="${row.age == 0 }">
						<span class="label label-success">전체</span><b>${row.title}</b>
					</c:if>
					<span class="txt-info"> 
					<strong> <!-- 개봉일자 --> 
						<fmt:formatDate	value="${row.release_date}" pattern="yyyy.MM.dd" /> 
						<span>개봉</span> <b style="color:red">(★${row.grade}평점)</b>
					</strong>
					</span>
				</div>
			</li>
		</c:forEach>
	</ol>
</div>