<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../sj_include/sangjincss.jsp"%>
<div class="sect-movie-chart">
	<ol>
		<!-- 영화 7건만 표시 -->
		<c:forEach var="row" items="${map.list}" varStatus="status">
			<li style="display: none;" id="mlist${status.index}">
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
						<span>${row.age}세 이상</span>
					</a> <span class="txt-info"> <strong> <!-- 개봉일자 --> <fmt:formatDate
								value="${row.release_date}" pattern="yyyy.MM.dd" /> <span>개봉</span>
					</strong>
					</span>
				</div>
			</li>
		</c:forEach>
	</ol>
</div>