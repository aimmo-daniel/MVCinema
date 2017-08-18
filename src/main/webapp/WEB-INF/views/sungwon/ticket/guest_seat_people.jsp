<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVCinema</title>
<%@include file="../../include/header.jsp"%>
<%@include file="../sw_include/template.jsp"%>
<style>
.loader {
  border: 12px solid #f3f3f3;
  border-radius: 50%;
  border-top: 12px solid #3498db;
  width: 50px;
  height: 50px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
</style>
<script>
var title; //영화제목
var age; //영화 나이제한
var select_date //상영 일시
var theater_name //상영관 이름
var people; //인원수
var seat; //좌석 번호 (배열)
var theater_price; //상영관 가격
var total_price; //결제 금액
var  checkMail = false;
var rndNum; 
var email;


$(function(){
	$.ajax({
		type:"get",
		url:"${path}/ticket/select_movieTime.do?screen_idx="+${screen_idx},
		success: function(result) {
			//영화 나이제한 저장&등록
			age= result.age;
			if(age == 0 ){
				$("#sm_age").html('<label class="label label-success">전체이용가</label>');
				$("#m_age").html('<label class="label label-success">전체이용가</label>');
			}else if(age > 0 && result.age <15){
				$("#sm_age").html('<label class="label label-primary">'+result.age+'세 이용가</label>');					
				$("#m_age").html('<label class="label label-primary">'+result.age+'세 이용가</label>');
			}else if(age >= 15 && result.age <19){
				$("#sm_age").html('<label class="label label-warning">'+result.age+'세 이용가</label>');					
				$("#m_age").html('<label class="label label-warning">'+result.age+'세 이용가</label>');
			}else if(age >= 19){
				$("#sm_age").html('<label class="label label-danger">'+result.age+'세 이용가</label>');					
				$("#m_age").html('<label class="label label-danger">'+result.age+'세 이용가</label>');
			}
			//영화저장 저장&등록
			title = result.title;
			$("#sm_title").html(result.title);
			$("#m_title").html(result.title);
			
			//상영일시 저장&등록
			select_date = changeDate(result.start_time);
			$("#sm_date").html(select_date);
			$("#d_date").html("시간 :"+select_date);
			
			$("#d_select").css("display",'none');
			$("#select_screen").css("display",'block');
			
			//상영관 이름 저장&등록
			theater_name = result.t_name;			
			$("#sm_tname").html(theater_name);
			$("#d_tname").html("상영관 :"+theater_name);
			$("#m_poster").css("display",'block');
			$("#m_noselect").css("display",'none');
			$("#m_poster").attr("src",'${img_ad}/'+result.img_url);
			//상영관 가격 저장&등록
			theater_price = result.price;
			$("#s_price").html(theater_price);
			//인원을 기본값 1로 셋팅
			choose_people(1); 
		}		
	});
});

function prev_page(){
	history.back();
}

//날짜및 시간 
function changeDate(date){
	date = new Date(parseInt(date));
	year = date.getFullYear();
	month = date.getMonth()+1;
	if(month < 10){
		month = "0" + month;
	}
	day = date.getDate();
	if(day < 10){
		day = "0"+ day;
	}
	hour = date.getHours();
	if(hour < 10){
		hour = "0"+ hour;
	}
	minute = date.getMinutes();
	if(minute < 10){
		minute = "0"+ minute;
	}
	strDate = year +"-" +month +"-"+day+" "+hour+":"+minute;
	return strDate;
}

//인원 선택
function choose_people(id){
	
	var span = $("#seat_drawing td span");
	for(var j=0; j<span.length; j++){
			if($("#"+span[j].id).css("background-color") == 'rgb(102, 153, 255)'){
				 $("#"+span[j].id).css("background-color",'#FFFFFF'); 
				 $("#s_seatNum").html("");
				 $("#btn_reservation").css("display",'none');
			}
		}
	
	var btn = $(".toolbar div");	
	for(var i=0; i<10; i++){
		if(btn[i].id == id){
			$("#"+id).css("background-color",'#6699FF');		
			people = id ;
			people = parseInt(people);
			seat = new Array(people);
			index=0;
			$("#s_people").html(people);
			total_price = theater_price * people
			$("#s_total").html(total_price);
		}else{
			$("#"+btn[i].id).css("background-color",'#FFFFFF');
		}
	}
	
}
//인원수 제한을 위한 변수
var index = 0;
//좌석 선택 메소드
function selectSeat(value){
	
	//선택한 좌석 을또 선택한경우
 	if($("#seat"+value).css("background-color") == 'rgb(102, 153, 255)'){
		return;
	} 
	//좌석수를 모두 채운후 다른 좌석 선택한경우
	if(seat.length == index){
		$("#seat"+seat[0]).css("background-color",'#FFFFFF');
		for(var i =0 ; i<seat.length; i++){
			seat[i] = seat[i+1];
			if(i == seat.length-1){
				seat[seat.length-1] = value;
				$("#seat"+seat[seat.length-1]).css("background-color",'#6699FF');
			}
		}
	}
	//좌석이 다선택되지않았을경우
	if(seat.length > index){
			seat[index] = value;
			$("#seat"+seat[index]).css("background-color",'#6699FF');
			index++;
	}
	/* alert(seat.toString()); */
	$("#s_seatNum").html(seat.toString());
	$("#btn_reservation").css("display",'block');
}

function reservation(){
	//영화 상영정보 검사	
	if(title == null && age <= 0 || select_date == null || theater_name == null){
		alert("상영정보가 올바르지 않습니다.\n 잠시후 다시 시도해주세요");
		return;
	}
	//인원수 선택검사
	if(people <= 0){
		alert("인원수를 선택해주세요");
		return;
	}
	//좌석수 선택검사
	for(var i =0 ; i<seat.length; i++){
		if(seat[i] == null){
			alert("인원수와 선택한 좌석이 맞지 않습니다.")			
			return;
		}
	}
	$.ajax({
		type:"post",
		url:"${path}/ticket/guest_payment_page.do",
		success: function(result){
			$("#seat_info").html(result);
			$("#btn_reservation").css("display",'none');
		}
	});
}

function card_type(){
	$("#test").css("display",'none');
	var IMP = window.IMP; // 생략가능
	IMP.init('imp25851792');
	
	IMP.request_pay({
	    pg : 'danal', // version 1.1.0부터 지원.
	    pay_method : 'phone',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : title,
	    amount : total_price,
	    buyer_email : email,
	    buyer_name : '비회원',
	    /* buyer_tel : '010-1234-5678', */ 
	    /* buyer_addr : '서울특별시 강남구 삼성동', */
	    /* buyer_postcode : '123-456', */
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        history.back();
	        msg +=  rsp.error_msg;
	    }
	    alert(msg);
	});
	
}
function test_type(){
	$("#test").css("display",'block');
}

