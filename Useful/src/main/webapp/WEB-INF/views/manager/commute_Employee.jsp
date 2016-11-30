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
	text-align: center;
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
function call_Update(dname,ename,login,login_Time,logout,logout_Time,checked,serial){
	
	
	$("#update_Dname").text(dname);
	$("#update_Ename").text(ename);
	$("#update_Login").val(login);
	$("#update_Login_TimeHH").val(login_Time.substring(0,2)).prop("selected", true);
	$("#update_Login_TimeMM").val(login_Time.substring(3,5)).prop("selected", true);
	$("#update_Logout").val(logout);
	$("#update_Logout_TimeHH").val(logout_Time.substring(0,2)).prop("selected", true);
	$("#update_Logout_TimeMM").val(logout_Time.substring(3,5)).prop("selected", true);
	$("#update_Checked").val(checked).prop("selected",true);
	$("#update_Serial").val(serial);
	$("#popup").fadeIn(700);
}
function div_load(){
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
				deptno:$("#deptno option:selected").val(),
				empno:$("#empno").val(),
				ename:$("#ename").val()
			
				  }),
			  success: function(result){
				 //document.getElementById("div_print").innerHTML = result;
					$("#div_print").html(result);
				  },
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
			}); 
}
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
 	   $("#update_Login").datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd',
 	   });
 	   $("#update_Logout").datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd',
 	   });
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
 		$("#btn_close").click(function(){
 			$("#popup").fadeOut(500);
 		});
 		$("#btn_update").click(function(){
 			$.ajax({
 				type:'POST',
 				url:'/useful/manager/commute_Update',
 	 			  headers : {
 	 				  "Content-Type" : "application/json",
 	 				  "X-HTTP-Method-Override":"POST"
 	 			  },	
 	 			  dataType: 'text',
 	 			  data: JSON.stringify({
 	 				serial:$("#update_Serial").val(),
 	 				login:$("#update_Login").val()+" "+$("#update_Login_TimeHH").val()+":"+$("#update_Login_TimeMM").val()+":00",
 	 				logout:$("#update_Logout").val()+" "+$("#update_Logout_TimeHH").val()+":"+$("#update_Logout_TimeMM").val()+":00",
 	 				checked:$("#update_Checked option:selected").val()
 	 				  }),
 	 			  success: function(result){
 	 				  if(result=="SUCCESS"){
 	 						div_load();
 	 						alert("수정되었습니다");
	 	 				  }
 	 				  }
 			});
 							$("#popup").fadeOut(500);
 		});
 	   $("#btn_search").click(function(){
 		  div_load();
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
	
	<div id="div_print">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<th width="15%">부서명</th>
		<th width="15%">사원명</th>
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
<div id="popup" class="overlay"
		style="z-index: 25; display: none; position: fixed; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.6); width: 100%; height: 100%;">
		<div
			style="background-color: white; width: 50%; height: 60%; margin-left: 20%; margin-top: 10%;  border: 1px solid black;">

			<br>
			<table class="table" style="margin-left: 30px;margin-top: 10px;margin-right: 30px;width: 90%;">
				<tr>
				<td colspan="2" align="center">근태상태 변경페이지</td>
				</tr>
				<tr>
					<th width="30%" align="center">부서명</th>
					<td><div id="update_Dname"></div></td>
				</tr>
				<tr>
					<th>사원명</th>
					<td><div id="update_Ename"></div></td>
				</tr>
				<tr>
					<th>출근일자</th>
					<td><input type="text" id="update_Login"></td>
				</tr>
				<tr>
					<th>출근시간</th>
					<td>
						<select id="update_Login_TimeHH"  class="select" style="width: 50px;">
						<option value="" selected="selected">선택</option>
						<% for(int i=0;i<24;i++){ 
							if(i<10){%>
						<option value="0<%=i%>">0<%=i %></option>
						<%}else{ %>
						<option value="<%=i%>"><%=i %></option>
						<%} }%>
						</select>시
						<select id="update_Login_TimeMM"  class="select" style="width: 50px;">
						<option value="" selected="selected">선택</option>
						<%for(int j=0;j<60;j++){ 
								if(j<10){%>
						<option value="0<%=j%>">0<%=j%></option>
						<%}else{ %>
						<option value="<%=j%>"><%=j %></option>
						<%} }%>
						</select>분
				
				
				</td>
				</tr>
				<tr>
					<th>퇴근일자</th>
					<td><input type="text" id="update_Logout"></td>
				</tr>
				<tr>
					<th>퇴근시간</th>
					<td>
						<select id="update_Logout_TimeHH"  class="select" style="width: 50px;">
						<option value="" selected="selected">-- 선택 --</option>
						<%for(int i=0;i<24;i++){ 
							if(i<10){%>
						<option value="0<%=i%>">0<%=i %></option>
						<%}else{ %>
						<option value="<%=i%>"><%=i %></option>
							<%} 
						}%>
						</select> 시
						<select id="update_Logout_TimeMM"  class="select" style="width: 50px;">
						<option value="" selected="selected">-- 선택 --</option>
						<%for(int j=0;j<60;j++){ 
								if(j<10){%>
						<option value="0<%=j%>">0<%=j%></option>
						<%}else{ %>
						<option value="<%=j%>"><%=j %></option>
						<%} 
						}%>
						</select> 분
					</td>
				</tr>
				<tr>
					<th>구분</th>
					<td><select id="update_Checked">
					<option value="출근">출근</option>
					<option value="지각">지각</option>
					<option value="결근">결근</option>
					<option value="휴가">휴가</option>
					<option value="출장">출장</option>
					<option value="조퇴">조퇴</option>
					<option value="월차">월차</option>
					<option value="반차">반차</option>
					</select></td>
				</tr>
			</table>
			<input type="hidden" id="update_Serial">
			<button type="button" class="btn btn-default" id="btn_update"
				style="margin-left: 45%">수정</button>
			<button type="button" class="btn btn-default" id="btn_close"
				>닫기</button>


		</div>
	</div>
</body>
</html>