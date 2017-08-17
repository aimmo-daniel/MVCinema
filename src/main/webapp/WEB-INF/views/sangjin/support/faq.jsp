<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVCINEMA</title>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/template.jsp"%>
<%@ include file="../../sangjin/sj_include/sangjincss.jsp"%>
<script>
$(document).ready(function() {
	basic_set();
});

function basic_set(){
	var keyword = String("all");
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
	<div style="height:300px;"></div>
	<%@ include file="../../insang/footer/footer.jsp" %>
</body>
</html>