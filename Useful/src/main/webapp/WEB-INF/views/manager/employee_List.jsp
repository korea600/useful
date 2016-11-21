<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원관리</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="useful/resources/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="useful/resources/jqgrid/css/ui.jqgrid.css" />
<script type="text/javascript" src="useful/resources/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="useful/resources/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="useful/resources/jqgrid/js/jquery.jqGrid.src.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:'/manager/list',	
			headers: { 
			      "Content-Type": "application/json",
			       },
			dataType:'json', 
			success:function(result){
			
  			  for(var i=0;i<=gridData.length;i++){
        	    $("#list").jqGrid('addRowData',i+1,gridData[i]);
  			  }
		}
			
		});
		
		$("#employee_tbl").jqGrid({
			datatype:"local",
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