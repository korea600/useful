<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원관리</title>
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
		
		$("#employee_tbl").jqGrid({
			url:'/useful/manager/list2',	
			datatype:'json', 
			mtype:'POST',
            height: 250,
            colNames:['사번','성명','부서','직책','핸드폰번호'],
            colModel:[
                {name:'empno',index:'empno'},
                {name:'ename',index:'ename'},
                {name:'deptno',index:'deptno'},
                {name:'position',index:'positon'},     
                {name:'phone',index:'phone'}     
            ],
           	rowNum:10,
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