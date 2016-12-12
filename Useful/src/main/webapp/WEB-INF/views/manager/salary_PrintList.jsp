<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE>
<html>
<body>
	<table  class="table table-striped table-bordered table-hover" style="margin-top: 10px; width: 100%;">
		<tr>
		<th width="7%">사번</th>
		<th width="8%">사원명</th>
		<th width="8%">부서</th>
		<th width="7%">직급</th>
		<th width="10%">귀속월</th>
		<th width="10%">지급일</th>
		<th width="9%">기본급</th>
		<th width="9%">지급합계</th>
		<th width="9%">공제합계</th>
		<th width="9%">차인지급액</th>
		<th width="7%"></th>
		<th width="7%"></th>
	</tr>
	<c:forEach items="${salary }" var="print">
		<tr>
			<td>${print.empno }</td>
			<td>${print.ename }</td>
			<td>${print.dname }</td>
			<td>${print.position }</td>
			<td><fmt:formatDate value="${print.paymentmonth }" pattern="yyyy-MM-dd"/></td>
			<td><fmt:formatDate value="${print.paymentdate }" pattern="yyyy-MM-dd"/></td>
			<td>${print.basicpay }원</td>
			<td>${print.grossincome }원</td>
			<td>${print.deductions }원</td>
			<td>${print.adjustedIncome }원</td>
			<td><button id="btn_Update" class="btn btn-default" onclick="call_Update('${print.serial}')">수정</button></td>
			<td><button id="btn_delete" class="btn btn-default" onclick="call_Delete('${print.serial}')">삭제</button></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>