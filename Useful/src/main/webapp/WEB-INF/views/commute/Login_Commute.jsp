<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- Login_Commute.jsp --%>
<title>출퇴근 내역</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<style type="text/css">
th {
	background-color: #CCC;
}

</style>
 <link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqGrid/css/ui.jqgrid.css" /> 
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqGrid/plugins/ui.multiselect.css" /> 
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.11.0.min.js"></script> --%>
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>   
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/i18n/grid.locale-en.js"></script> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery.jqGrid.min.js"></script> 
<script type="text/javascript">

	$(function() {
		
		
 	   $("#startdate").datepicker({ //datepicker : <input type="text"> 를 눌렀을 시 달력이 띄워짐.
 		  changeMonth: true, //월을 바꿀 수 있는 셀렉트 박스
          changeYear: true, //년을 바꿀 수 있는 셀렉트 박스
 		  dateFormat: 'yy-mm-dd', //텍스트 필드에 입력되는 날짜 형식 => 2016-11-30
 	   }).datepicker("setDate", new Date()); // setDate를 현재 날짜로 변경
 	   $("#enddate").datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd',
 	   }).datepicker("setDate", new Date());
 	  $("#btn_today").click(function(){ //당일 버튼을 누르게 되면 
 		  $("#startdate").datepicker("setDate", new Date());
 		  $("#enddate").datepicker("setDate", new Date());
 	   });
 	   $("#btn_week").click(function(){
 		  $("#startdate").datepicker("setDate", -7); //startdate :  현재 날짜 -7일
 		  $("#enddate").datepicker("setDate", new Date());
 	   });
 	   $("#btn_month").click(function(){
 		  $("#startdate").datepicker("setDate", -30); //-30일
 		  $("#enddate").datepicker("setDate", new Date());
 	   }); 	
 	   $("#btn_3month").click(function(){
 		  $("#startdate").datepicker("setDate", -90); //-90일
 		  $("#enddate").datepicker("setDate", new Date());
 	   });
 	   $("#btn_search").click(function(){ //검색버튼

 		  $.ajax({
 			  type: 'POST',
 			  url: '/useful/commute/Login_Commute?empno='+${LoginUser.empno},
 			  headers : {
 				  "Content-Type" : "application/json",
 				  "X-HTTP-Method-Override":"POST"
 			  },
 			  dataType: 'text',
 			  data: JSON.stringify({
 				startdate:$("#startdate").val(),
 				enddate:$("#enddate").val()			
 				  }),
 			  success: function(result){
 				 //document.getElementById("div_print").innerHTML = result;
 					$("#div_print").html(result);
 				  },
 			error:function(request,status,error){
 			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
 			}); 
 	   });
	});
		



</script>

</head>
<body>

<!-- commute_Employee.jsp -->
<div id="page-wrapper">
<p><br>
<font size="5" style="font-style: inherit;">출퇴근 내역</font><br><hr>
<table>
<tbody>
	<tr>
	<th style="height: 40px">검색기간</th>
	<td>
	<button id="btn_today">당일</button>
	<button id="btn_week">1주일</button>
	<button id="btn_month">1개월</button>
	<button id="btn_3month">3개월</button><p>
		<input type="text" id="startdate" value="">
		~ <input type="text" id="enddate" value="">
	</td>
	</tr>
	
</tbody>
</table>
	<div><button id="btn_search">검색</button></div>
	
	<div id="div_print">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<th width="15%">부서명</th>
		<th width="15%">사원명</th>
		<th width="14%">출근일자</th>
		<th width="15%">출근시간</th>
		<th width="15%">퇴근일자</th>
		<th width="15%">퇴근시간</th>
		<th width="25%">구분</th>
	</tr>
			<tr>
			<td colspan="8">
			<b>데이터가 없습니다.</b>
			</td>
		</tr>
		</table>
	
	</div>
</div>
</body>
</html>