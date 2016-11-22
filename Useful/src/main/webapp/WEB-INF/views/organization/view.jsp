<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조직도</title>
<script type="text/javascript" src="/useful/resources/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(function(){
		$('.ename').click(function(){
			var id = $(this).attr('id');
			window.open('organization/'+id,'detail','toolbar=no,location=no,status=no'
					+'menubar=no,scrollbars=no,resizable=0,width=400,height=300,top=100,left=100');
		})
	});
</script>
</head>
<body>
<table border='1'><tr>
<c:forEach items="${dept}" var='i'>
<td>${i.dname}</td>
</c:forEach>
</tr></table>
<c:forEach items="${list}" var='i'>
	<table border='1'>
	<c:forEach items="${i}" var='j'>
	<tr><td class='ename' id='${j.empno}' style="cursor: pointer;">${j.ename}</td><td> ${j.position}</td></tr>
	</c:forEach>
	</table>
</c:forEach>

</body>
</html>