<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;" class="table table-striped table-bordered table-hover">
	<tr>
		<th width="15%" style="text-align: center;">부서명</th>
		<th width="12%" style="text-align: center;">사원명</th>
		<th width="20%" style="text-align: center;">출근일자</th>
		<th width="15%" style="text-align: center;">출근시간</th>
		<th width="20%" style="text-align: center;">퇴근일자</th>
		<th width="15%" style="text-align: center;">퇴근시간</th>
		<th width="10%" style="text-align: center;">구분</th>
	</tr>

		<c:forEach items="${commute }" var="print" >
		<tr>
			<td style="text-align: center;">${print.dname }</td>
			<td style="text-align: center;">${print.ename }</td>
			<td style="text-align: center;">${print.login }</td>
			<td style="text-align: center;">${print.login_Time }</td>
			<td style="text-align: center;">${print.logout }</td>
			<td style="text-align: center;">${print.logout_Time }</td>
			<td style="text-align: center;">${print.checked }</td>
		</tr>
		</c:forEach>


		</table>
</body>
</html>