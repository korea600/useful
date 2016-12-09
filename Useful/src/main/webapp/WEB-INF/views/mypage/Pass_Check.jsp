<%@page import="kr.co.useful.login.service.LoginService"%>
<%@page import="kr.co.useful.encrypt.LocalEncrypter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
<%@include file="../login/Main.jsp" %>
<!-- Bootstrap Core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function cancel(){
			location.href="/useful/login/Mainview";
		}
	
	function passCheck(){
		
		var pass = document.form.pass.value;
		var mypass= ${vo};

		if(pass.trim()==''){
            alert("비밀번호를 입력해주세요");
            document.form.pass.focus();
        }else if(pass!=mypass){
        	alert("비밀번호를 확인해주세요");
			document.form.pass.value='';
			document.form.pass.focus();
        }else{
        	document.form.submit();
		}
	}	
		
	</script>

<style>
.button1 {
	border: 0;
	height: 35px;
	color: #fff;
	background-color: #545250;
	cursor: pointer;
	font-size: 18px;
}

.input_text {
	height: 22px;
	background-color: #f1efe8;
}
</style>

</head><%@include file="../login/Sidebar.jsp" %>
<body>
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
               
                    <div class="panel-body">
                        <form name="form" id="form" action="Mypage" method="post">
                        	<div>
                        		<input type="hidden" name="empno" value="${LoginUser.empno }">
                        	</div>
								<div class="panel-heading">
                      			  	<h3 class="panel-title" align="center">본인 확인을 위하여 비밀번호를  <br>
                      			  		입력해주세요.</h3>
                   				 </div>
                                <div class="form-group" >
                                   <b>Password : </b><input class="form-control"  name="pass" type="password" id="passinput">
                                </div>
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <div align="center">
                                <button type="button" id="btn" onclick="passCheck()" class="btn btn-outline btn-success">확인</button>
                                <button type="reset" id="btn_cancel" onclick="cancel()" class="btn btn-default">취소</button>
                                
                                </div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>

 <!-- jQuery -->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/dist/js/sb-admin-2.js"></script>

</body>
</html>