<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문서에 대한 댓글 리스트</title>
<style type="text/css">
td{text-align: center}
</style>
</head>
<body><center>
<table border='1'>
<tr><th width='150px'>작성자</th><th width='150px'>상태</th><th width='450px'>내용</th><th width='150px'>작성시간</th></tr>
<c:forEach items="${list}" var="i">
<tr><td>${i.writer_name}</td><td>${i.checked}</td><td>${i.comments}</td><td><fmt:formatDate value="${i.regdate}" pattern="yyyy-MM-dd HH:mm"/></td></tr>
</c:forEach>
</table>
<input type='button' name='close' value='닫기' onclick='self.close()'>
</center></body>
</html>