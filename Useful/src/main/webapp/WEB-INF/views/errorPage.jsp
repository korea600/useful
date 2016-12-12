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
<div style="margin-top:10%; width:100%;height:100%;text-align: center;vertical-align: middle;">
<img src="${pageContext.request.contextPath}/resources/error.gif"><br>
<h2>오류가 발생하여 로그인 페이지로 이동합니다. ㅠㅠ</h2>
</div>
</body>
</html>