<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경</title>
	
</head>
<body>
	<center>
	<div>
	<h3> 초기 로그인을 환영합니다. <br> 앞으로 사용하실 비밀번호를 설정하여 주세요. <br>(8~15자리, 숫자+영문)</h3>
	<div>
	<form action="/useful/login/Encrypt" method="post">
	<div>
		비밀번호 : <input type="password" name="pass" id="pass" size="25">
	</div>
	<p></p>
	<div>
		<input type="button" value="확인"> 
	</div>
	</form>
	</div>
	</div>
	</center>
</body>
</html>