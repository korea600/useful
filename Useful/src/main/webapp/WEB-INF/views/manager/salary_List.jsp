<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>급여대장조회</title>
<style type="text/css">
th {
	background-color: #CCC;
}	
</style>
 <link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){	
		
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
	
 	   $( "#btn_oneReg" ).click(function(){
 		  location.href="/useful/manager/salary_Insert";  
 	   });
 	   $( "#btn_search" ).click(function(){
 		  searchList();
 	   });
 	   
		searchList();//기본날짜에 전체출력
});
 	function searchList(){
	 		  $.ajax({
	 			  type: 'POST',
	 			  url: '/useful/manager/salary_List',
	 			  headers : {
	 				  "Content-Type" : "application/json",
	 				  "X-HTTP-Method-Override":"POST"
	 			  },
	 			  dataType: 'text',
	 			  data: JSON.stringify({
	 					startdate:$("#startdate").val(),
	 					enddate:$("#enddate").val(),
	 					deptno:$("#deptno option:selected").val(),
	 					empno:$("#empno").val(),
	 					ename:$("#ename").val()
	 				  }),
	 			  success: function(result){
	 					$("#div_print").html(result);
	 			  }
	 			});
	}
 	
 	function call_Delete(serial){
		  $.ajax({
 			  type: 'DELETE',
 			  url: '/useful/manager/salary_List',
 			  headers : {
 				  "Content-Type" : "application/json",
 				  "X-HTTP-Method-Override":"POST"
 			  },
 			  dataType: 'text',
 			  data: JSON.stringify({
 					empno:empno,
 					paymentmonth:paymentmonth
 				  }),
 			  success: function(result){
 				  alret('삭제되었습니다');
 				 searchList();
 			  }
 			});
 		
 	}
</script> 
</head>
<body>
<header><%@include file="/WEB-INF/views/manager/Main.jsp"%></header> 
<div>
	<jsp:include page="/WEB-INF/views/manager/Sidebar.jsp"></jsp:include>  
</div>
	<div id="page-wrapper">
	            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">급여대장조회</h1>
                </div>
            </div>
		<input type="button" id="btn_oneReg" value="급여등록" /> 
	<div id="div_searchArea" class="searchArea cb mgb10"
		style="vertical-align: middle; min-width: 800px; padding-bottom: 0px; padding-top: 15px;">
		<table style="border-color: black;">
		<tbody>
		<tr>
		<th style="height: 40px;width: 200px;	text-align: center;">검색기간</th>
		<td>
							 	<button id="btn_today" class="btn btn-default" >당일</button>
								<button id="btn_week" class="btn btn-default" >1주일</button>
								<button id="btn_month" class="btn btn-default" >1개월</button>
								<button id="btn_3month" class="btn btn-default" >3개월</button><p>
								<input type="text" id="startdate" value="">
										~<input type="text" id="enddate" value="">
		</td>
		</tr>
		
		<tr>
		<th style="	text-align: center;">부서명</th>
			<td><select id="deptno" name="deptno" class="select" style="width: 200px;">
						<option value="" selected="selected">-- 선택 --</option>
						<option value="10">잘했조</option>
						<option value="20">보여조</option>
						<option value="30">강조</option>
						<option value="40">삼삼오오조</option>
				</select></td>
			</tr>
		<tr>
			<th  style="	text-align: center;">사원번호</th>
			<td><input type="text" id="empno"></td>
		</tr>
		<tr>
			<th  style="	text-align: center;">사원명</th>
			<td><input type="text" id="ename"></td>
		</tr>
		</tbody>
		</table>
	<div><button id="btn_search" class="btn btn-default" >검색</button></div>
	
	</div>
	
	<div id="div_print">
	<table style="margin-top: 10px; width: 100%;">
	<tr>
		<th width="8%">사번</th>
		<th width="8%">사원명</th>
		<th width="8%">부서</th>
		<th width="8%">직급</th>
		<th width="10%">귀속월</th>
		<th width="10%">지급일</th>
		<th width="10%">기본급</th>
		<th width="10%">지급합계</th>
		<th width="10%">공제합계</th>
		<th width="10%">차인지급액</th>
		<th width="8%"></th>
	</tr>
	<tr>
		<td colspan="8">
		<b>데이터를 가져오는중입니다...</b>
		</td>
	</tr>
	</table>
	</div>
</div>
</body>
</html>