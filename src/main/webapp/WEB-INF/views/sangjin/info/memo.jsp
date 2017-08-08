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
/* 평점 스타일 */
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

.star-input2>.input2,
.star-input2>.input2>label:hover,
.star-input2>.input2>input:focus+label,
.star-input2>.input2>input:checked+label{display: inline-block;vertical-align:middle;background:url('${path}/sangjin/resource/image/grade_img2.png')no-repeat;}
.star-input2{display:inline-block; white-space:nowrap;width:200px;height:50px;line-height:30px;}
.star-input2>.input2{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input2>.input2>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input2>.input2.focus{outline:1px dotted #ddd;}
.star-input2>.input2>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input2>.input2>label:hover,
.star-input2>.input2>input:focus+label,
.star-input2>.input2>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input2>.input2>label:hover~label{background-image: none;}
.star-input2>.input2>label[for="q1"]{width:30px;z-index:5;}
.star-input2>.input2>label[for="q2"]{width:60px;z-index:4;}
.star-input2>.input2>label[for="q3"]{width:90px;z-index:3;}
.star-input2>.input2>label[for="q4"]{width:120px;z-index:2;}
.star-input2>.input2>label[for="q5"]{width:150px;z-index:1;}
.star-input2>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
<script>
$(function(){
	//댓글 페이지 넘길시 스크롤 내리기
	var hash=document.location.href;
	if(hash.indexOf("?page=") != -1){
		$('html, body').animate({scrollTop : 999999}, 0);
	}
	
	//평점을 선택할때마다 span태그의 text내용 변경
	$("input[name=star-input]").click(function(){
		var radioval=$("input[name=star-input]:checked").val();
		if(radioval == 1){
			$('#think').html("괜히 봤어요");
		}
		if(radioval == 2){
			$('#think').html("기대하진 말아요");
		}
		if(radioval == 3){
			$('#think').html("무난했어요");
		}
		if(radioval == 4){
			$('#think').html("기대해도 좋아요!");
		}
		if(radioval == 5){
			$('#think').html("너무 멋진 영화였어요!");
		}
	});
	$("input[name=star-input2]").click(function(){
		var radioval2=$("input[name=star-input2]:checked").val();
		if(radioval2 == 1){
			$('#think2').html("괜히 봤어요");
		}
		if(radioval2 == 2){
			$('#think2').html("기대하진 말아요");
		}
		if(radioval2 == 3){
			$('#think2').html("무난했어요");
		}
		if(radioval2 == 4){
			$('#think2').html("기대해도 좋아요!");
		}
		if(radioval2 == 5){
			$('#thin2k').html("너무 멋진 영화였어요!");
		}
	});
	
	//한줄평 작성
	var frm1 = $('#form1');
    frm1.submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: frm1.attr('method'),
            url: frm1.attr('action'),
            data: frm1.serialize(),
            success: function (data) {
            	location.reload();
            },
        });
    });
	
    //한줄평 수정/삭제후 ajax새로고침
	var frm2 = $('#form2');
    frm2.submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: frm2.attr('method'),
            url: frm2.attr('action'),
            data: frm2.serialize(),
            success: function (data) {
            	location.reload();
            },
        });
    });
    
});

//한줄평 수정
function update_memo(comment_num){
	alert(comment_num);
	$('#show_toggle'+comment_num).hide();
	$('#hide_toggle'+comment_num).show();
	$('#memo').attr("disabled",true);
	$('#submitbutton').attr("disabled",true);
	
	var star=document.getElementsByName('star-input2');
	for(var i=0; i<star.length; i++){
		if(star[i].checked == true){
			alert(star[i].value);
		}
	}
}

//한줄평 수정/삭제
function submitTest(mode,comment_num){
	if(mode == "update"){
		form2.action = "${path}/memo/update.do?comment_num="+comment_num;
		form2.submit();
	}else if(mode == "delete"){
		if(confirm('한줄평을 삭제하시겠습니까?')){
			form2.action = "${path}/memo/delete.do?comment_num="+comment_num;
			form2.submit();
		}else{
			return false;
		}
	}
}

//hidden 태그 score에 평점 적용
function set_score(score){
 	$('#score').val(score);
}

//댓글 페이지 넘김
function list(page) {
	var idx=$("#mv_idx").val();
	location.href="${path}/info/detail/"+idx+"?page="+page;
}

//평점 등록전 체크
function check(){
	var star=$("input[name=star-input]:checked").val();
	if(star == undefined){
		alert("평점을 적용해 주세요.");
		return false;
	}
	if(document.form1.memo.value == ""){
		alert("한줄평을 입력해 주세요.");
		return false;
	}
}

</script>
</head>
<body>
<h2>평점/한줄평</h2>
<hr>
<!-- form1 한줄평 작성폼 -->
<form name="form1" id="form1" method="post" action="${path}/memo/insert.do" onsubmit="return check();">
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
 	 	<input type="hidden" id="score" name="score" value="">
  	</span>&nbsp; &nbsp;
  	<span style="color: green;" id="think"></span>
