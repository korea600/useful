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
<script type="text/javascript" src='/useful/resources/js/jquery-3.1.1.js'></script>
<script type="text/javascript">
	alert(${LoginUser.empno});
	alert(${LoginUser.deptno});
	function show_receiver_select(){
		var target=$('[name=target_select]').val();
		if(target=='outer')
			$('[name=receiver]').show();
		else
			$('[name=receiver]').hide();
	}
</script>
</head>
<body>
<center>
<form>
<table border='1' width='35%'>
<tr><td width='20%'>발신자</td><td><input type='text' name='writer_name' size='80'></td></tr>
<tr>
<td width='20%'>수신처</td>
	<td>
		<select name='target_select' onchange="show_receiver_select()">
			<option value='inner'>내부결재</option>
			<option value='outer'>타부서</option>
			<option value='all'>전체부서</option>
		</select>
		<select name='receiver' style="display: none;">
			<option value='10'>잘했조</option>
			<option value='20'>보여조</option>
			<option value='30'>강조</option>
			<option value='40'>삼삼오오조</option>
		</select>
	</td>
</tr>
<tr><td width='20%'>제목</td><td><input type='text' name='title' size='80'></td></tr>
<tr><td colspan="2"><textarea name='content' cols="65" rows="20"></textarea></td></tr>
<tr><td width='20%'>첨부파일</td><td><input type="file" name='addfile' size='63'></td></tr>
</table>
<input type='button' name='insert' value='작성'>
<input type='button' name='cancel' value='취소'>
</form>
</center>
</body>
</html>