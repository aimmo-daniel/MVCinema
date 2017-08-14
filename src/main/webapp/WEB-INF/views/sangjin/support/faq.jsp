<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주찾는질문</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../../sangjin/sj_include/sangjincss.jsp"%>
<script>
$(document).ready(function() {
	list_faq();
});

function list_faq(){
	var keyword = $("#keyword").val();
	if (keyword == undefined) {
		keyword = String("all");
	}
	$.ajax({
		type : "get",
		url : "${path}/support/list_faq?keyword=" + keyword,
		success : function(result) {
			$("#faqlist").html(result);
		}
	});
}
</script>
</head>
<body>
	<%@ include file="../../sangjin/home/loginbar.jsp"%>
	<div id="faqlist"></div>
</body>
</html>