<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>급여대장조회</title>
 <link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.11.0.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){	
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
});
</script> 
</head>
<body>
<header><%@include file="/WEB-INF/views/manager/Main.jsp"%></header> 
<div>
	<jsp:include page="/WEB-INF/views/manager/Sidebar.jsp"></jsp:include>  
</div>
	<div id="page-wrapper">
	<p>
		<font size="5" style="font-style: inherit;">급여대장조회</font>
		<input type="button" id="btn_oneReg" value="급여등록" /> 
		<input type="button" id="btn_delete" value="삭제" />
	</p>
	<hr>
	<div id="div_searchArea" class="searchArea cb mgb10"
		style="vertical-align: middle; min-width: 800px; padding-bottom: 0px; padding-top: 15px;">
		<div>조회기간: <input type="text" id="startdate">~<input type="text" id="enddate">  </div>
		<input type="button" id="btn_search" value="조회" />
	</div>
	
	<div id="div_print">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px; width: 100%;">
	<tr>
		<th width="10%">사번</th>
		<th width="20%">사원명</th>
		<th width="20%">부서</th>
		<th width="10%">직급</th>
		<th width="10%">기본급</th>
		<th width="10%">지급합계</th>
		<th width="10%">공제합계</th>
		<th width="10%">차인지급액</th>
	</tr>
	<tr>
		<td colspan="8">
		<b>데이터를 검색해주세요</b>
		</td>
	</tr>
	</table>
	</div>
</div>
</body>
</html>