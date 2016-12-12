<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>증명서관리</title>
<%@include file="../login/Main.jsp" %>

<!-- Bootstrap Core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">



<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.11.0.min.js"></script> 
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>  
<script type="text/javascript">
	$(function(){

	$("#send_data").click(function(){
		if($("#purpose_of_use").val()==""){
			alert('사용목적을 입력해주세요');
		}else{
		   $('[name=purpose]').val($("#purpose_of_use").val());
		   $('form[name=send]').submit();
		}
	});
});
</script>
</head><%@include file="../login/Sidebar.jsp" %>
<body>
  <form method="post" action="/useful/mypage/proof_Of_emp" name="send" enctype="application/json">
     <input type="hidden" name="empno"  value="${LoginUser.empno}">
     <input type="hidden" name="purpose" >
  </form>
<div>
	  
</div>
	<div id="page-wrapper">
		<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">증명서 출력</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
	<div class="panel-heading">
             <h3 class="panel-title" align="left">현재 재직증명서를 다운받으실수 있습니다. <br>
                      	사용 용도를 꼭 적어주세요. <br></h3>
	
    </div>
    <div class="panel-body">
		<font size="7">사용 용도 : </font> <input type="text" id="purpose_of_use" size="30" class="form-control-static"> 
	<button id="send_data" class="btn btn-default">다운로드</button>
	</div>
	
	<form id="frm" action="/useful/mypage/proof_Of_emp" method="post"></form>
	<div id="div_print" ></div>
</div>
</body>

 <!-- jQuery -->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/dist/js/sb-admin-2.js"></script>
</html>