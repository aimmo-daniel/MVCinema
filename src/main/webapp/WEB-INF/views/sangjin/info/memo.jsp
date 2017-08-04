<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../include/header.jsp"%>
<script src="${path}/sangjin/resource/js/jquery-1.11.3.min.js"></script>
<script src="${path}/sangjin/resource/js/star.js"></script>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('${path}/sangjin/resource/image/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:200px;height:50px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
<script>
function set_score(score){
	$('#score').val(score);
}

/* function list_memo(){
	var idx=$("#mv_idx").val();
	$.ajax({
		type : "get",
		url : "${path}/memo/list.do?idx=" + idx,
		success : function(result) {
			$("#memoAndScore").html(result);
		}
	}); 
}*/
</script>
</head>
<body>
<h2>평점/댓글</h2>
<hr>
<form method="post" action="${path}/memo/insert.do">
<input id="mv_idx" name="mv_idx" type="hidden" value="${dto.idx}"/>
<input id="userid" name="userid" type="hidden" value="${sessionScope.dto.userid}"/>
<span class="star-input">
	<span class="input">
    	<input type="radio" name="star-input" value="1" id="p1" onclick="set_score(1)">
    	<label for="p1">1</label>
    	<input type="radio" name="star-input" value="2" id="p2" onclick="set_score(2)">
    	<label for="p2">2</label>
    	<input type="radio" name="star-input" value="3" id="p3" onclick="set_score(3)">
    	<label for="p3">3</label>
    	<input type="radio" name="star-input" value="4" id="p4" onclick="set_score(4)">
    	<label for="p4">4</label>
    	<input type="radio" name="star-input" value="5" id="p5" onclick="set_score(5)">
    	<label for="p5">5</label>
  	</span>
  	<input type="hidden" id="score" name="score" value="">
</span>
<table>
	<tr>
		<td><textarea style="width:750px; height:85px; resize: none;" id="memo" name="memo"></textarea></td>
		<td><input style="width:85px; height:85px;" class="btn btn-primary" type="submit" value="등록"></td>
	</tr>
</table>
</form>
<!-- <input type="button" value="메모보기" onclick="list_memo()"> -->
<!-- <div id="memoAndScore"></div> -->

<table  style="width:835px;" class="table table-hover">
	<c:forEach var="memo" items="${memo_list}">
	<tr>
		<td style="width:20%">
			<c:forEach begin="1" end="${memo.score}">
				<b style="color: red;">★</b>
			</c:forEach>		
		</td>
		<td style="width:80%">
			<span style="color: blue; font-size: 15px;">${memo.userid}</span>
			<span style="font-size: 12px;"><fmt:formatDate value="${memo.post_date}" pattern="yyyy.MM.dd"/></span> 
			<br>
			<span style="color: black;">${memo.memo}</span>
		</td>
	</tr>
	</c:forEach>
</table>
<hr>
<div class="text-center">
	<ul class="pagination">
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
	</ul>
</div>
</body>
</html>