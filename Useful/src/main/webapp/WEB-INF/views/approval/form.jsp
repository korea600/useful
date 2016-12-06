<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 결재문서 작성</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<style type="text/css">
tr{height: 30px}
</style>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script type="text/javascript">
	$(function(){
		$('[name=insert]').click(function(){
			show_signer();
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
				var str='--- 결재선 정보입니다. ---\n';
				for(var i=0;i<result.length;i++){
					str+=result[i].ename+" "+result[i].position+"\n";
				}
				str+='-----------------------\n';
			 	str+='\n결재문서 등록을 진행하시겠습니까?';
				if(confirm(str)){
					$('[name=frm]').submit();
				};
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
		}
		else{
			$('[name=receiver]').hide();
			$('[name=receiver]').empty();
			$('[name=receiver]').append("<option value='0'></option>");
		}
	}
</script>
</head>
<body>
<!-- <form name='frm' method="post" > -->
<form name='frm' method="post" enctype='multipart/form-data'>
<div id='page-wrapper'>
	<table border='1' width='30%'>
	<tr>
		<td align='center'>발신자</td>
		<td>
			<input type='text' name='writer_name' size='65' value='${LoginUser.ename}' readonly>
			<input type='hidden' name='writer' size='65' value='${LoginUser.empno}'>
		</td>
	</tr>
	<tr>
	<td align='center'>수신처</td>
		<td>
			<select id='target_select' onchange="show_receiver_select()">
				<option value='inner'>내부결재</option>
				<option value='outer'>타부서</option>
				<option value='all'>전체부서</option>
			</select>
			<select name='receiver' style="display: none;">
				<option value='${LoginUser.deptno}'>
			</select>
		</td>
	</tr>
	<tr><td align='center'>제목</td><td><input type='text' name='title' size='65'></td></tr>
	<tr><td colspan="2"  align='center'><textarea name='content' cols="60" rows="20"></textarea></td></tr>
	<tr><td align='center'>첨부파일</td><td><input type="file" name='file' size='55'></td></tr>
	<tr><td colspan="2" align='center'>
		<input type='button' name='insert' value='작성'>
		<input type='button' name='cancel' value='취소' onclick='history.back()'>
	</td></tr>
	</table>
</div>
</form>
</body>
</html>