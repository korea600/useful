<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출력</title>
</head>
<body>
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<th width="15%">부서명</th>
		<th width="15%">사원명</th>
		<th width="14%">출근일자</th>
		<th width="15%">출근시간</th>
		<th width="14%">퇴근일자</th>
		<th width="15%">퇴근시간</th>
		<th width="25%">구분</th>
	</tr>
	
	<c:forEach items="${commute }" var="commute">
		<tr>
			<td>${commute.dname }</td>
			<td>${commute.ename }</td>
			<td>${commute.login }</td>
			<td>${commute.login_time }</td>
			<td>${commute.logout }</td>
			<td>${commute.logout_time }</td>
			<td>${commute.checked }</td>
		</tr>
	</c:forEach>
	
	</table>
</body>
</html>