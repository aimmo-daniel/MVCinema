<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${path}/sungwon/etc/css/myCalendar.css?v=5" rel="stylesheet">
<script src="${path}/sungwon/etc/js/myCalendar.js?v=5"></script>
<script>
	var today
	var date
	var session
	
	
	//페이지가 로딩되면
	window.onload = function() {
		myCalendar('myCalendar');
	}
	//선택한 날짜 구하기
	function selectDay(y, m, d) {
		if (m < 10) {
			m = '0' + m
		}
		if (d < 10) {
			d = '0' + d
		}
		date = y + "-" + m + "-" + d;
		
		alert(date);
	}
	//오늘 날짜 구하기
	function getToday(y, m, d) {
		if (m < 10) {
			m = '0' + m
		}
		if (d < 10) {
			d = '0' + d
		}
		today = y + "-" + m + "-" + d;
	}
</script>
	