<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVCINEMA</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../sangjin/sj_include/session_check.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../../sangjin/sj_include/sangjincss.jsp"%>
<script>
//글읽기
function view(idx){
	location.href="${path}/support/oto_view?idx="+idx;
}

//글쓰기
function userInfo(userid){
	location.href="${path}/support/write?userid="+userid;
}

//글 전체삭제
function deleteAll(userid){
	var param="userid="+userid;
	$.ajax({
		type: "post",
		url: "${path}/support/check_content.do",
		data: param,
		success: function(result){
			if(result == "null"){
				alert('삭제할 문의내역이 없습니다.')
			}else{
				if(confirm('모든 문의내역을 삭제하시겠습니까?')){
					location.href="${path}/support/deleteAll?userid="+userid;
				}else{
					return false;
				}
			}
		}
	});
}

//페이지넘기기
function list(userid,page) {
	location.href="${path}/support/one_to_one/"+userid+"?page="+page;
}
</script>
</head>
<body>
	<%@ include file="../../sangjin/home/loginbar.jsp"%>
	<div class="wrap-movie-chart" style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>1:1문의 내역</h3>
		</div>
	</div>
	<div class="one_to_one" style="width:900px; height: auto; margin-left: 320px; margin-top: 50px;">
		<div style="float: right;">
			<button type="button" class="btn btn-danger btn" onclick="deleteAll('${sessionScope.dto.userid}')">
		  		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
		  		<span>전체삭제</span>
			</button>
			<button type="button" class="btn btn-success btn" onclick="userInfo('${sessionScope.dto.userid}')">
		  		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		  		<span>문의하기</span>
			</button>
		</div>
		<br><br>
	<table class="table table-bordered" style="width:900px;">
		<tr style="background: #0082bf; color:white;">
			<th style="width:13%; text-align:center;">문의번호</th>
			<th style="width:55%; text-align:center;">제목</th>
			<th style="width:16%; text-align:center;">작성일</th>
			<th style="width:16%; text-align:center;">답변상태</th>
		</tr>
		<c:choose>
 			<c:when test="${map.list[0].idx == null}">
				<tr>
					<td style="text-align: center; vertical-align: middle; height: 250px;" colspan="4" ><b>1:1 문의 내역이 없습니다.</b></td>
				</tr>	
			</c:when>
		<c:otherwise>
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td style="text-align: center;">${row.idx}</td>
				<td><a href="javascript:view('${row.idx}')">${row.title}</a></td>
				<td><fmt:formatDate	value="${row.post_date}" pattern="yyyy-MM-dd HH:mm"/></td>
				<c:if test="${row.admin_content == null}">
					<td style="text-align: center; color:red;"><b>답변 대기중</b></td>
				</c:if>
				<c:if test="${row.admin_content != null}">
					<td style="text-align: center; color:green;"><b>답변 완료<br></b></td>
				</c:if>
			</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		<!-- 페이지 네비게이션 -->
		<tr>
			<td colspan="5" align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="javascript:list('${sessionScope.dto.userid}','1')"> [처음]</a>
				</c:if> 
				<c:if test="${map.pager.curBlock > 1 }">
					<a href="javascript:list('${sessionScope.dto.userid}','${map.pager.prevPage}')">[이전]</a>
				</c:if> 
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지이면 하이퍼링크 제거 -->
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${sessionScope.dto.userid}', '${num}')"> ${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach> 
				<!-- 전체페이지블록 개수가 현재페이지 블록이거나 더 크면 [다음] -->
				<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
					<a href="javascript:list('${sessionScope.dto.userid}','${map.pager.nextPage}')"> [다음]</a>
				</c:if> 
				<c:if test="${map.pager.curPage <= map.pager.totPage}">
					<a href="javascript:list('${sessionScope.dto.userid}','${map.pager.totPage}')"> [끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
</div>
</body>
</html>