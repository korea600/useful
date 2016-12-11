<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>올바르지 않은 접근입니다.</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
<script type="text/javascript">
	alert('올바르지 않은 접근입니다. 이전 페이지로 이동하겠습니다.');
	history.back();
</script>
</head>
<body>

</body>
</html>