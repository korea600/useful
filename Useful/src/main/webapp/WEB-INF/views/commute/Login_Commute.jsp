<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- Login_Commute.jsp --%>
<title>출퇴근 내역</title>
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
		~<input type="text" id="enddate" value="">
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
		<th width="14%">퇴근일자</th>
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