<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 리스트</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
<style>
.backslash {
	background:url(http://cdn.zetawiki.com/png/backslash.png);
	background-size:100% 100%;
}

</style>

<script>



var day = new Date(); 
day.setDate(day.getDate()-day.getDay()); 





function week_calandar(week) { 
	
day.setDate(day.getDate()+week*7); 

var title = day.getFullYear() + "/" + (day.getMonth()+1); 

var data = '';
var cal ='';
var flag =false;

cal+='          <table border="1" cellspacing="0" style="border:1px solid #cccdd4;" align="center" cellpadding="0" width="1000px" height="400px">';
cal+='             <tr height="80px">';
cal+='                <td colspan="14" align="center" id="calTitle">'+title+'</td></tr>';
cal+='              <tr bgcolor="#e7e7e7">';
cal+='              <th width="110px" class="backslash" scope="col"><font style="margin-left:50px;">시간(시)</font><br><br><font> 날짜(일)</font>';
        for(var i=9; i<22; i++){
cal+='              <th style="text-align:center">'+i+' - '+(i+1)+'</th>';
        }
cal+='              </tr>';
      for(var i=0 ; i<7 ; i++) { 
	        if(day.getDate() == 1){ 
	        	  if(i!=0)flag=true;
		          title += " ~ " + day.getFullYear() + "/" + (day.getMonth()+1); 	
	                }
	        
             var monthno = day.getMonth()+1;
              var dateno = day.getDate(); 
              if(dateno<10)
 				 dateno = '0'+dateno; 
                 if( monthno<10)
                 	monthno = '0' + monthno;        
cal+=              '<tr align="center" scope="col" width="80px" id="a'+day.getFullYear()+(day.getMonth()+1)+day.getDate()+'" class="a'+day.getFullYear()+monthno+dateno+'">'
                   +'<td>'+ day.getDate()+'</td>';
                   for(var j=9; j<22; j++){
cal+='              <td class='+j+'></td>';                	   
                   }//for
cal+=              '</tr>';

               day.setDate(day.getDate()+1);
         }//for

day.setDate(day.getDate()-7); 
cal+='          <tr><td colspan="14" align="right"><span style="color:red;">■</span>예약완료&nbsp;<span style="color:#f8f986;">■</span>오늘</td></tr>'
cal+='          </table>';

document.getElementById("calandar").innerHTML = cal;

if(flag){
	$('#calTitle').html(title);
	
}//if
      


dt=new Date();//오늘날짜

$('#a'+
dt.getFullYear()+
(dt.getMonth()+1)+
dt.getDate()).css('background-color','#f8f986');


calInsert();









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
 			+'menubar=no,scrollbars=no,resizable=0,width=800,height=500');
  
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
	 			+'menubar=no,scrollbars=no,resizable=0,width=800,height=500');
 } 
 
 function calInsert(){
	 	      var ar;
	 	      var roomno = $("[name=integer]").val();
	 	      
	 	     
	 	         
	 	         $.ajax({    		
	 	 	
	 	 				 /* ※ JSON배열 요청  */
	 	 	     		 url:'/useful/meeting/all/'+roomno,
	 	 	     		dataType:'JSON',//생략 불가
	 	 	     		method:'GET',
	 	 	     		//contentType:'application/json; charset=UTF-8',
	 	 	     		 success:function(data){//result:배열
	 	 	     			 
	 	 	     			$().empty();
	 	 	     			 
	 	 	     		
	 	 	     		
	 	 	     		$.each(data, function(idx, key){
	 	                        //key.begin, key.end, 
	 	                          var beginday =(key.beginday).split('/');
	 	                     for(var i=0; i<(key.end-key.begin); key.begin++){
	 	                     $('.a'+beginday[0]+beginday[1]+beginday[2]+'>.'+key.begin).css("background-color","red");
	 	                          
	 	                    }  
			               // alert('a'+beginday[0]+beginday[1]+beginday[2]+'='+(key.end-key.begin));
	 	                  
	 	 	     			  
	 	 	     			 }); 
	 	 	     		      
	 	 	     		 }, 

	 	 		         error:function(xhr, status, error){
	 	 		        	     alert("당신에러"+error);
	 	 		         }

	 	 		  });//ajax
	 	 		  
 }

 
 function searchBooking(){
	 
	 if($('#keywordInput').val()=='')alert('검색어를 입력해 주세요');
	 else if($("select option:selected").val()=='')alert('카테고리를 선택해 주세요');
	 else{
	 self.location = 'bookingList?roomno='
			+ '${integer }'
			+ '&${pageMaker.makeQuery(1)}'
			+ '&searchType='
			+ $("select option:selected").val()
			+ '&keyword=' + $('#keywordInput').val();
	 }
	 }


</script>
</head>
<body>


<div id='page-wrapper'>
	<div class='row'>
		<div class="col-lg-12">
			<h1 class="page-header">
			예약목록
			</h1>
		</div>
	</div>

<div class="form-group" style="text-align:center;">
<p>
<input type="button"  class="btn btn-default"  onclick="week_calandar(-1)" value="◀">
<input type="button"  class="btn btn-default" value="today" onclick="set_day()" /> 
<input type="button" class="btn btn-default"  value="▶" onclick="week_calandar(1)" /> 
</p>


<div id="calandar"></div>
 
<p style="margin-top: 20px;"><input type="button"   class="btn btn-default" onclick="reservation(${integer})" value="예약"></p>

</div>


<input type="hidden" name="integer" value="${integer }">

  <div class='panel-body'>
  <div class='table-responsive'>
<table class='table table-striped table-bordered table-hover' >

<tr>
 <td colspan="7" align="right">
  <select name="searchType"  class='form-control-static'>
   <option value="" <c:out value='${cri.searchType == null?"selected":""}'/>>선택</option>
   <option value="w" <c:out value='${cri.searchType eq "w" ? "selected":""}'/>>작성자</option>
   <option value="day" <c:out value='${cri.searchType eq "day" ? "selected":""}'/>>날짜</option>
     </select>
     
     
    <input type="text"  class='form-control-static'  name="keyword" id="keywordInput" value="${cri.keyword }">
    <input type="button"  class='btn btn-warning' id="searchBtn" value="검색" onclick="searchBooking()">
  
   </td>
</tr>
<tr>
<th align="center" style="text-align: center;">회의실</th>
<th align="center" style="text-align: center;">날짜</th>
<th align="center" style="text-align: center;">예약시간</th>
<th align="center" style="text-align: center;">예약자</th>
</tr>



<c:forEach items="${list}" var="MeetingVO">
<tr>
<td align="center" >${MeetingVO.roomno}</td>
<td align="center">${MeetingVO.beginday}</td>
<td align="center">${MeetingVO.begin}-${MeetingVO.end}</td>
<td align="center">${MeetingVO.booker }</td>
</tr>

</c:forEach>

   <tr><td colspan="7" align="center">
   <ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="bookingList?${pageMaker.startPage - 1}">◀</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li	<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="bookingList?page=${idx}&roomno=${integer}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="bookingList?${pageMaker.endPage +1}">▶</a></li>
							</c:if>

						</ul>
    </td>
    </tr>
</table>
</div>
</div>

</div>


	<script>
		window.onload = function () {
			week_calandar(0);
			

		};

	</script>



</body>
</html>