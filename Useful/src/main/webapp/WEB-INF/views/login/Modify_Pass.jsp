<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경</title>
	
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
               
                    <div class="panel-body">
                        <form name="form" id="form" action="/useful/login/Encrypt" method="post">
                        	<div>
                        		<input type="hidden" name="empno" value="${LoginUser.empno }">
                        	</div>
								<div class="panel-heading">
                      			  	<h3 class="panel-title" align="center">초기 로그인을 환영합니다.  <br>
                      			  		앞으로 사용할 비밀번호를 설정해주세요. <br> 
                      			  		(8~15자리, 영문+숫자조합)</h3>
                   				 </div>
                                <div class="form-group" >
                                   <b>Password : </b><input class="form-control"  name="pass" type="password" id="pass">
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
</body>
</html>