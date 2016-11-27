<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>

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
			location.href="/useful/login/Login";
		}
	
	/* function passCheck(){
	
		var pass = document.form.pass.value;
		var mypass= ${vo.pass};

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
	}	 */
		
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

</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
               
                    <div class="panel-body">
                        <form name="form" id="form" action="/useful/login2/sendpw" method="post">
                        	<div>
                        		<input type="hidden" name="empno" value="${LoginUser.empno }">
                        	</div>
								<div class="panel-heading">
                      			  	<h3 class="panel-title" align="center">비밀번호 찾기</h3>
                   				 </div>
                                <div class="form-group" >
                                   <b>사원번호 : </b><input class="form-control"  name="empno" type="text" id="empnoinput">
                                </div>
                                <div class="form-group" >
                                   <b>이름 : </b><input class="form-control"  name="name" type="text" id="nameinput">
                                </div>
                                <div class="form-group" >
                                   <b>이메일 : </b><input class="form-control"  name="email" type="text" id="emailinput">
                                   <p></p>
                                   <button type="submit" id="btn_email">인증번호받기</button>
                                </div>
                                <div class="form-group" >
                                   <b>인증번호 : </b><input class="form-control"  name="emailnum" type="text" id="emailnuminput">
                                </div>
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <div align="center">
                                <button type="button" id="btn">확인</button>
                                <button type="reset" id="btn_cancel" onclick="cancel()">취소</button>
                                
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