<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<table class="table table-striped table-bordered table-hover" style="text-align: center;">
		<tr>
			<th width="20%"  style="text-align: center;">부서명</th> 
			<th width="20%"  style="text-align: center;">사원명</th>
			<th width="10%"  style="text-align: center;">출근일자</th>
			<th width="10%"  style="text-align: center;">출근시간</th>
			<th width="10%"  style="text-align: center;">퇴근일자</th>
			<th width="10%"  style="text-align: center;">퇴근시간</th>
			<th width="10%"  style="text-align: center;">구분</th>
			<th width="10%"  style="text-align: center;">변경</th>
		</tr>
	
		<c:forEach items="${commute }" var="print" >
		<tr>
			<td>${print.dname }</td>
			<td>${print.ename }</td>
			<td>${print.login }</td>
			<td>${print.login_Time }</td>
			<td>${print.logout }</td>
			<td>${print.logout_Time }</td>
			<td>${print.checked }</td>
			<td><button id="btn_update" class="btn btn-default" onclick="call_Update('${print.dname }',
				'${print.ename }','${print.login }','${print.login_Time }','${print.logout }','${print.logout_Time }','${print.checked }','${print.serial }')">변경</button></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>