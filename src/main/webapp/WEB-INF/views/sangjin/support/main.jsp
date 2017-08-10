<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../../sangjin/sj_include/sangjincss.jsp"%>
<script>
function news(){
	location.href="${path}/support/news";
}

function faq(){
	location.href="${path}/support/faq";
}

function one_to_one(){
	location.href="${path}/support/one_to_one";
}
</script>
</head>
<body>
	<%@ include file="../../sangjin/home/loginbar.jsp"%>
	<div class="wrap-movie-chart" style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3>고객 센터</h3>
		</div>
		<div style="padding-top: 80px; padding-left: 130px;" class="support_button">
			<button type="button" class="btn btn-info btn-xl" style="width: 270px; height:270px;" onclick="news();">
		  		<span class="glyphicon glyphicon-list-alt" aria-hidden="true" style="font-size:70pt;"></span><br><br>
		  		<span style="font-size:15pt;">이벤트/공지사항</span><br>
		  		<span style="font-size: 10pt; color:black; text-align:center;">최신 소식을 확인하세요</span>
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-info btn-xl" style="width: 270px; height:270px;" onclick="faq();">
		  		<span class="glyphicon glyphicon-search" aria-hidden="true" style="font-size:70pt;"></span><br><br>
		  		<span style="font-size:15pt;">자주 찾는 질문</span><br>
		  		<span style="font-size: 10pt; color:black; text-align:center;">자주찾는 질문을 확인하세요</span>
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-info btn-xl" style="width: 270px; height:270px;" onclick="one_to_one();">
		  		<span class="glyphicon glyphicon-pencil" aria-hidden="true" style="font-size:70pt;"></span><br><br>
		  		<span style="font-size:15pt;">1:1 문의</span><br>
		  		<span style="font-size: 10pt; color:black; text-align:center;">365일 24시간 언제든지 문의해주세요</span>
			</button>
		</div>
	</div>
</body>
</html>