</span>
<table>
	<tr>
		<!-- 로그인 여부에 따라 한줄평 등록 가능/불가 -->
		<c:if test="${sessionScope.dto.userid != null}">
			<td><textarea style="width:750px; height:85px; 
						resize: none;" id="memo" name="memo"></textarea></td>
			<td><input type="submit" value="등록" style="width:85px; height:85px;"
						 class="btn btn-primary" id="submitbutton"></td>
		</c:if>
 		<c:if test="${sessionScope.dto.userid == null}">
			<td><textarea style="width:750px; height:85px;
						 resize: none;" id="memo" name="memo" readonly="readonly" placeholder="로그인 후 이용 가능한 서비스입니다."></textarea></td>
			<td><input type="submit" disabled="disabled" value="등록" style="width:85px;
						 height:85px;" class="btn btn-primary"></td>
		</c:if>
	</tr>
</table>
</form>

<!-- form2 한줄평 출력폼 -->
<form name="form2" id="form2" method="post">
<div style="height: 500px;">
<table style="width:835px;" class="table table-hover">
	<c:forEach var="memo" items="${map.list}">
	<tr id="show_toggle${memo.comment_num}" style="display: block;">
		<!-- 평점에 따라 별갯수과 메시지 출력 -->
		<td style="width:100px;">
			<c:forEach begin="1" end="${memo.score}">
				<b style="color: red;">★</b>
			</c:forEach>
			<br>
			<c:if test="${memo.score == 1}">
				<span style="color: green; font-size:11px;">괜히 봤어요</span>
			</c:if>
			<c:if test="${memo.score == 2}">
			<span style="color: green; font-size:11px;">기대하진 말아요</span>
			</c:if>
			<c:if test="${memo.score == 3}">
			<span style="color: green; font-size:11px;">무난했어요</span>
			</c:if>
			<c:if test="${memo.score == 4}">
			<span style="color: green; font-size:11px;">기대해도 좋아요!</span>
			</c:if>
			<c:if test="${memo.score == 5}">
			<span style="color: green; font-size:11px;">너무 멋진 영화였어요!</span>
			</c:if>
		</td>
		<td>
			<span style="color: blue; font-size: 15px;">${memo.userid}</span>
			<span style="font-size: 12px;"><fmt:formatDate value="${memo.post_date}" pattern="yyyy.MM.dd"/></span> 
			<br>
			<span style="color: black;">${memo.memo}</span>
			<input type="hidden" id="idx" name="idx" value="${memo.idx}">
			<input type="hidden" id="comment_num" name="comment_num" value="${memo.comment_num}">
			<!-- 본인이 작성한 한줄평만 수정/삭제 가능 -->
			<c:if test="${sessionScope.dto.userid == memo.userid}">
			<button type="button" class="btn btn-warning btn-xs" onClick="update_memo('${memo.comment_num}');">
  				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
			</button>
			<button type="submit" class="btn btn-danger btn-xs" onClick="submitTest('delete','${memo.comment_num}')">
  				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
			</button>
			</c:if>
		</td>
	</tr>
	
	<!-- 숨겨져 있는 댓글폼 -->
	<tr id="hide_toggle${memo.comment_num}" style="display: none;">
		<td colspan="2">
		<span class="star-input2">
			<span class="input2">
		    	<input type="radio" name="star-input2" value="1" id="q1" onclick="set_score(1)">
		    	<label for="q1">1</label>
		    	<input type="radio" name="star-input2" value="2" id="q2" onclick="set_score(2)">
		    	<label for="q2">2</label>
		    	<input type="radio" name="star-input2" value="3" id="q3" onclick="set_score(3)">
		    	<label for="q3">3</label>
		    	<input type="radio" name="star-input2" value="4" id="q4" onclick="set_score(4)">
		    	<label for="q4">4</label>
		    	<input type="radio" name="star-input2" value="5" id="q5" onclick="set_score(5)">
		    	<label for="q5">5</label>
		 	 	<input type="hidden" id="score2" name="score2" value="">
		  	</span>&nbsp; &nbsp;
		  	<span style="color: green;" id="think2"></span>
		</span>
		<table>
			<tr>
				<td><textarea style="width:750px; height:85px; resize: none;" id="memo2" name="memo2">${memo.memo}</textarea></td>
				<td><button type="submit" style="width:85px; height:85px;" class="btn btn-success" onclick="submitTest('update','${memo.comment_num}')">수정</button></td>
			</tr>
		</table>
		</td>
	</tr>
	
	
	</c:forEach>
</table>
<hr>
	<!-- 페이지 네비게이션 -->
	<table style="margin-left: 200px;">
		<tr>
			<td colspan="5" align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="javascript:list('1')"> [처음]</a>
				</c:if> 
				<c:if test="${map.pager.curBlock > 1 }">
					<a href="javascript:list('${map.pager.prevPage}')">[이전]</a>
				</c:if> 
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지이면 하이퍼링크 제거 -->
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')"> ${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach> 
				<!-- 전체페이지블록 개수가 현재페이지 블록이거나 더 크면 [다음] -->
				<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
					<a href="javascript:list('${map.pager.nextPage}')"> [다음]</a>
				</c:if> 
				<c:if test="${map.pager.curPage <= map.pager.totPage}">
					<a href="javascript:list('${map.pager.totPage}')"> [끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
</div>
</form>
	<br><br><br><br><br>
</body>
</html>