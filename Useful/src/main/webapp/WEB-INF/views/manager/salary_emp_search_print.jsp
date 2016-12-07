<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- salary_emp_search_print -->
<table>
	<tr>
		<th>사번</th>
		<th>이름</th>
		<th>부서</th>
		<th>직책</th>
	</tr>
	<c:forEach items="${commute }" var="print" >
		<tr>
			<td>${print.empno }</td>
			<td>${print.ename }</td>
			<td>${print.dname }</td>
			<td>${print.position }</td>

			<td><button id="btn_select" class="btn btn-default" onclick="call_select('${print.empno }', '${print.ename }','${print.dname }','${print.position }')">선택</button></td>
		</tr>
		</c:forEach>
</table>
</body>
</html>