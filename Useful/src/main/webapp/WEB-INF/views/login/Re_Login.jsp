<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 발송 완료</title>
	<script type="text/javascript">
		function relogin(){
			location.href = "/useful/login/Login";
		}
	</script>
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
               
                    <div class="panel-body">
                        	<div class="panel-heading">
                      			  	<h3 class="panel-title" align="center">
                      			  		임시 비밀번호가 발송되었습니다. <br>
                      			  		임시 비밀번호로 다시 로그인 해주세요. 
                      			  	</h3>
                   				 </div>

                                <!-- Change this to a button or input when using this as a form -->
                                <div align="center">
                                <button type="button" id="btn" onclick="relogin()">확인</button>
                                </div>
						
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>