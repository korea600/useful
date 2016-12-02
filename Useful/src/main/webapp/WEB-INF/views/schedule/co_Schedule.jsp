<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 'Nanum Gothic', serif;}

#cal {width: 250px; height: 250px;}
#header {background-color:#aadef7; height: 50px; line-height: 50px; text-align: center; font-size: 18px; font-weight: bold}
#cal .button {color: #000; text-decoration: none;}

#cal table {width: 250px; height: 200px;}

#cal .sun {text-align: center; color: red;}
#cal .mon {text-align: center;}
#cal .tue {text-align: center;}
#cal .wed {text-align: center;}
#cal .thu {text-align: center;}
#cal .fri {text-align: center;}
#cal .sat {text-align: center; color: blue;}

</style>

<script>

function cal(id, date) {
	var cal = document.getElementById(id);
	
	
	if( typeof( date ) !== 'undefined' ) {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}
	
	
	//<get은 1970년 1월 1일 00:00 을 기준으로 set은 현재 로컬 시간을 기준으로>

	var currentYear = date.getFullYear();//년도
	var currentMonth = date.getMonth() + 1;	//연을 구함. 월은 0부터 시작+1, 2월 출력 (1월)+1
	var currentDate = date.getDate();//오늘 일자
	
	date.setDate(1);//이번달 1일 요일 출력
	
	var currentDay = date.getDay();	// 0=일요일 1=월 .... 6=토
	var dateString = new Array('일', '월', '화', '수', '목', '금', '토');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
		lastDate[1] = 29;
	//각 달의 마지막 일을 계산 =  윤년의 경우 년도가 4의 배수 AND 100의 배수가 아닐때 OR 400의 배수일 때 2월달이 29일
	
	var currentLastDate = lastDate[currentMonth-1];
	
	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
	//총 몇 주인지 구함.
	 
	if(currentMonth != 1){//1월이 아니라면 그대로 ◀
		var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate; 
	
	}else{
		var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
		
	
	}//만약 이번달이 1월이라면 1년 전 12월로 출력 ◀
	
	if(currentMonth != 12){ //12월이 아니라면 ▶
		var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
	}else{
		var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
	}//만약 이번달이 12월이라면 1년 후 1월로 출력 ▶

	
	if( currentMonth < 10 ){
		var currentMonth = '0' + currentMonth;
	}//두자리수 아래는 0붙이기 
	
	
	var calendar = '';
	
	
	calendar += '		<table border="1" cellspacing="0" cellpadding="0" height="250px; width="250px">';
	calendar += '			<tr><td id="header" colspan="7"><span><a href="#" class="button left" onclick="cal(\'' +  id + '\', \'' + prevDate + '\')">◀</a></span>';
	calendar += '			<span id="date">' + currentYear + '년 ' + currentMonth + '월</span>';
	calendar += '			<span><a href="#" class="button right" onclick="cal(\'' + id + '\', \'' + nextDate + '\')">▶</a></span></td></tr>';
	calendar += '				<tr>';
	calendar += '				  <th class="sun" scope="row">일</th>';
	calendar += '				  <th class="mon" scope="row">월</th>';
	calendar += '				  <th class="tue" scope="row">화</th>';
	calendar += '				  <th class="wed" scope="row">수</th>';
	calendar += '				  <th class="thu" scope="row">목</th>';
	calendar += '				  <th class="fri" scope="row">금</th>';
	calendar += '				  <th class="sat" scope="row">토</th>';
	calendar += '				</tr>';

	
	var dateNum = 1 - currentDay;
	
	for(var i = 0; i < week; i++) {//7로 나눈 주
		                            calendar += '			<tr>';
		for(var j = 0; j < 7; j++, dateNum++) {
			if( dateNum < 1 || dateNum > currentLastDate ) {
				calendar += '				<td class="'+dateString[j] +'"></td>';
				continue;
			}
			calendar += '				<td class="' +dateString[j]+'"align="center">'
			                            +'<span onClick="closeCal('+currentYear+','+currentMonth+','+dateNum+')" style="cursor:pointer;">' + dateNum + '</span></td>';
		}
		calendar += '			</tr>';
	}
	
	calendar += '		</table>';
	
	cal.innerHTML = calendar;

}

var txtdate;
var cal_x;
var cal_y;


function closeCal(y,m,d){
	alert(y+"년 "+m+"월 "+d+"일");

}


/* 
   마우스가 클릭된 좌표
      alert(event.x + " : " + event.y); <-- body를 기준으로 한 좌표
      alert(event.clientX + " : " + event.clientY); // 기준점에 따른 좌표
      alert(event.screenX + " : " + event.screenY); // 브라우져 화면 전체 기준      
      */


      
      
      
      
</script>

</head>
<body>
   <div id="cal"></div>
	<script>
		window.onload = function () {
			cal('cal');
		};
	</script>

</body>
</html>