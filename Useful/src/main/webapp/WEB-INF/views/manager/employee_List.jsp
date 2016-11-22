<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원관리</title>
 <link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid/css/ui.jqgrid.css" /> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/js/i18n/grid.locale-en.js"></script> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/js/jquery.jqGrid.src.js"></script> 
<script type="text/javascript">
	$(function(){
		
		$("#employee_tbl").jqGrid({
			url:'/manager/list',	
			dataType:'json', 
			mtype:'POST',
            height: 250,
            colNames:['사번','성명','부서','직책','핸드폰번호'],
            colModel:[
                {name:'empno'},
                {name:'ename'},
                {name:'deptno'},
                {name:'position'},     
                {name:'phone'}     
            ],
            caption: "사원목록"
		});
	
	});
</script>
</head>
<body>
	<table id="employee_tbl"></table>
	<div id="employee_div"></div>
</body>
</html>