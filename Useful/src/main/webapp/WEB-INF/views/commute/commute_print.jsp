<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<th width="15%">부서명</th>
		<th width="12%">사원명</th>
		<th width="20%">출근일자</th>
		<th width="15%">출근시간</th>
		<th width="20%">퇴근일자</th>
		<th width="15%">퇴근시간</th>
		<th width="10%">구분</th>
	</tr>

		<c:forEach items="${commute }" var="print" >
		<tr>
			<td>${print.dname }</td>
			<td>${print.ename }</td>
			<td>${print.login }</td>
			<td>${print.login_Time }</td>
			<td>${print.logout }</td>
			<td>${print.logout_Time }</td>
			<td>${print.checked }</td>
		</tr>
		</c:forEach>


		</table>
</body>
</html>