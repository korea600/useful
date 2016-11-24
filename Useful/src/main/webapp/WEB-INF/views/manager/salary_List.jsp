<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>급여대장조회</title>
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

	<p>
		<font size="5" style="font-style: inherit;">급여대장조회</font>
		<input type="button" id="btn_search" value="조회" />
		<input type="button" id="btn_oneReg" value="급여개별등록" /> 
		<input type="button" id="btn_delete" value="삭제" />
	</p>
	<hr>
	<div id="div_searchArea" class="searchArea cb mgb10"
		style="vertical-align: middle; min-width: 800px; padding-bottom: 0px; padding-top: 15px;">
		<div>조회기간: <input type="text" id="startdate">~<input type="text" id="enddate">  </div>
	</div>
</body>
</html>