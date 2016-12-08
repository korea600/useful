<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<body>
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px; width: 100%;">
	<tr>
		<th width="8%">사번</th>
		<th width="8%">사원명</th>
		<th width="8%">부서</th>
		<th width="8%">직급</th>
		<th width="10%">귀속월</th>
		<th width="10%">지급일</th>
		<th width="10%">기본급</th>
		<th width="10%">지급합계</th>
		<th width="10%">공제합계</th>
		<th width="10%">차인지급액</th>
		<th width="8%"></th>
	</tr>
	<c:forEach items="${salary }" var="print">
		<tr>
			<td>${print.empno }</td>
			<td>${print.ename }</td>
			<td>${print.dname }</td>
			<td>${print.position }</td>
			<td>${print.paymentmonth }</td>
			<td>${print.paymentdate }</td>
			<td>${print.basicpay }</td>
			<td>${print.grossincome }</td>
			<td>${print.deductions }</td>
			<td>${print.adjustedIncome }</td>
			<td><button id="btn_delete" class="btn btn-default" onclick="call_Delete('${print.empno }','${print.paymentmonth }')">삭제</button></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>