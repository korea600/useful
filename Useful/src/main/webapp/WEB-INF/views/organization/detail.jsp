<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세정보</title>
</head>
<body><center>
<table border='1'>
<tr><th width='100px' align="center">사원명</th><td align='center' width='200px'>${detail.ename}</td></tr>
<tr><th width='100px' align="center">부서</th><td align='center' width='200px'>${detail.dname}</td></tr>
<tr><th width='100px' align="center">직책</th><td align='center' width='200px'>${detail.position}</td></tr>
<tr><th width='100px' align="center">연락처</th><td align='center' width='200px'>${detail.phone}</td></tr>
<tr><th width='100px' align="center">주소</th><td align='center' width='200px'>${detail.address}</td></tr>
<tr><th width='100px' align="center">이메일</th><td align='center' width='200px'>${detail.email}</td></tr>
</table>
<input type='button' value='닫기' onclick="self.close()">
</center>
</body>
</html>