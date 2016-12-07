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
var popup;
function pop(result){
	var set='toolbar=0,status=0,menubar=0,scrollbars=yes,height=600,width=800';
	var target=result;
	popup=window.open('about:blank','popup_name',set);
	$.load("url",function(){
		popup.locagion=target;
	});
}
	$(function(){
	var now = new Date();
	var month=now.getMonth()+1;
	var year=now.getFullYear();
	$("#search_year").val(year).prop("selected", true);
	$("#search_month").val(month).prop("selected", true);
	$("#send_data").click(function(){
		 $.ajax({
			  type: 'POST',
			  url: '/useful/mypage/proof_Of_emp',
			  headers : {
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override":"POST"
			  },
			  dataType: 'text',
			  data: JSON.stringify({
				empno:${LoginUser.empno},
				purpose:$("#purpose_of_use").val(),
				  }),
			  success:function(result){
				  //self.location(result);
					//location.href='http://localhost/useful/mypage/proof_Of_emp_Print';
					//pop(result);
					//var re=result
					//$("#div_print").html(result);
					var w = window.open();
					w.document.write(result);
					//var downLoadUrl = "http://localhost/useful/mypage/proof_Of_emp_Print"
					//$("#frm").attr("action",downLoadUrl).submit();
						
			  } 
			});
	});
	$("#send_test").click(function(){
		location.href='/useful/mypage/proof_Of_emp2';
	});
});
</script>
</head><%@include file="../login/Sidebar.jsp" %>
<body>

<div>
	  
</div>
	<div id="page-wrapper">
		<br>
	<font size="5" style="font-style: inherit;">증명서 출력</font><br><hr>
	현재 재직증명서를 다운받으실수 있습니다. <br>
	사용 용도를 꼭 적어주세요. <br>
	<br>
	사용 용도 : <input type="text" id="purpose_of_use" size="30"> 
	<button id="send_data">다운로드</button>
	<button id="send_test">다운로드</button>
	
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