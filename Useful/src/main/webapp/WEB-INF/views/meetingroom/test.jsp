<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
var day = new Date(); 
day.setDate(day.getDate()-day.getDay()); 
var currentDay = date.getDay();	// 0=일요일 1=월 .... 6=토
var dateString = new Array('일', '월', '화', '수', '목', '금', '토');

function week_calandar(week) { 
	
day.setDate(day.getDate()+week*7); 

var title = day.getFullYear() + "/" + (day.getMonth()+1); 

var data = '';
var cal ='';

cal+='          <table border="1" cellspacing="0" cellpadding="0">';
cal+='             <tr height="80px">';
cal+='                <td colspan="8" align="center">'+title+'</td></tr>';
cal+='              <tr>';
cal+='              <th align="center" width="80px">시간</th>';
      for(var i=0 ; i<7 ; i++) { 
	        if(day.getDate() == 1){ 
		          title += " ~ " + day.getFullYear() + "/" + (day.getMonth()+1); 	
	                }//if--title
cal+=              '<th align="center" width="80px" id="a'+day.getFullYear()+(day.getMonth()+1)+day.getDate()+'">'+ day.getDate() + '</th>';
               day.setDate(day.getDate()+1); 
}//for

day.setDate(day.getDate()-7); 
      for(var i=9; i<22; i++){
cal+='             <tr>';
cal+='              <td>'+i+' - '+(i+1)+'</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>';
cal+='             </tr>';
}
cal+='          </table>';
      
      

document.getElementById("calandar").innerHTML = cal;

dt=new Date();//오늘날짜

$('#a'+
dt.getFullYear()+
(dt.getMonth()+1)+
dt.getDate()).css('background-color','yellow');


} //calendar




function set_day() { 
day = new Date(); 
day.setDate(day.getDate()-day.getDay()); 

week_calandar(0); 


} 


</script>
</head>
<body>
<center>
<input type="button" onclick="week_calandar(-1)" value="◀">
<input type="button" value="today" onclick="set_day()" /> 
<input type="button" value="▶" onclick="week_calandar(1)" /> 



<p id="calandar"></p> 


<p><input type="button" onclick="reservation()" value="예약"></p>
</center>


	<script>
		window.onload = function () {
			week_calandar(0);
			

		};

	</script>



</body>
</html>