<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<font size="5" style="font-style: inherit;">일일 집계</font><br><hr>
<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px; width: 100%;">
	<tr>
		<th width="20%">부서</th>
		<th width="15%">사번</th>
		<th width="20%">사원명</th>
		<th width="15%">구분</th>
		<th width="15%">출근</th>
		<th width="15%">퇴근</th>
	</tr>
	<c:forEach items="${commute }" var="print" varStatus="status">
	<tr>
			<td>${print.dname }</td>
			<td>${print.empno }</td>
			<td>${print.ename }</td>
			<td>${print.checked }</td>
			<td>${print.login_Time }</td>
			<td>${print.logout_Time }</td>
	</tr>
		</c:forEach>
		</table>
</body>
</html>