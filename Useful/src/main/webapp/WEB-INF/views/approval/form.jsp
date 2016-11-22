<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {text-align: center}
</style>
</head>
<body>
<center>
<table border='1' width='35%'>
<tr><td width='20%'>발신처</td><td><input type='text' name='sender' size='80'></td></tr>
<tr><td width='20%'>수신처</td><td><input type='text' name='receiver' size='80'></td></tr>
<tr><td width='20%'>제목</td><td><input type='text' name='title' size='80'></td></tr>
<tr><td colspan="2"><textarea name='content' cols="65" rows="20"></textarea></td></tr>
<tr><td width='20%'>첨부파일</td><td><input type="file" name='addfile' size='63'></td></tr>

</table>
<input type='button' name='insert' value='작성'>
<input type='button' name='cancel' value='취소'>
</center>
</body>
</html>