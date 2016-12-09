<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결재/반려 문서에 코멘트 달기</title>
<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<style type="text/css">
th,td{text-align: center}
</style>
<script type="text/javascript" src='${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js'></script>
<script type="text/javascript">
	$(function(){
		$('[name=accept]').click(function(){
			if(confirm('결재를 진행하시겠습니까?')){
				$(opener.document).find('[name=comments]').val($('[name=comments]').val());
				$(opener.document).find('[name=status]').val('accept');
				$(opener.document).find('#frm').submit();
				self.close();
			}
		})
		$('[name=reject]').click(function(){
			var msg=$('[name=comments]').val();
			if(msg!=''){
				if(confirm('반려를 진행하시겠습니까?')){
					$(opener.document).find('[name=comments]').val($('[name=comments]').val());
					$(opener.document).find('[name=status]').val('reject');
					$(opener.document).find('#frm').submit();
					self.close();
				}
			}
			else{
				alert("반려시에는 코멘트가 반드시 작성되어야 합니다.");
			}
		})
	})
</script>
</head>
<body>
<div class='row' style="width: 400px">
	<div class='col-lg-12'>
		<div class='panel-body' align='center'>
			<textarea name='comments' rows="4" cols="50" class='form-control'></textarea><br>
			<input type='button' name='accept' class='btn btn-warning' value='결재'>
			<input type='button' name='reject' class='btn btn-warning' value='반려'>
			<input type='button' name='add_comment' class='btn btn-warning'  value='취소' onclick='self.close()'>
		</div>
	</div>
</div>
</body>
</html>