<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script type="text/javascript">

	$(function() {
 	   $( "#hiredate" ).datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd'
 	   });
 	   
 	   $("#btn_search").click(function(){

 	   });
 	   $("#btn_List").click(function(){
 		   
 			location.href="/useful/manager/employee_List";
 		   
 	   });
	});

</script>
</head>
<body>
<!-- commute_Employee.jsp -->
<font size="5" style="font-style: inherit;">사원별 근태현황</font><br><hr>
<table>
<tbody>
	<tr>
	
	<td>검색기간</td>
	<td>
	<button id="btn_today">당일</button>
	<button id="btn_week">1주일</button>
	<button id="btn_month">1개월</button>
	<button id="btn_3month">3개월</button><br>
	<jsp:useBean id="sysdate" class="java.util.Date"></jsp:useBean>
	<fmt:formatDate value="${sysdate }" type="date" pattern="yyyy-MM-dd "/>
		<input type="text" id="startdate" value="${sysdate}">~<input type="text" id="enddate" value="${sysdate}">
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
		<td>사원번호</td>
		<td><input type="text" id="empno"></td>
	</tr>
	<tr>
		<td>사원명</td>
		<td><input type="text" id="ename"></td>
	</tr>
</tbody>
	<div><button id="btn_search">검색</button></div>
</table>
</body>
</html>