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
<style>
li {
	list-style: none;
}
</style>
<title>MVCINEMA</title>
<%@ include file="include/header.jsp"%>
<%@ include file="include/template.jsp"%>
<%@ include file="sangjin/sj_include/sangjincss.jsp"%>
<%@ include file="sangjin/sj_include/Top.jsp" %>
<script>
	$(document).ready(function() {
		$("#expand").click(function() {
			$("[id^=mlist]").show();
			$("#expand").hide();
		});
		listMovie();
	});
	
	function listMovie() {
		var order_type = $("#order_type").val();
		if (order_type == undefined) {
			order_type = String("grade");
		}
		$.ajax({
			type : "get",
			url : "${path}/sort.do?order_type=" + order_type,
			success : function(result) {
				$("#listMovie").html(result);
				$("#order_type").show();
				$("#btnSearch").show();
				$("#expand").show();
				$("#hr_name").html("무비차트");
				$("#on_2").removeClass("on");
				$("#on_1").addClass("on");
			}
		});		
	}
	
 	function searchMovie(){
		var keyword = document.getElementById("keyword").value;
		var param="keyword="+keyword;
		$.ajax({
			type : "post",
			url : "${path}/searchMovie.do",
			data: param,
			success : function(result) {
				$("#listMovie").html(result);
				$("#order_type_div").hide();
				$("#hr_name").html("무비차트");
				$("#on_2").removeClass("on");
				$("#on_1").addClass("on");
			}
		});
	}
 	
 	function enterkey() {
        if (window.event.keyCode == 13) {
 			searchMovie();
        }
	}
	
	function scheduleMovie() {
		$.ajax({
			type : "get",
			url : "${path}/schedule.do",
			success : function(result) {
				$("#listMovie").html(result);
				$("#order_type_div").hide();
				$("#search_form_div").hide();
				$("#expand").hide();
				$("#hr_name").html("상영예정작");
				$("#on_1").removeClass("on");
				$("#on_2").addClass("on");
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="sangjin/home/loginbar.jsp"%>
	<%@ include file="sangjin/sj_include/carousel.jsp"%>
	<!-- ajax방식으로 영화목록 출력 -->
	<div class="wrap-movie-chart" style="padding-right: 200px; padding-left: 200px;">
		<div class="tit-heading-wrap">
			<h3 id="hr_name"></h3>
			<div class="submenu">
				<ul>
					<li id="on_1" class="on"><a href='javascript:void(0);' onclick='listMovie();'>무비차트</a></li>
					<li id="on_2"><a href='javascript:void(0);' onclick='scheduleMovie();'>상영예정작</a></li>
				</ul>
			</div>
		</div>
		
		<div id="listMovie"></div>
		
	</div>
	<div class="wrap-movie-chart"
		style="padding-right: 200px; padding-left: 200px; padding-bottom:7px;">
		<div class="tit-heading-wrap" style="height:10px; margin-top:1px;">
		</div>
	</div>
	<div style="padding-right: 200px; padding-left: 200px; height:250px;">
		<button type="button" style="float:right;" class="btn btn-default btn" id="expand">
			  		<span class="glyphicon glyphicon-plus" style="color:#23527c" aria-hidden="true"></span>
			  		<span style="color:#23527c">더보기</span>
		</button>
	</div>
	<%@ include file="insang/footer/footer.jsp" %>
</body>
</html>