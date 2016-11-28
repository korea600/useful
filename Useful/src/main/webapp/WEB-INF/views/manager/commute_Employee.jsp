<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원별 근태현황</title>
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
		
		
 	   $("#startdate").datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd',
 	   }).datepicker("setDate", new Date());
 	   $("#enddate").datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd',
 	   }).datepicker("setDate", new Date());
 	   $("#btn_today").click(function(){
 		  $("#startdate").datepicker("setDate", new Date());
 		  $("#enddate").datepicker("setDate", new Date());
 	   });
 	   $("#btn_week").click(function(){
 		  $("#startdate").datepicker("setDate", -7);
 		  $("#enddate").datepicker("setDate", new Date());
 	   });
 	   $("#btn_month").click(function(){
 		  $("#startdate").datepicker("setDate", -30);
 		  $("#enddate").datepicker("setDate", new Date());
 	   });
 	   $("#btn_3month").click(function(){
 		  $("#startdate").datepicker("setDate", -90);
 		  $("#enddate").datepicker("setDate", new Date());
 	   });
 	   $("#btn_search").click(function(){
 		   
 		  $.ajax({
 			  type: 'POST',
 			  url: '/useful/manager/commute_Employee',
 			  headers : {
 				  "Content-Type" : "application/json",
 				  "X-HTTP-Method-Override":"POST"
 			  },
 			  dataType: 'text',
 			  data: JSON.stringify({
 				startdate:$("#startdate").val(),
 				enddate:$("#enddate").val(),
 				dept:$("#dept option:selected").val(),
 				empno:$("#empno").val(),
 				ename:$("#ename").val()
				
 				  }),
 			  success: function(result){
 					$("#div_print").innerHTML(result);
 			  }
 			});
 	   });
	});
 
</script>
</head>
<header><%@include file="/WEB-INF/views/manager/Main.jsp"%></header>
<body>
<div>
	<jsp:include page="/WEB-INF/views/manager/Sidebar.jsp"></jsp:include> 
</div>
<!-- commute_Employee.jsp -->
<div id="page-wrapper">
<p><br>
<font size="5" style="font-style: inherit;">사원별 근태현황</font><br><hr>
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
		~<input type="text" id="enddate" value="">
	</td>
	</tr>
	<tr>
		<th>부서명</th>
			<td><select id="dept" name="dept" class="select" style="width: 200px;">
						<option value="" selected="selected">-- 선택 --</option>
						<option value="10">잘했조</option>
						<option value="20">보여조</option>
						<option value="30">강조</option>
						<option value="40">삼삼오오조</option>
				</select></td>
			</tr>
	<tr>
		<th>사원번호</th>
		<td><input type="text" id="empno"></td>
	</tr>
	<tr>
		<th>사원명</th>
		<td><input type="text" id="ename"></td>
	</tr>
</tbody>
</table>
	<div><button id="btn_search">검색</button></div>
	
	<div id="div_print">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<th width="30%">부서(사원)</th>
		<th width="14%">출근일자</th>
		<th width="15%">출근시간</th>
		<th width="14%">퇴근일자</th>
		<th width="15%">퇴근시간</th>
		<th width="13%">구분</th>
		<th width="12%">변경</th>
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