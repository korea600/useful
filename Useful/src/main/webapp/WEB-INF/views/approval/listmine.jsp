<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 기안 문서</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<style type="text/css">
th{text-align: center; width: 150px}
td{text-align: center}
</style>
<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
</head>
<body>
<div class="col-lg-12">
	<h1 class="page-header" style="text-align: right;">내 기안 문서</h1>
</div>
<table align="right" style="margin-right: 10%" border="1">
<tr><th>문서번호</th><th>상태</th><th>작성자</th><th>수신처</th><th>제목</th><th>작성일자</th></tr>
<c:if test="${list.size()==0}">
<tr><td colspan="6">문서가 없습니다.</td></tr>
</c:if>
<c:if test="${list.size()>0}">
<c:forEach items="${list}" var='i'>
	<tr>
		<td>${i.no}</td><td>${i.status}</td><td>${i.writer_name}</td><td>${i.receiver_dname}</td><td><a href='/useful/approval/read/${i.no}'>${i.title}</a></td><td><fmt:formatDate value="${i.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
	</tr>
</c:forEach>
</c:if>
</table>
</body>
</html>