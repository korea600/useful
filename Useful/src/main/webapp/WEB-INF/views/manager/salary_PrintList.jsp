<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<body>
	<table  class="table table-striped table-bordered table-hover" style="margin-top: 10px; width: 100%;">
	<tr>
		<th style="text-align: center;" width="8%">사번</th>
		<th style="text-align: center;" width="8%">사원명</th>
		<th style="text-align: center;" width="8%">부서</th>
		<th style="text-align: center;" width="8%">직급</th>
		<th style="text-align: center;" width="10%">귀속월</th>
		<th style="text-align: center;" width="10%">지급일</th>
		<th style="text-align: center;" width="10%">기본급</th>
		<th style="text-align: center;" width="10%">지급합계</th>
		<th style="text-align: center;" width="10%">공제합계</th>
		<th style="text-align: center;" width="10%">차인지급액</th>
		<th style="text-align: center;" width="8%"></th>
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
			<td><button id="btn_delete" class="btn btn-default" onclick="call_Delete(''${print.serial}')">삭제</button></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>