function final_payment(){
	var guestage = $("#phone_ssn").val();
	guestage = guestage.substring(0,2);
	thisyear = new Date()
	thisyear = thisyear.getFullYear();
	thisyear = thisyear.toString();
	thisyear = thisyear.substring(2,4);
	
	if((thisyear - guestage) < 0 ){
		guestage = (thisyear - guestage) + 100;
	}else{
		guestage = (thisyear - guestage)
	}
	if(checkMail == false){
		alert("이메일이 인증 되지 않았습니다.");
		return;
	}
	if($("#phone_type").val() == "-" || $("#phone_type").val() == "" || $("#phone_type").val() == null){
		alert("통신사를 선택해주세요");
		return;
	}
	if($("#phone_no1").val() != '010' || $("#phone_no2").val().length < 3 || $("#phone_no3").val().length != 4){
		alert("핸드폰번호가 양식에 맞지 않습니다.")
		return;
	}
	if($("#phone_ssn").val() == "" || $("#phone_ssn").val() == null || $("#phone_ssn").val().length !=6 ){
		alert("생년월일 양식이 맞지않습니다.");
		return;
	}
	if(guestage < age ){
		alert("영화등급을 확인해주세요");
		return;
	}
	$("#seat_info").css("display",'none');
	$("#loading").css("display",'block');
	
	var param = "t_userid=guest"+"&t_title="+title
	+"&t_age="+age+"&t_start_time="+select_date+"&t_theater="+theater_name
	+"&t_people="+people+"&t_seat="+seat+"&t_price="+total_price+"&screen_idx="+${screen_idx}+"&email="+email; 
	/* alert(param); */
	$.ajax({
		type:"post",
		url:"${path}/ticket/payment.do",
		data:param,
		success: function(result){
			$("#loading").css("display",'none');
			$("#seat_info").css("display",'block');
			if(result.message == 'fail'){
				alert("예매에 실패하였습니다. 잠시후 다시시 도해주세요");
				return;
			}else{
				alert("예매가 완료되었습니다.\n 비회원 예매내역은 이메일에서만 확인가능합니다.");
				document.location.href="${path}";
			}
		}
	});
}


