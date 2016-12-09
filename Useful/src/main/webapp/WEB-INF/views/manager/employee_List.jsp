<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>직원관리</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqGrid/css/ui.jqgrid.css" /> 
	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script> 
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.11.0.min.js"></script> --%>
 <script type="text/javascript" 
	src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/i18n/grid.locale-kr.js"></script> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery.jqGrid.min.js"></script> 
<script type="text/javascript">
	$(function(){	
 		//$("#employee_tbl").jqGrid("GridUnload");
 		$("#employee_tbl").jqGrid({
		url:'/useful/manager/list',	
		datatype:'json', 
		mtype:'POST',
        height: 250,
        colNames:['사번','성명','부서','직책','핸드폰번호'],
        colModel:[
            {name:'EMPNO',index:'EMPNO'},
            {name:'ENAME',index:'ENAME'},
            {name:'DEPTNO',index:'DEPTNO'},
            {name:'POSITION',index:'POSITION'},     
            {name:'PHONE',index:'PHONE'}  
     
        ],
        onSelectRow: function(ids) {   
            //row 선택시 처리. ids는 선택한 row
            var empno= $("#employee_tbl").jqGrid('getRowData',ids).EMPNO;
            location.href="/useful/manager/employee_Update"+"?empno="+empno;
        },   
        rowNum:10,
        loadonce:true,
        rowList:[10,20,30],
        pager:'#employee_div',
        sortname:'EMPNO',
        viewrecords: true,
        sortorder:"ASC",
        caption: "사원목록",
        jsonReader: {
            page: "page",
            total: "total",
            records:"records",
            repeatitems:false
        }

	}).trigger('reloadGrid');
	$("#employee_tbl").jqGrid('navGrid','#employee_div',{edit:false,add:false,del:false}); 
	
	$('#btn_Search').click(function(){
					$("#employee_tbl").clearGridData();
					//$("#employee_tbl").jqGrid("GridUnload");
					$("#employee_tbl").setGridParam({
						url:'/useful/manager/listSearch?'
						+"searchType=" + $("#searchType option:selected").val()
						+ "&keyword=" + $('#keyword').val(),	
						datatype:'json', 
						mtype:'POST',
			            height: 250,
			            colNames:['사번','성명','부서','직책','핸드폰번호'],
			            colModel:[
			                {name:'EMPNO',index:'EMPNO'},
			                {name:'ENAME',index:'ENAME'},
			                {name:'DEPTNO',index:'DEPTNO'},
			                {name:'POSITION',index:'POSITION'},     
			                {name:'PHONE',index:'PHONE'}  
			         
			            ],
			             onSelectRow: function(ids) {   
			                 //row 선택시 처리. ids는 선택한 row
			                 var empno= $("#employee_tbl").jqGrid('getRowData',ids).EMPNO;
			                 location.href="/useful/manager/employee_Update"+"?empno="+empno;
			             },   
						loadonce: true,
			            rowNum:10,
			            rowList:[10,20,30],
			            pager:'#employee_div',
			            sortname:'EMPNO',
			            viewrecords: true,
			            sortorder:"asc",
			            caption: "사원목록",
			            jsonReader: {
                            page: "page",
                            total: "total",
                            records:"record",
			                repeatitems:false
			            }

					}).trigger('reloadGrid');
					$("#employee_tbl").jqGrid('navGrid','#employee_div',{edit:false,add:false,del:false});
		
				});
	$('#btn_NewUser').click(function(){
		
		location.href="/useful/manager/employee_Insert";
		
		});

	
	});
</script>
</head>
 <header><%@include file="/WEB-INF/views/manager/Main.jsp"%></header> 
<body>
<div>
	<jsp:include page="/WEB-INF/views/manager/Sidebar.jsp"></jsp:include>  
</div>
<div id="page-wrapper">
	        <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">직원관리</h1>
                </div>
            </div>
	<div>
		- 검색어 
		<select id="searchType" name="searchType" class="form-control-static" >
			<option value="divGbn" selected="selected" >전체</option>
			<option value="name">성명</option>
			<option value="no">사번 </option>
			<option value="dept">부서</option>
			<option value="posi">직책</option>
		</select>	
		<input type="text" id="keyword" name="keyword" >
		<button id="btn_Search" class="btn btn-default">조회</button>
		<button id="btn_NewUser" class="btn btn-default">신규</button>

	</div>
	<table id="employee_tbl" ></table>
	<div id="employee_div"></div>
	
</div>
<div id="page-wrapper"></div>
</body>
</html>