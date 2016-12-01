<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>

<!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript">

	function Infocheck(){

		if($.trim($("#empnoinput").val()) == ""){
			alert("사원번호를 입력해 주세요.");
			$("#empnoinput").focus();
		}else if($.trim($("#nameinput").val()) == ""){
			alert("이름를 입력해 주세요.");
			$("#nameinput").focus();
		}else if($.trim($("#emailinput").val()) == ""){
			alert("이메일을 입력해 주세요.");
			$("#emailinput").focus();
		}
		
		$.ajax({
			type:'post',
			async:true,
			url:'/useful/login/check',
			data:{
				empno : $("#empnoinput").val(),
				ename : $("#nameinput").val(),
				email : $("#emailinput").val()
			},
			success:function(result){
				if(result=='SUCCESS'){
					alert('임시 비밀번호가 발송되었습니다. \n'
  			  		+'임시 비밀번호로 다시 로그인 해주세요.' );
					location.href="/useful";
				}else if(result=='FAIL'){
					alert("입력하신 정보가 일치하지 않습니다.");
					$("#empnoinput").val("");
					$("#nameinput").val("");
					$("#emailinput").val("");
					$("#empnoinput").focus();
					
				}
			}
			
		});
		
	}

	function cancel(){
			location.href="/useful/login/Login";
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

</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
               
                    <div class="panel-body">
                        <form name="frm" id="frm" method="post" action="/useful/email/send"> 
                        	<div>
                        		<input type="hidden" name="empno" value="${LoginUser.empno }">
                        	</div>
								<div class="panel-heading">
                      			  	<h3 class="panel-title" align="center">비밀번호 찾기</h3>
                   				 </div>
                                <div class="form-group" >
                                   <b>사원번호 : </b><input class="form-control"  name="emp" type="text" id="empnoinput">
                                </div>
                                <div class="form-group" >
                                   <b>이름 : </b><input class="form-control"  name="name" type="text" id="nameinput">
                                </div>
                                <div class="form-group" >
                                   <b>이메일 : </b><input class="form-control"  name="email" type="text" id="emailinput">
                                </div>
                              
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <div align="center">
                                <button type="button" id="btn" onclick="Infocheck()">확인</button>
                                <button type="reset" id="btn_cancel" onclick="cancel()">취소</button>
                                
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