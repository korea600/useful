<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>  
			<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">일일 현황</h1>
                </div>
            </div>
<table class="table table-striped table-bordered table-hover" style="text-align: center;padding-top: 10px;padding-right: 30px;">
	<tr>
		<th width="20%" style="text-align: center;">부서</th>
		<th width="15%" style="text-align: center;">사번</th>
		<th width="20%" style="text-align: center;">사원명</th>
		<th width="15%" style="text-align: center;">구분</th>
		<th width="15%" style="text-align: center;">출근</th>
		<th width="15%" style="text-align: center;">퇴근</th>
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