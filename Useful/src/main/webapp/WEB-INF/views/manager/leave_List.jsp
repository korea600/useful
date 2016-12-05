<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>연차관리</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.11.0.min.js"></script> 
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>  
<script type="text/javascript">



</script>
</head>
<header><%@include file="/WEB-INF/views/manager/Main.jsp"%></header>
<body>
<div>
	<jsp:include page="/WEB-INF/views/manager/Sidebar.jsp"></jsp:include> 
</div>
<!-- leave_List.jsp -->
<div id="page-wrapper">
<p><br>
<font size="5" style="font-style: inherit;">연차관리</font><br><hr>
<table style="border-color: black;">
<tbody>

	<tr>
		<th style="	text-align: center;">부서명</th>
			<td><select id="deptno" name="deptno" class="select" style="width: 200px;">
						<option value="0" selected="selected">-- 선택 --</option>
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
	</div>
</div>
</body>
</html>