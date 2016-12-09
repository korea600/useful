<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문서에 대한 댓글 리스트</title>
<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<style type="text/css">
th,td{text-align: center}
</style>
</head>
<body>
<div class='row'>
	<div class='col-lg-12'>
		<div class='panel-body' align="center">
			<div class='table-responsive'>
				<table class='table table-striped table-bordered table-hover'>
					<tr><th>작성자</th><th>상태</th><th>내용</th><th>작성시간</th></tr>
					<c:forEach items="${list}" var="i">
						<tr><td>${i.writer_name}</td><td>${i.checked}</td><td>${i.comments}</td><td><fmt:formatDate value="${i.regdate}" pattern="yyyy-MM-dd HH:mm"/></td></tr>
					</c:forEach>
				</table>
			</div>
			<input type='button' class='btn btn-warning' name='close' value='닫기' onclick='self.close()'>
		</div>
	</div>
</div>

</body>
</html>