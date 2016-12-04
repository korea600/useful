<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px; width: 100%;">
	<tr>
		<th width="14%">월</th>
		<th width="14%">화</th>
		<th width="14%">수</th>
		<th width="14%">목</th>
		<th width="14%">금</th>
		<th width="14%">토</th>
		<th width="14%">일</th>
	</tr>
<c:forEach items="${commute }" var="print" >
		<tr>
			<td>
				<img src="/useful/resources/image/icon_acc.gif" > ${print.commute }
				<img src="/useful/resources/image/icon_late.gif" > ${print.late }
				<img src="/useful/resources/image/icon_work.gif" > ${print.absence }+${print.vacation }+${print.businessTrip }+${print.earlyLeave }
				합계=			
			</td>
		</tr>
		</c:forEach>
		</table>
</body>
</html>