function check_mail(){
	email= $("#guest_email").val();
	if (email == "") {
		alert("이메일을 입력해주세요");
		return;
	}
	if (!/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/.test(email)) {
		alert("이메일 형식이 아닙니다.");
		return;
	}
	$("#check_rndNum").prop("hidden",false);
	alert("메일 이 발송되었습니다.");
	var param = "email="+email;
	$.ajax({
		type : "post",
		url : "${path}/mail/guestMail.do",
		data : param,
		success : function(result) {
			rndNum = result;
		}
	});
}

function rnd_check(){
	var userNum = $("#guest_num").val();
	if(userNum == rndNum){
		 $("#guest_email").prop("disabled",'disabled');
		 alert("인증이 완료되었습니다.");
		 checkMail = true;
	}else{
		alert("인증번호가 일치 하지않습니다."+rndNum);
		 checkMail = false;
		 return;
	}
}

</script>
</head>
<body>
	<%@include file="../../sangjin/home/loginbar.jsp"%>
	<div id="seat_info">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>
					<label class="label label-success">인원 선택</label>
				</h2>
				<div class="toolbar" role="toolbar">
					<c:forEach var="i" begin="1" end="10">
						<div id="${i}" class="btn btn-default btn-group" role="group"
							aria-label="${i}" onclick="choose_people('${i}')">${i}</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-6">
				<h2>
					<label class="label label-success">영화 정보</label>
				</h2>
				<table class="table table-default">
					<tr>
						<th>영화 제목</th>
						<td colspan="3"><label id="sm_age"></label><b id="sm_title"
							style="margin-left: 20px;"></b></td>
					</tr>
					<tr>
						<th>상영일시</th>
						<td><b id="sm_date"></b></td>
						<th>상영관</th>
						<td><b id="sm_tname"></b></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<hr>
	<div style="margin-left: 12%;">
		<h1 style="margin-left: 35%">
			<label class="label label-success">좌석 선택</label>
		</h1>
		<%
			char row_en = 'A';
			pageContext.setAttribute("row_en", String.valueOf(row_en).toLowerCase());
		%>

		<div style="height: auto; text-align: center; padding-top: 10px;"
			id="theater_drawing">
			<table style="width: auto; margin-left: 20%" id="seat_drawing">
				<tr>
					<th colspan="${theaterSitDTO.seat_col +2}" style="text-align: center;">
						| SCREEN |</th>
						<th width="200px">
						<div style="margin-left: 50px">
							<span style="border:1px solid black;height:10px; width:10px; margin:0px; background-color: white;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<b>예매가능</b>
						</div>
						<div style="margin-left: 50px">
							<span style="border:1px solid black;height:10px; width:10px; margin:0px; background-color: #CCCCCC;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<b>예매 완료</b>
						</div>
						<div style="margin-left: 50px">
							<span style="border:1px solid black;height:10px; width:10px; margin:0px; background-color: #6699FF;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<b>선택 좌석</b>
						</div>
					</th>
				</tr>
				<tr>
					<th colspan="11">&nbsp;</th>
				</tr>
				<c:forEach var="rows" begin="1" end="${theaterSitDTO.seat_row}">
					<tr>
						<td style="width: 50px; height: 50px; padding: 0px">
							<div
								style="margin-right: 10px; background-color: #CCCCCC; width: 90%; border-radius: 5px;">
								<b style="color: white;"><%=row_en%></b>
							</div>
						</td>
						<c:forEach var="cols" begin="1" end="${theaterSitDTO.seat_col}">
							<c:set var="emptyResult" value="false" />
							<c:set value="${pageScope.row_en}${cols}" var="sit_empty" />
							<c:forEach var="theaterSit" items="${theater_sit_empty}">
								<c:if
									test="${theaterSit.seat_empty==sit_empty && idx == theaterSit.idx}">
									<c:set var="emptyResult" value="true" />
									<td style="width: 50px; height: 50px;" id="col_num"><span
										id="seat${pageScope.row_en}${cols}"></span></td>
								</c:if>
							</c:forEach>
							<c:if test="${emptyResult==false}">
								<td style="width: 50px; height: 50px" id="td${pageScope.row_en}${cols}" onclick="selectSeat('${pageScope.row_en}${cols}')">
									<span class="btn btn-default" role="button" style="width: 100%;" id="seat${pageScope.row_en}${cols}"> ${cols} </span></td>
								<c:forEach var="out" items="${list }">
									<c:if test="${out.seat_out ==  sit_empty }">
									  <script>
									  $("#td${pageScope.row_en}${cols}").attr("onclick","");
									  $("#seat${pageScope.row_en}${cols}").attr("disabled","disabled");
									  $("#seat${pageScope.row_en}${cols}").css("background-color","gray");
									  </script>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</tr>
					<%
						row_en++;
							pageContext.setAttribute("row_en", String.valueOf(row_en).toLowerCase());
					%>
				</c:forEach>
			</table>
		</div>
	</div>
	<hr>
	</div>
	<div id="loading" style="width: 100%; height: 250px; display: none; text-align: center;" >
	<div class="loader" style="margin-left: 49%; margin-top:17%"></div>
	<br><b>&nbsp;&nbsp;&nbsp;결제가 진행중입니다. 잠시만 기다려주세요</b>
	</div>
	<div class="container" style="width: 100%; height: 150px; background-color:gray">
		<div class="row">
		<div class="col-md-2" id="btn_prevPage" style="margin-left:100px; margin-top:60px;">
				<a class="btn btn-default btn-lg" role="button" href="javascript:prev_page()">
				<span class="glyphicon glyphicon-chevron-left">&nbsp;</span>영화선택</a>
			</div>
			<div class="col-md-3"id="result_m">
				<div class="col-md-6" id="movie_poster" style="height: 150px;width:150px; padding:0px;" >
				<img src="" id="m_poster" style="height: 150px; padding: 0px; display: none;">
				</div>
				<div class="col-md-4" id="movie_title" style="height: 150px;width:150px; color:white" align="center">
				<p id="m_age" style="margin-top: 30px;"></p>
				<b id="m_title" style="height: 50%"></b>
				</div>
			</div>
			<div class="col-md-1.7" id="result_d" >
			<h2 id="d_select"align="center" style="margin-top:70px; display: block"><label class="label label-default">시간선택</label></h2>
			<div class="col-md-6" id="select_screen" style="height: 150px;width:150px; color:white; display: none; " align="center">
				<p id="d_date" style="margin-top: 30px; color:white; font-size: 13px; font-weight:bold;"></p>
				<b id="d_tname" style="height: 50%;color: white; font-size: 13px;"></b>
				</div>
			</div>
			<div class="col-md-3" id="result_seat">
				<div class="col-md-6" id="s_seat"
					style="margin-top:60px; height: 90px; width: 150px; color: white; display: block;"
					align="center">
					<div>인원 : &nbsp;<b id="s_people">1</b>명</div>
					<div>좌석 :<b id="s_seatNum"></b></div>
				</div>
				<div class="col-md-6" id="s_money"
					style="margin-top:60px; height: 90px; width: 150px; color: white; display: block;"
					align="center">
					<div>가격 :<b id="s_price">0</b>원</div>
					<div>총금액 : <b id="s_total">-</b>원</div>
				</div>
			</div>
			<div class="col-md-2" id="btn_reservation" style="display:none; margin-top:60px;">
				<a class="btn btn-danger btn-lg" role="button" href="javascript:reservation()">
				<span class="glyphicon glyphicon-log-in">&nbsp;</span>예매하기</a>
			</div>
		</div>
	</div>
	
</body>
</html>