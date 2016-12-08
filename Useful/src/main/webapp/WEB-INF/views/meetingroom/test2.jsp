<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
var day = new Date(); 
day.setDate(day.getDate()-day.getDay()); 

function week_calandar(week) { 
	
day.setDate(day.getDate()+week*7); 

var title = day.getFullYear() + "/" + (day.getMonth()+1); 

var data = ""


for(var i=0 ; i<7 ; i++) { 
data += day.getDate() + "|"; 

if(day.getDate() == 1) 
title += " ~ " + day.getFullYear() + "/" + (day.getMonth()+1); 
day.setDate(day.getDate()+1); 
}


day.setDate(day.getDate()-7); 

//calendar
document.getElementById("calandar").innerHTML = title + "<br />" + data; 
} 


function set_day() { 
day = new Date(); 
day.setDate(day.getDate()-day.getDay()); 

week_calandar(0); 
} 
/* 
var calendar = '';


calendar += '		<table border="1" cellspacing="0" cellpadding="0">';
calendar += '              <tr height="80px">';
calendar += '                <tr><td>'+title'</td><tr>'; 
calendar += '				<tr bgcolor="#8df1ca">';
calendar += '				  <th class="weektr" scope="row">일</th>';
calendar += '				  <th class="weektr" scope="row">월</th>';
calendar += '				</tr>';
 */



</script>
</head>
<body>
<input type="button" onclick="week_calandar(-1)" value="◀">
<input type="button" value="today" onclick="set_day()" /> 
<input type="button" value="▶" onclick="week_calandar(1)" /> 



<p id="calandar"></p> 


</body>
</html>