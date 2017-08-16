<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp"%>
<script>
$("select").on("change",(function(){
	var keyword = $("#keyword").val();
	$.ajax({
		type : "get",
		url : "${path}/support/list_faq?keyword=" + keyword,
		success : function(result) {
			$("#faqlist").html(result);
		}
	});
}));

function faq_showAsk(idx){
	if($("#ask"+idx).prop("hidden")==true){
		$("[id^=ask]").hide();
		$("#ask"+idx).show();
		$("#ask"+idx).prop("hidden", false);
	}else{
		$("#ask"+idx).hide();
		$("#ask"+idx).prop("hidden", true);
	}
}

//페이지넘기기
function faq_list(page) {
	var keyword=$("#keyword").val();
	if (keyword == undefined) {
		keyword = String("all");
	}
	$.ajax({
		type : "get",
		url : "${path}/support/list_faq?keyword="+keyword+"&page="+page,
		success : function(result) {
			$("#faqlist").html(result);
		}
	});
}
</script>
<div class="wrap-movie-chart" style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>자주찾는질문</h3>
		</div>
	</div>
	<div class="sect-sorting" style="width:900px; height: auto; margin-left: 320px; margin-top: 50px;">
	카테고리 : 
	<label for="keyword" class="hidden">정렬</label>
	 <select id="keyword" name="keyword" style="border:2px solid; width: auto; height: 30px;">
		<c:choose>
			<c:when test="${map.keyword == 'all' }">
				<option value="all" selected>전체</option>
				<option value="reserve">예매관련</option>
				<option value="movie">영화관련</option>
				<option value="other">기타</option>
			</c:when>
			<c:when test="${map.keyword == 'reserve' }">
				<option value="all">전체</option>
				<option value="reserve" selected>예매관련</option>
				<option value="movie">영화관련</option>
				<option value="other">기타</option>
			</c:when>
			<c:when test="${map.keyword == 'movie' }">
				<option value="all">전체</option>
				<option value="reserve">예매관련</option>
				<option value="movie" selected>영화관련</option>
				<option value="other">기타</option>
			</c:when>
			<c:otherwise>
				<option value="all">전체</option>
				<option value="reserve">예매관련</option>
				<option value="movie">영화관련</option>
				<option value="other" selected>기타</option>
			</c:otherwise>
		</c:choose>
	</select>
	</div>
	<div class="faq" style="width:900px; height: auto; margin-left: 320px;">
	<table class="table table-bordered" style="width:900px;">
		<tr style="background: #0082bf; color:white;">
			<th style="width:10%; text-align:center;">번호</th>
			<th style="width:20%; text-align:center;">분류</th>
			<th style="width:70%; text-align:center;">질문</th>
		</tr>
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td style="text-align: center;">${row.idx}</td>
				<td style="text-align: center;"><b style="color: green;">${row.category}</b></td>
				<td onclick="faq_showAsk('${row.idx}');"><b style="color:#0082bf;">${row.question}</b></td>
			</tr>
         	<%
				pageContext.setAttribute("newLineChar", "\n");
			%>
			<!-- 공백문자 처리 -->
			<c:set var="str" value="${fn:replace(row.ask,'  ','&nbsp;&nbsp;')}" />
			<tr id="ask${row.idx}" hidden="hidden">
				<td colspan="4" style="text-align:right;">
					<b><textarea style="resize: none;" readonly="readonly"
						id="content" name="content" rows="15" cols="75"><%="\n\n"%>${str}</textarea></b>
				</td>
			</tr>
		</c:forEach>
		<!-- 페이지 네비게이션 -->
		<tr>
			<td colspan="5" align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="javascript:faq_listlist('1')"> [처음]</a>
				</c:if> 
				<c:if test="${map.pager.curBlock > 1 }">
					<a href="javascript:faq_list('${map.pager.prevPage}')">[이전]</a>
				</c:if> 
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지이면 하이퍼링크 제거 -->
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:faq_list('${num}')"> ${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach> 
				<!-- 전체페이지블록 개수가 현재페이지 블록이거나 더 크면 [다음] -->
				<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
					<a href="javascript:faq_list('${map.pager.nextPage}')"> [다음]</a>
				</c:if> 
				<c:if test="${map.pager.curPage <= map.pager.totPage}">
					<a href="javascript:faq_list('${map.pager.totPage}')"> [끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
</div>