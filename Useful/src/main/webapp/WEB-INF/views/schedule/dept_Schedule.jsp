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

/* #cal {width: 250px; height: 250px;} */
#header {background-color:#aadef7; height: 50px; line-height: 50px; text-align: center; font-size: 18px; font-weight: bold}
#cal .button {color: #000; text-decoration: none;}

#cal table {width: 1100px; height: 800px;}

#cal .sun {text-align: center; color: red;}
#cal .mon {text-align: center;}
#cal .tue {text-align: center;}
#cal .wed {text-align: center;}
#cal .thu {text-align: center;}
#cal .fri {text-align: center;}
#cal .sat {text-align: center; color: blue;}

</style>

<script>

var currentYear;
var currentMonth;

function cal(id, date) {
	var cal = document.getElementById(id);
	
	
	if( typeof( date ) !== 'undefined' ) {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}

	
	/* var dt;
	 
	   dt = new Date();
	   dt = dt.getFullYear() + "-" + (dt.getMonth() + 1) + "-" + dt.getDate();
	 
	   alert("오늘날짜 : " + dt + "<br>");
	 */
	

	
	

	//<get은 1970년 1월 1일 00:00 을 기준으로 set은 현재 로컬 시간을 기준으로>

	 currentYear = date.getFullYear();//년도YYYY
	 currentMonth = date.getMonth() + 1;	//연을 구함. 월은 0부터 시작+1, 2월 출력 (1월)+1//MM
	var currentDate = date.getDate();//오늘 일자//DD
	
	date.setDate(1);//이번달 1일 요일 출력
	var currentDay = date.getDay();	// 0=일요일 1=월 .... 6=토//오늘
	var dateString = new Array('일', '월', '화', '수', '목', '금', '토');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
		lastDate[1] = 29;
	//각 달의 마지막 일을 계산 =  윤년의 경우 년도가 4의 배수 AND 100의 배수가 아닐때 OR 400의 배수일 때 2월달이 29일
	
	var currentLastDate = lastDate[currentMonth-1];
	
	
	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
	//총 몇 주인지 구함.
	
/* 	if(currentMonth != 1){//1월이 아니라면 그대로 ◀
		var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate; 
	}else{
		var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
	}//만약 이번달이 1월이라면 1년 전 12월로 출력 ◀
	
	if(currentMonth != 12){ //12월이 아니라면 ▶
		var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
	}else{
		var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
	}//만약 이번달이 12월이라면 1년 후 1월로 출력 ▶
	
	 */
	 
	 
	if( currentMonth < 10 ){
		var currentMonth = '0' + currentMonth;
	}//두자리수 아래는 0붙이기 
	
	
	var calendar = '';
	
	calendar += '		<form name="dailyForm" action="" method="get">';	
	calendar += '		<table border="1" cellspacing="0" cellpadding="0">';
	calendar += '              <tr>';
 	calendar += '                 <td colspan="7" align="center">';
	calendar += '                     <select name="year" onchange="changeCal(this)">';
	calendar += '                     </select>년 ';
	calendar += '                     <select name="month" onchange="changeCal(this)">';
	calendar += '                     </select>월';
	calendar += '                 </td>'; 
	calendar += '              </tr>';
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
			calendar += '				<td class="' +dateString[j]+'>'
			                            +'<span onClick="closeCal('+currentYear+','+currentMonth+','+dateNum+')" style="cursor:pointer;">' + dateNum + '</span></td>';
		}
		calendar += '			</tr>';
	}
	
	calendar += '		</table>';
	calendar += '		</form>';
	cal.innerHTML = calendar;
	
	
	
	var f = document.dailyForm;
	var fyear = f.year;//년도 select
	var startYear = currentYear - 10;
	//오늘거가 선택되어있게 옵션 설정
	for(i=0; i<20; i++){//오늘년도를 중심으로-10, 10년으로 보이게
       fyear[i] = new Option(startYear, startYear)//new Option("value", "보일 내용")
        if(fyear[i].value == currentYear){
        	    fyear[i].selected = true;//현재 부분이 선택된 상태
               }//if
               startYear++;
	}//for
        		
     var fmonth = f.month;//월 select
     for(i=0; i<12; i++){
         fmonth[i] = new Option(i+1, i+1);
         if(fmonth[i].value == currentMonth){
        	 fmonth[i].selected = true;
         }//if
     }//for
        	 

}//cal




function changeCal(obj){
    
    var changeNum=obj.value;
    var changeName=obj.name;
     alert("value="+changeNum+"name="+changeName);
    if(changeName=='month'){
    	currentMonth=changeNum;
    }else{
    	currentYear=changeNum;
    }

}

/* var txtdate;

function closeCal(y,m,d){
	//alert(y+"년 "+m+"월 "+d+"일");
	document.getElementById("txtdate").value=y+"/"+m+"/"+d;
	document.getElementById("cal").style.display = "none";
}
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