<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결재문서 조회</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<script type="text/javascript" src='/useful/resources/js/jquery-3.1.1.js'></script>
<script type="text/javascript">
$(function(){
	var frm=$('form');
	$('[name=accept]').click(function(){
		frm.attr('action','/useful/approval/accept');
		frm.attr('method','post');
		frm.submit();
	});
	$('[name=reject]').click(function(){
		frm.attr('action','/useful/approval/reject');
		frm.attr('method','post');
		frm.submit();
	});
	$('[name=modify]').click(function(){
		location.href='';
	});
})
</script>
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
		<input type='hidden' name='no' value='${vo.no}'>
		<input type='hidden' name='next_approval' value='${vo.next_approval}'>
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
<c:if test="${vo.curr_approval eq vo.next_approval}">
	<c:if test="${vo.next_approval eq LoginUser.empno}">
		<input type='button' name='modify' value='수정'>
	</c:if>
</c:if>
<c:if test="${vo.next_approval eq LoginUser.empno}">
	<input type='button' name='accept' value='결재'>
	<input type='button' name='reject' value='반려'>
</c:if>
<input type='button' name='cancel' value='뒤로' onclick='history.back()'>
</form>
</center>
</body>
</html>