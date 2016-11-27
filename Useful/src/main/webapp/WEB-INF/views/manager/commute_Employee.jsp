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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/i18n/grid.locale-en.js"></script> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery.jqGrid.src.js"></script> 
<fmt:formatDate value="${sysdate }" type="date" pattern="yyyy-MM-dd " var="fmtSysdate"/>
<script type="text/javascript">

	$(function() {
		
		
 	   $( "#startdate" ).datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd'
 	   });
 	   $( "#enddate" ).datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd'
 	   });
 	   
		var now =new Date();
		now.format("yyyy-MM-dd");
 	   $("#btn_today").click(function(){
 		   alert(now);
 		  $("#startdate").val(now);
 	   });
 	   $("#btn_List").click(function(){
 		   
 			location.href="/useful/manager/employee_List";
 		   
 	   });
	});
 
</script>
</head>
<header><%@include file="/WEB-INF/views/login/Main.jsp"%></header>
<body>
<div>
	<jsp:include page="/WEB-INF/views/login/Sidebar.jsp"></jsp:include> 
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
	<jsp:useBean id="sysdate" class="java.util.Date"></jsp:useBean>
		<input type="text" id="startdate" value="<fmt:formatDate value="${sysdate }" type="date" pattern="yyyy-MM-dd "/>">
		~<input type="text" id="enddate" value="<fmt:formatDate value="${sysdate }" type="date" pattern="yyyy-MM-dd "/>">
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
	
	<div>
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<th width="30%">부서(사원)</th>
		<th width="15%">출근일자</th>
		<th width="15%">출근시간</th>
		<th width="15%">퇴근일자</th>
		<th width="15%">퇴근시간</th>
		<th width="13%">구분</th>
		<th width="10%">상세</th>
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