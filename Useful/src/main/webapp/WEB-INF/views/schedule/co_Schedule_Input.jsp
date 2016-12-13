<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 등록</title>
 <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 'Nanum Gothic', serif;}

#cal {width: 250px; height: 250px; opacity: 1;}
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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>


$(function(){
	document.getElementById('txtdate1').value=opener.document.getElementById('ymd').value;
})

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
	calendar += '				<tr bgcolor="#fff">';
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
		                            calendar += '			<tr bgcolor="#fff">';
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


var txt;

function openCal(ch){
	 txt=ch;
	  document.getElementById("cal").style.display = "block";
	  document.getElementById("cal").style.left = event.clientX+"px";
	  document.getElementById("cal").style.top = event.clientY+"px";
	  
	  cal('cal');   	  
}  


function closeCal(y,m,d){
	//alert(y+"년 "+m+"월 "+d+"일");
	//alert(txt);
	if(m<10) m = '0'+m;
	if(d<10) d = '0'+d;
	document.getElementById("txtdate"+txt).value=y+"/"+m+"/"+d;
	document.getElementById("cal").style.display = "none";
}


/* 
   마우스가 클릭된 좌표
      alert(event.x + " : " + event.y); <-- body를 기준으로 한 좌표
      alert(event.clientX + " : " + event.clientY); // 기준점에 따른 좌표
      alert(event.screenX + " : " + event.screenY); // 브라우져 화면 전체 기준      
      */

      function create(){
    	  
          
    			var empno=$('[name=empno]').val();
    			var title=$('[name=title]').val();
    			var begin=$('[name=begin]').val();
    			var end=$('[name=end]').val();
    			
    			
    			var begin2 =begin.split('/');
   			    var end2 = end.split('/');
   			    var start = new Date(Number(begin2[0]), Number(begin2[1])-1, Number(begin2[2]));
			    var stop= new Date(Number(end2[0]), Number(end2[1])-1, Number(end2[2]));
   			    
    			var begintime=$('[name=begintime]').val();
    			var content=$('[name=content]').val();
    			
    			if(title=='')alert("제목을 입력하세요");
    			else if(begin=='')alert("시작날짜를 입력하세요");
    			else if(end=='')alert("마감날짜를 입력하세요");
    			else if(begintime=='')alert("시간을 선택해 주세요");
    			else if(start.getTime() > stop.getTime())alert('날짜를 다시 지정해 주세요');
    			else{
    	
    		$.ajax({
    		 url:'/useful/schedule/insert',
    		 type:'post',
    		 data:{empno:empno,
    			   title:title,
    			   begin:begin,
    			   end:end,
    			   begintime:begintime,
    			   content:content
    			
    		 },
    		 success:function(){
    			 alert("등록되었습니다.")
    			 opener.reloadWin();
    			
    		 }    		 
    	 });
    	}//else
	  }
      
     

      
      function clean(){
    	  window.close();
      }

     
      
</script>
</head>

<body>
	<center>
	<h3>스케줄 입력</h3>
		<form id="insert_Form" action="/useful/schedule/insert" method="post">
			<table border="1"
				style="border-collapse: collapse; line-height: 30px;" width="400px">
		
				<tr>
					<td bgcolor="#dae6f4"  align="center" width="150px">작성자</td>
					<td align="center">${LoginUser.ename }
					<input type="hidden" name="empno" value="${LoginUser.empno }">
					</td>
				</tr>
			<!--     <tr>
			        <td bgcolor="#dae6f4"  align="center" width="150px">일정구분</td>
			        <td align="center">
			         <select>
			         <option>회사</option>
			         <option>부서</option>
			         </select>
			        </td>
			    </tr> -->
				<tr>
					<td bgcolor="#dae6f4" align="center" width="150px">제목</td>
					<td width="350px" style="padding: 0;">
					<input type="text" name="title" style="width:350px; height: 30px; margin: 0; border: 0;"></td>

				</tr>
				<tr>
				<td bgcolor="#dae6f4" align="center">시작날짜</td>
				<td align="center"> <input type="text" name="begin" readonly="readonly" id="txtdate1" value=""> <i class="fa fa-calendar-o" style="cursor:pointer;" onclick="openCal(1)"></i></td></tr>
				<tr>
				<td  bgcolor="#dae6f4"  align="center">마감날짜</td>
				<td align="center"> <input type="text" name="end" readonly="readonly" id="txtdate2" value=""> <i class="fa fa-calendar-o" style="cursor:pointer;" onclick="openCal(2)"></i></td></tr>
				<tr>
				<td bgcolor="#dae6f4"  align="center">시간</td>
				<td align="center">
				    <select name="begintime" >
				    <option value="0">시작</option>
				  <% for(int i=6;i<23; i++){%>
				    <option value="<%=i%>"><%=i%></option>
				  <% } %>
                    </select> 시 <%-- ~
                    <select name="serchType">
				    <option value="끝">끝</option>
				    <% for(int i=9;i<23; i++){%>
				    <option value="<%=i%>"><%=i%></option>
				  <% } %>
                    </select> 시 --%>
				 </td></tr>

				<tr>
					<td colspan="2" style="padding:0; width:500px;">
					<textarea name="content" style="font-size:15px; width:500px; margin: 0; height:200px; border:0;"></textarea></td>
				</tr>
			</table>
			<br>
			<input type="button"  class="btn btn-info"  value="등록"  onClick="create()"> 
			<input type="button"  class="btn btn-danger" value="닫기" onClick="clean()" >
		</form>
		
		            
	</center>
	 <div id="cal" style="display: none; position: absolute;"></div>
  
</body>
</html>