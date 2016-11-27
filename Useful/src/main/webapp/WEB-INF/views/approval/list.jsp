<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결재문서 리스트</title>
<%-- <%@include file="../login/Main.jsp" %>
<%@include file="../login/Sidebar.jsp" %> --%>
</head>
<body>
<table>
<tr><th>문서번호</th><th>상태</th><th>작성자</th><th>수신처</th><th>제목</th><th>작성일자</th></tr>
<!-- no, status, tbl_emp.ename writer_name, tbl_dept.dname receiver_name, title,tbl_approval.regdate -->
<c:forEach items="${list}" var='i'>
	<tr>
		<td>${i.no}</td><td>${i.status}</td><td>${i.writer_name}</td><td>${i.receiver_dname}</td><td>${i.title}</td><td>${i.regdate}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>