<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결재/반려 문서에 코멘트 달기</title>
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
<center>
<textarea name='comments' rows="4" cols="50"></textarea><br>
<input type='button' name='accept' value='결재'>
<input type='button' name='reject' value='반려'>
<input type='button' name='add_comment' value='취소' onclick='self.close()'>
</center>
</body>
</html>