<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<%@include file="../login/Main.jsp" %>

	<script type="text/javascript">
		function passCheck(){
			
			 var pass = document.form.password.value;
			 var reg_pwd = /^.*(?=.{8,15})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			 //^:입력문자열의 시작위치
			 //.:\n을 제외한 모든 단일 문자
			 //*:부분식의 선행문자를 0개이상 찾음
			 //?:부분식의 선행문자를 0개 또는 1개 찾거나 제한적인 한정기호를 나타냄
			 
			 if(!reg_pwd.test(pass)){
				 alert('비밀번호를 확인하세요.\n(영문,숫자를 혼합하여 8~15자 이내)');    
				document.form.password.value="";
				document.form.password.focus();
			 }
					 
			 $.ajax({
				type:"post",
				async:true,
				url:"/useful/login/checkpass",
				data:{
					password : $("#passinput").val()
					 },
				success:function(result){
					if(result=="SUCCESS"){
						alert("비밀번호가 정상적으로 변경되었습니다 \n"
								+"변경된 비밀번호로 다시 로그인해주세요.");
						location.href="/useful";
					}
				}
			 });
		}
			 
		
	
	</script>



</head><%@include file="../login/Sidebar.jsp" %>
<body>
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
               
                    <div class="panel-body">
                        <form name="form" id="form" action="/useful/login/checkpass" method="post">
                        	<div>
                        		<input type="hidden" name="empno" value="${LoginUser.empno }">
                        	</div>
								<div class="panel-heading">
                      			  	<h3 class="panel-title" align="center">초기 로그인을 환영합니다.  <br>
                      			  		앞으로 사용할 비밀번호를 설정해주세요. <br> 
                      			  		(8~15자리, 영문+숫자조합)</h3>
                   				 </div>
                                <div class="form-group" >
                                   <b>Password : </b><input class="form-control"  name="password" type="password" id="passinput">
                                </div>
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <div align="center">
                                <button type="button" id="btn" onclick="passCheck()" >확인</button>
                                
                                </div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
</body>
</html>