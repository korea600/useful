<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결재문서 조회</title>
<%@include file="../login/Main.jsp" %>
<%@include file="../login/Sidebar.jsp" %>
<script type="text/javascript" src='/useful/resources/js/jquery-3.1.1.js'></script>
</head>
<body>
<center>
<form method="post">
<table border='1' width='35%'>
<tr>
	<td width='20%' align='center'>발신자</td>
	<td>
		<input type='text' name='writer_name' size='80' value='${vo.writer_name}' readonly>
		<input type='hidden' name='writer' size='80' value='${vo.writer}'>
		<input type='hidden' name='no' value=''>
	</td>
</tr>
<tr>
<td width='20%' align='center'>수신처</td>
	<td>
		<input type='text' name='receiver_name' value='${vo.receiver_dname }' readonly>
		<input type='hidden' name='receiver' value='${vo.receiver}'>
	</td>
</tr>
<tr><td width='20%' align='center'>제목</td><td><input type='text' name='title' size='80' value="${vo.title}" readonly></td></tr>
<tr><td colspan="2" align='center'><textarea name='content' cols="65" readonly rows="20">${vo.content}</textarea></td></tr>
<tr><td width='20%' align='center'>첨부파일</td><td><input type="file" name='addfile' size='63'></td></tr>
<tr></tr>
</table>
<input type='button' name='cancel' value='닫기'>
</form>
</center>
</body>
</html>