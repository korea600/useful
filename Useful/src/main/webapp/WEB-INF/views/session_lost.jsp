<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERROR</title>
<script type="text/javascript">
	window.onload=function(){
		setTimeout("go_to_login()", 3000);
	};
	function go_to_login(){
		location.href='${pageContext.request.contextPath}'
	}
</script>
</head>
<body>
<h1>세션이 종료되어 3초뒤 로그인 페이지로 이동합니다.. ㅠㅠ</h1>
</body>
</html>