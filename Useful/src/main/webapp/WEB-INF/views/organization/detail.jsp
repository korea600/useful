<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세정보</title>
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
		<div class='panel-body' align='center'>
			<div class='table-responsive'>
				<table class='table table-striped table-bordered table-hover'>
					<tr><th>사원명</th><td>${detail.ename}</td></tr>
					<tr><th>부서</th><td>${detail.dname}</td></tr>
					<tr><th>직책</th><td>${detail.position}</td></tr>
					<tr><th>연락처</th><td>${detail.phone}</td></tr>
					<tr><th>주소</th><td>${detail.address}</td></tr>
					<tr><th>이메일</th><td>${detail.email}</td></tr>
				</table>
			</div>
			<input type='button' class='btn btn-default' value='닫기' onclick="self.close()">
		</div>
	</div>
</div>

</body>
</html>