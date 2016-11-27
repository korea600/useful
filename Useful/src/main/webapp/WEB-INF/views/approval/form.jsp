<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src='/useful/resources/js/jquery-3.1.1.js'></script>
<script type="text/javascript">
	$(function(){
		$('[name=insert]').click(function(){
/* 			$('[name=writer_name]').val('${LoginUser.empno}'); */
			$('form').submit();
		})	
	})
	function show_signer(){
		var receiver=$('[name=receiver]').val();
		var writer='${LoginUser.empno}';
		$.ajax({
			data:{
				empno:writer,
				deptno:receiver
			},
			url:'/useful/approval/getLine',
			type:'POST',
			success:function(result){
				var str='';
				for(var i=0;i<result.length;i++){
					str+="empno : "+result[i].empno+", ename : "+result[i].ename+", position : "+result[i].position+"\n";
				}
				alert(str);
			}
		})
	}
	function show_receiver_select(){
		var target=$('#target_select').val();
		if(target=='outer'){
			$.ajax({
				data:{
					deptno:"${LoginUser.deptno}"
				},
				url:'/useful/approval/getDept',
				type:'POST',
				success:function(result){
					var str='';
					for(var i=0;i<result.length;i++){
						str+="<option value="+result[i].deptno+">"+result[i].dname+"</option>";
					}
					$('[name=receiver]').empty();
					$('[name=receiver]').append(str);
					$('[name=receiver]').show();		
				}
			})
		}
		else if(target=='inner'){
			$('[name=receiver]').hide();
			$('[name=receiver]').empty();
			$('[name=receiver]').append("<option value="+${LoginUser.deptno}+"></option>");
			show_signer();
		}
		else{
			$('[name=receiver]').hide();
			$('[name=receiver]').empty();
			$('[name=receiver]').append("<option value='0'></option>");
			show_signer();
		}
	}
</script>
</head>
<body>
<center>
<form method="post">
<table border='1' width='35%'>
<tr>
	<td width='20%' align='center'>발신자</td>
	<td>
		<input type='text' name='writer_name' size='80' value='${LoginUser.ename}' readonly>
		<input type='hidden' name='writer' size='80' value='${LoginUser.empno}'>
	</td>
</tr>
<tr>
<td width='20%' align='center'>수신처</td>
	<td>
		<select id='target_select' onchange="show_receiver_select()">
			<option value='inner'>내부결재</option>
			<option value='outer'>타부서</option>
			<option value='all'>전체부서</option>
		</select>
		<select name='receiver' style="display: none;" onchange='show_signer()'>
			<option value='${LoginUser.deptno}'>
		</select>
	</td>
</tr>
<tr><td width='20%' align='center'>제목</td><td><input type='text' name='title' size='80'></td></tr>
<tr><td colspan="2"  align='center'><textarea name='content' cols="65" rows="20"></textarea></td></tr>
<tr><td width='20%' align='center'>첨부파일</td><td><input type="file" name='addfile' size='63'></td></tr>
<tr></tr>
</table>
<input type='button' name='insert' value='작성'>
<input type='button' name='cancel' value='취소'>
</form>
</center>
</body>
</html>