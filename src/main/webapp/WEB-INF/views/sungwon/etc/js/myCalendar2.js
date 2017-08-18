function myCalendar2(id, date) {
	
	var myCalendar2 = document.getElementById(id);
	
	var c_date= date;
	if (typeof (date) !== 'undefined') {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}
	
	/*선택한 날짜 구하기*/
	// 년도를 구함
	var currentYear = date.getFullYear();
	// 월을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력
	var currentMonth = date.getMonth() + 1;
	// 오늘 일자.
	var currentDate = date.getDate();
	
	/*오늘 날짜 구하기*/
	// 오늘 날짜  yyyy-MM-dd 
	var tmp_today = new Date();
	//이번달이 10월보다 작으면 앞에 0을 더함
	if(tmp_today.getMonth()<10){
		tmp_month = ('0'+(tmp_today.getMonth()+1))
	}else{
		tmp_month = (tmp_today.getMonth()+1);
	}
	//오늘 날짜가 10일보다 작으면 앞에 0을더함
	if(tmp_today.getDate()<10){
		tmp_day = ('0'+tmp_today.getDate())  
	}else{
		tmp_day = tmp_today.getDate();
	}
	var today = tmp_today.getFullYear()+'-'+tmp_month+'-'+tmp_day;
	
	
	// 이번달 1일의 요일을 출력. 0은 일요일 6은 토요일
	date.setDate(1);
	var currentDay = date.getDay();
	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	// 각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일
	// 임.
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if ((currentYear % 4 === 0 && currentYear % 100 !== 0)
			|| currentYear % 400 === 0)
		lastDate[1] = 29;
	// 월의 마지막 날짜를 구함
	var currentLastDate = lastDate[currentMonth - 1];
	// 총 몇 주인지 구함.
	var week = Math.ceil((currentDay + currentLastDate) / 7);
	// 1월이 아닐경우
	if (currentMonth != 1) {
		var prevDate = currentYear + '-' + (currentMonth - 1) + '-'
				+ currentDate;
	} else {
		// 만약 이번달이 1월이라면 1년 전 12월로 출력.
		var prevDate = (currentYear - 1) + '-' + 12 + '-' + currentDate;
	}

	if (currentMonth != 12) {
		var nextDate = currentYear + '-' + (currentMonth + 1) + '-'
				+ currentDate;
	} else {
		// 만약 이번달이 12월이라면 1년 후 1월로 출력.
		var nextDate = (currentYear + 1) + '-' + 1 + '-' + currentDate;
	}

	if (currentMonth < 10){
		// 10월 이하라면 앞에 0을 붙여준다.
		var currentMonth = '0' + currentMonth;
	}
	var calendar2 = '';
	calendar2 += '<table>';
	calendar2 +=		'<tr>';
	calendar2 +=			'<td style="padding-top:20px; padding-bottom:0px; text-align:center; ">';
	calendar2 += '			<span><input type="button" class="btn btn-warning" style="font-size: 12px;" value="◀" onclick="myCalendar2(\''
			+ id + '\', \'' + prevDate + '\')"></span></td>';
	calendar2 += '<td style="text-align:center;"><h1><span class="label label-warning" style="align:center;"id="date">'
			+ currentYear + '년 ' + currentMonth + '월</span></h1></td>';
	calendar2 += '<td style="padding-top:20px; padding-bottom:0px; text-align:center;"><span><input type="button" class="btn btn-warning" style="font-size: 12px;" value="▶" onclick="myCalendar2(\''
			+ id + '\', \'' + nextDate + '\')"></a></span></td>';
	calendar2 += '		</tr></table>';
	calendar2 += '		<table id="mvc_caleandar" class="table table-primary" style="height:80%">';
	calendar2 += '			<thead>';
	calendar2 += '				<tr>';
	calendar2 += '				  <th style="text-align:center;" class="sun" scope="row"><h3><label class="label label-danger">일</label></h3></th>';
	calendar2 += '				  <th style="text-align:center;" class="mon" scope="row"><h3><label class="label label-success">월</label></h3></th>';
	calendar2 += '				  <th style="text-align:center;" class="tue" scope="row"><h3><label class="label label-success">화</label></h3></th>';
	calendar2 += '				  <th style="text-align:center;" class="wed" scope="row"><h3><label class="label label-success">수</label></h3></th>';
	calendar2 += '				  <th style="text-align:center;" class="thu" scope="row"><h3><label class="label label-success">목</label></h3></th>';
	calendar2 += '				  <th style="text-align:center;" class="fri" scope="row"><h3><label class="label label-success">금</label></h3></th>';
	calendar2 += '				  <th style="text-align:center;" class="sat" scope="row"><h3><label class="label label-primary">토</label></h3></th>';
	calendar2 += '				</tr>';
	calendar2 += '			</thead>';
	calendar2 += '			<tbody id="cal_body">';

	var dateNum = 1 - currentDay;
	var count =0;
	for (var i = 0; i < week; i++) {
		calendar2 += '<tr>';
		for (var j = 0; j < 7; j++, dateNum++) {
			if (dateNum < 1 || dateNum > currentLastDate) {
				calendar2 += '<td class="' + dateString[j] + '"></td>';
				continue;
			}
			if (dateNum < 10) {
				var currentDay = '0' + dateNum;
			} else {
				currentDay = dateNum;
			}
			
			var tdname = currentYear + '-' + currentMonth + '-' + currentDay;
			
				if(tdname < today){ //오늘 보다 이전일은 예매x
					calendar2 += '<td  style="width:85px; height:67.2px;  padding:0px; text-align:center; background-color:gray"' 
						+ 'class="'+ dateString[j] + '">'
						+ '<p  style="font-weight:nomal; color: white;"  class="' + dateString[j] + '">'
						+ dateNum + '</p>';
					calendar2 += '</td>';
				}else{ //모든 조건 충족시 
					calendar2 += '<td id="'+tdname+'"style="width:85px; height:67.2px;  padding:0px; text-align:center;"' 
						+ 'class="'+ dateString[j] + '" onclick="javascript:selectDay('+ currentYear + ',' + currentMonth + ',' + currentDay
						+ ')">' + '<a href="#"' + 'class="' + dateString[j] + '">'
						+ dateNum + '</a>';
					calendar2 += '</td>';
				}
			}
			count++;
		}
		calendar2 += '</tr>';
	calendar2 += '</tbody>';
	calendar2 += '</table>';
	myCalendar2.innerHTML = calendar2;
}