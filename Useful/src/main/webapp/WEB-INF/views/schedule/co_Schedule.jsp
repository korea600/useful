<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 'Nanum Gothic', serif;}

/* #cal {width: 250px; height: 250px;} */
#header {background-color:#aadef7; height: 50px; line-height: 50px; text-align: center; font-size: 18px; font-weight: bold}
#cal .button {color: #000; text-decoration: none;}

#cal table {width: 1260px;}
.weektr {width:180px; height:80px; text-align:center;}



</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">

var currentYear;
var currentMonth;
var dateNum;



function cal(id, newdate) {
	var cal = document.getElementById(id);
	
	var date=null;
	if(newdate==undefined)
		date = new Date();
	else
		date = newdate;

	
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
	var currentDay = date.getDay();	// 0=일요일 1=월 .... 6=토
	var dateString = new Array('일', '월', '화', '수', '목', '금', '토');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
		lastDate[1] = 29;
	//각 달의 마지막 일을 계산 =  윤년의 경우 년도가 4의 배수 AND 100의 배수가 아닐때 OR 400의 배수일 때 2월달이 29일
	
	var currentLastDate = lastDate[currentMonth-1];
	
	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );

	var calendar = '';
	
	calendar += '		<form name="dailyForm" action="" method="get">';	
	calendar += '		<table border="1" cellspacing="0" cellpadding="0">';
	calendar += '              <tr height="80px">';
 	calendar += '                 <td colspan="7" align="center">';
	calendar += '                     <select name="year" onchange="changeCal(this)">';
	calendar += '                     </select>년 ';
	calendar += '                     <select name="month" onchange="changeCal(this)">';
	calendar += '                     </select>월';
	calendar += '                 </td>'; 
	calendar += '              </tr>';
	calendar += '				<tr bgcolor="#8df1ca">';
	calendar += '				  <th class="weektr" scope="row">일</th>';
	calendar += '				  <th class="weektr" scope="row">월</th>';
	calendar += '				  <th class="weektr" scope="row">화</th>';
	calendar += '				  <th class="weektr" scope="row">수</th>';
	calendar += '				  <th class="weektr" scope="row">목</th>';
	calendar += '				  <th class="weektr" scope="row">금</th>';
	calendar += '				  <th class="weektr" scope="row">토</th>';
	calendar += '				</tr>';

	
    dateNum = 1 - currentDay;
	
	for(var i = 0; i < week; i++) {//7로 나눈 주
		                            calendar += '			<tr>';
		for(var j = 0; j < 7; j++, dateNum++) {
			if( dateNum < 1 || dateNum > currentLastDate ) {
				calendar += '				<td class="'+dateString[j] +'"></td>';
				continue;
			}
			
			
			
			calendar += '				<td class="' +dateString[j]+'" style="width:180px; height:180px; position:relative;">'
			                            +'<div id="a'+currentYear+currentMonth+dateNum+'" onClick="clickCal('+currentYear+','+currentMonth+','+dateNum+')" style="cursor:pointer; font-size:20px; width:180px; height:25px; position:absolute; top:0;">' + dateNum + '</div>';
			                            $('#b'+currentYear+currentMonth+dateNum).empty();    
			              var dateno= dateNum;
			              var monthno = currentMonth;
			                            if( dateno<10)
			                				 dateno = '0'+dateNum
				                            if( monthno<10)
				                            	monthno = '0' + currentMonth;
			calendar += '            	 <div id="b'+currentYear+monthno+dateno+'" style="width:180px; height:155px; position:relative; top:20px; "></div></td>';
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
     //alert('cu'+currentMonth);--12
     var nowMonth = currentMonth;
     for(i=0; i<12; i++){
    	
    	 if(i<9)	
         fmonth[i] = new Option('0'+(i+1), i+1);
    	 else
         fmonth[i] = new Option(i+1, i+1);
    	 
         if(fmonth[i].value == currentMonth){
        	 fmonth[i].selected = true;
         }//if
     }//for
   
     dt=new Date();
    $('#a'+
     dt.getFullYear()+
     (dt.getMonth()+1)+
     dt.getDate()).parent().css('background-color','yellow');
   
     //var tmd = 'a'+currentYear+currentMonth+dateNum;
    //alert('시작='+tmd);
   
  
calInsert();
    

}//cal




function changeCal(obj){
	
 var year =	$('select[name=year]').val();
 var month = $('select[name=month]').val();
 	
 var newDate = new Date(year,month-1);
    
 cal('cal', newDate);//id,와 select-value값 전달


}//changeCal: select값이 바뀌면


 
 //등록폼 띄우기



 function detail(sr){
	
	alert(sr);
	window.open('detail?serial='+sr,'detail','toolbar=no,location=no,status=no'
			+'menubar=no,scrollbars=no,resizable=0,width=400,height=500,top=100,left=800')
	
}//자세한 내용
 
 function reloadWin(){
	 location.reload();
	 insertWin.close();
 }
 

var insertWin;//자식창
 function insert(){
 	
  insertWin=window.open('co_Schedule_Input','insert','toolbar=no,location=no,status=no'
 			+'menubar=no,scrollbars=no,resizable=0,width=400,height=500,top=100,left=800');
  
 }
 
 //날짜를 눌렀을때
 function clickCal(y,m,d){
		if(m<10) m = '0'+m;
		if(d<10) d = '0'+d;
		// alert(event.clientX + " : " + event.clientY);
		var dt=new Date();
		
        
		
		var str =y+"/"+m+"/"+d;
		document.getElementById('ymd').value=str;
		alert(str);
		insert();
			
	}
 
//test1
 function calInsert(){
/*   var testArray = [];
	 $("input[name='voList']").each(function(i) {
	        testArray.push($(this).val());
	 });
	   */
	       //var arr=new Array();
	      var ar;
	         
	         $.ajax({    		
	 	
	 				 /* ※ JSON배열 요청  */
	 	     		 url:'/useful/scheduleList/all',
	 	     		dataType:'JSON',//생략 불가
	 	     		method:'GET',
	 	     		//contentType:'application/json; charset=UTF-8',
	 	     		 success:function(data){//result:배열
	 	     			 
	 	     			$().empty();
	 	     			 
	 	     		
	 	     		
	 	     		$.each(data, function(idx, key){
	 	     				//key.serial, 
	                        //key.begin, key.end, 
	                       var begin =(key.begin).split('/');
	 	     				    			   
	                      $('#b'+begin[0]+begin[1]+begin[2]).append(
	                    		 
	                    		   '<div onclick="detail('+key.serial+')" style="height:20px; top:0;' 
	                    		   +'cursor:pointer; color:#fff; background-color:blue;">'
	                    		   +key.begintime+'시 '
	                    		   +key.title+'</div><div style=" width:180px; height:5px;"></div>'); 
	 	     			   //alert(begin);
	 	     			 }); 
	 	     		      
	 	     		 }, 

	 		         error:function(xhr, status, error){
	 		        	     alert("당신에러"+error);
	 		         }

	 		  });//ajax

	 		        
	       
	 
	 } 
	 
	 /*
	 다차원배열
	 

	  
	 var maArr = new Array();

	 for ( var i = 0; i < 10; i ++ ){
	 myArr[ i ] = new Array();

	 myArr[ i ].push( '첫번째' );
	 myArr[ i ].push( '두번째' );
	 ...
	 }
	  
	 */
	 


	
 

 
 $(document).ready(
			function() {

 
 $('#searchBtn').on("click", function(e){
		self.location = "co_Schedule"
			+ '${pageMaker.makeQuery(1)}'
			+ "&searchType="+ $("select[name=searchType] option:selected").val()
			+ "&keyword=" + $('#keywordInput').val();

    });
 
 $('#allDelete').on("click", function(e) {
	   var checkboxValues = [];
	  
	    $("input[name='checkBno']:checked").each(function(i){
	       checkboxValues.push($(this).val());//checkBoxValues에 배열로 넣기
	    });
       
	    alert('c2: '+checkboxValues)
	      if(!confirm('정말 삭제하시겠습니까?')){
	    	  return; //삭제 취소
	      }else{
	    		//$('#co_list').attr("action", "");
	    		//$('#co_list').submit();
	    		
	    		alert('ch')
	    	  $.ajax({
	    			 url:'/useful/schedule/removeCheck',
	    			 type:'post',
	    			 data: {
	    				 'checkboxValues':checkboxValues
	    			 },
	    			
	    			 success:function(){
                         
	    				 alert("삭제 성공");
	    				 location.reload();
	    				 
	    			 }    		 
	    		 });//ajax
	         }//else 
	 
	       });//click
	});//ready
 

  

      
      
</script>

</head>
<body>
<center>
   <div id="cal"></div>
   <br><br>
      <input type="hidden" id="ymd">
   <form action="" method="get" name="co_list" id="co_list">
   <table width="800px" border="1" cellspacing="0">
   <tr><td colspan="7" align="right">
       <select name="searchType">
   <option value="no">--</option>
   <option value="s">글번호</option>
   <option value="t">제목</option>
   <option value="b">시작날짜</option>
   <option value="e">마감날짜</option>
       </select>
    <input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
    <input type="button" id="searchBtn" value="검색">
   
   <input type="button" value="등록" onClick="insert()">
      <input type="button" value="삭제" id="allDelete">
   </td></tr>
   <tr>
    <th>선택</th>
    <th>글번호</th>
    <th>제목</th>
    <th>시작날짜</th>
    <th>종료날짜</th>
    <th>작성자</th>
    <th>작성일</th>    
   </tr>
   
   <c:forEach items="${list}" var="ScheduleVO" varStatus="status">
   <tr class="cals">
   
   
   <td><input type="checkbox"  name="checkBno" value="${ScheduleVO.serial }"></td>
   <td>${ScheduleVO.serial } </td>
   <td><span onClick="detail('${ScheduleVO.serial }')" style="cursor:pointer; text-decoration: underline;">${ScheduleVO.title }</span></td> 
       
   <td>${ScheduleVO.begin }</td>
   <td>${ScheduleVO.end }</td>
   <td>${ScheduleVO.ename }</td>
   <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm"
										value="${ScheduleVO.regdate}" /></td>

   </tr>
     
   </c:forEach>
 

   <tr><td colspan="7" align="center">
   <ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="co_Schedule?${pageMaker.startPage - 1}">◀</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li	<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="co_Schedule?page=${idx}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="co_Schedule?${pageMaker.endPage +1}">▶</a></li>
							</c:if>

						</ul>
    </td>
    </tr>
   </table>
   

   	<!-- The time line -->
   	
   	<input type="button" value="클릭" onclick="test1()">
   </form>
   </center>

   
   

	<script>
		window.onload = function () {
			cal('cal');

			
		};
		
		
		
		
	
	</script>

</body>
</html>