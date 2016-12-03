<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px; width: 100%;">
	<tr>
		<th width="20%">부서2</th>
		<th width="20%">사원</th>
		<th width="10%">출근</th>
		<th width="10%">지각</th>
		<th width="10%">결근</th>
		<th width="10%">휴가</th>
		<th width="10%">출장</th>
		<th width="10%">조퇴</th>
	</tr>
<c:forEach items="${commute }" var="print" >
		<tr>
			<td>${print.dname }</td>
			<td>${print.ename }</td>
			<td>${print.attendance }</td>
			<td>${print.late }</td>
			<td>${print.absence }</td>
			<td>${print.vacation }</td>
			<td>${print.businessTrip }</td>
			<td>${print.earlyLeave }</td>
		</tr>
		</c:forEach>
		</table>
</body>
</html>
