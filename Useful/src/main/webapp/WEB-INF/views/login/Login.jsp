<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- Login.jsp --%>
<title>로 그 인</title>
</head>
<body>
	<div>
		<table>
			<caption>Login</caption>
			<tr>
				<td>I D</td>
				<td><input type="text" name="id" ></td> 
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="radio" name="member" value="직원">직원 <input type="radio" name="member" value="관리자">관리자</td> 
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="button" value="Login"> </td>
			</tr>
		</table>
	</div>
</body>
</html>