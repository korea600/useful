<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<th width="15%">부서명</th>
		<th width="15%">사원명</th>
		<th width="14%">출근일자</th>
		<th width="15%">출근시간</th>
		<th width="14%">퇴근일자</th>
		<th width="15%">퇴근시간</th>
		<th width="13%">구분</th>
		<th width="12%">변경</th>
	</tr>


		</table>
  ${model }
  ${model.list }
  ${list }
</body>
</html>