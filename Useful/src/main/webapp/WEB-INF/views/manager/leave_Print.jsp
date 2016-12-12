<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table class="table table-striped table-bordered table-hover"  style="text-align: center; width: 100%;">
	<tr>
		<th width="10%" style="text-align: center;">부서</th>
		<th width="10%" style="text-align: center;">사번</th>
		<th width="20%" style="text-align: center;">사원명</th>
		<th width="20%" style="text-align: center;">입사일자</th>
		<th width="10%" style="text-align: center;">기본연차</th>
		<th width="10%" style="text-align: center;">사용연차</th>
		<th width="10%" style="text-align: center;">남은연차</th>
		<th width="10%" style="text-align: center;">변경</th>
	</tr>
	<c:forEach items="${commute }" var="print" varStatus="status">
	<tr>
		<td>${print.dname }</td>
		<td>${print.empno }</td>
		<td>${print.ename }</td>
		<td><fmt:formatDate value="${print.hiredate }" pattern="yyyy-MM-dd"/> </td>
		<td>${print.basic }</td>
		<td>${print.used }</td>
		<td>${print.rest }</td>
		<td><button class="btn btn-default"  onclick="update('${print.dname }','${print.empno }','${print.ename }','<fmt:formatDate value="${print.hiredate }" pattern="yyyy-MM-dd"/>','${print.basic }','${print.used }','${print.rest }')">변경</button></td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>