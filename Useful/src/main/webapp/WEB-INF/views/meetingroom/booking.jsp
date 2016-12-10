<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
var flag =false;

cal+='          <table border="1" cellspacing="0" cellpadding="0">';
cal+='             <tr height="80px">';
cal+='                <td colspan="8" align="center" id="calTitle">'+title+'</td></tr>';
cal+='              <tr>';
cal+='              <th align="center" width="80px" scope="col">시간</th>';
      for(var i=0 ; i<7 ; i++) { 
	        if(day.getDate() == 1){ 
	        	  if(i!=0)flag=true;
		          title += " ~ " + day.getFullYear() + "/" + (day.getMonth()+1); 	
	                }//if--title
	                
	              /*   var monthno = day.getMonth()+1;
	                var dateno = day.getDate(); 
	                if(dateno<10)
       				 dateno = '0'+dateno; 
                       if( monthno<10)
                       	monthno = '0' + monthno; */
cal+=              '<th align="center" scope="col" width="80px" id="a'+day.getFullYear()+(day.getMonth()+1)+day.getDate()+'">'+ day.getDate() + '</th>';
               day.setDate(day.getDate()+1); 
}//for

day.setDate(day.getDate()-7); 
      for(var i=9; i<22; i++){
cal+='              <tr>';
cal+='              <td>'+i+' - '+(i+1)+'</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>';
cal+='             </tr>';
}
cal+='          </table>';
      
      

document.getElementById("calandar").innerHTML = cal;
if(flag){
	$('#calTitle').html(title);
	

}



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




var insertWin;
//등록창
 function input(){
 	
  insertWin=window.open('booking_Input','input','toolbar=no,location=no,status=no'
 			+'menubar=no,scrollbars=no,resizable=0,width=400,height=500');
  
 }
 
 
 //부모창 리로드
 function reloadWin(){
 	 location.reload();
 	 insertWin.close();
 }
 
 
  var bookingWin;
 function reloadWin2(){
 
 	bookingWin.close();
    location.href="/useful/meetingroom/myBooking";
 }
 
 function test(serial){

	   var tim= $('#a'+serial).val().split(',');
	   alert(tim[2]-tim[1]);	
	 
 }
 
 function reservation(roomno){
	 
	 bookingWin = window.open('booking_Input?roomno='+roomno,'input','toolbar=yes,location=no,status=no'
	 			+'menubar=no,scrollbars=no,resizable=0,width=400,height=500');
 } 
 

</script>
</head>
<body>
<center>
<p>
<input type="button" onclick="week_calandar(-1)" value="◀">
<input type="button" value="today" onclick="set_day()" /> 
<input type="button" value="▶" onclick="week_calandar(1)" /> 
</p>


<p id="calandar"></p> 

<p><input type="button" onclick="reservation(${integer})" value="예약"></p>


<table border="1" cellspacing="0"  style="width:100%;">
<tr>
 <td colspan="4">
    <select id="serchType">
    <option value="d">날짜</option>
    <option value="w">예약자</option>
    </select>
 
 </td>
</tr>
<tr>
<td colspan="4" align="center">예약된 리스트</td>
</tr>
<tr>
<th>회의실</th>
<th>날짜</th>
<th>예약시간</th>
<th>예약자</th>
</tr>



<c:forEach items="${list}" var="MeetingVO">
<tr>
<td align="center" >${MeetingVO.roomno}</td>
<td align="center">${MeetingVO.beginday}</td>
<td align="center">${MeetingVO.begin}~${MeetingVO.end}</td>
<td align="center">${MeetingVO.booker }</td>
</tr>

</c:forEach>



</table>



</center>


	<script>
		window.onload = function () {
			week_calandar(0);
			

		};

	</script>



</body>
</html>