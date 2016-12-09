<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
 <div class="panel-heading">
</div>

     <div class="panel-body">
     
     <div class="table-responsive">
     <table class="table table-striped table-bordered table-hover"  style="width: 100%;text-align: center;">
     <thead>
	<tr>
		<th width="20%" style="text-align: center;">부서</th>
		<th width="20%" style="text-align: center;">사원</th>
		<th width="10%" style="text-align: center;">출근</th>
		<th width="10%" style="text-align: center;">지각</th>
		<th width="10%" style="text-align: center;">결근</th> 	
		<th width="10%" style="text-align: center;">휴가</th>
		<th width="10%" style="text-align: center;">출장</th>
		<th width="10%" style="text-align: center;">조퇴</th>
	</tr>
</thead>
 <tbody>
<c:forEach items="${commute }" var="print" >
		<tr>
			<td>${print.dname }</td>
			<td>${print.ename }</td>
			<td>${print.attendance }</td>
			<td>${print.late }</td>
			<td>${print.absence }</td>
			<td>${print.vacation }</td>
			<td>${print.businessTrip }</td>
			<td>${print.earlyLeave }</td>
		</tr>
		</c:forEach>
 </tbody>
</table>
</div>
</div>
</body>
</html>
