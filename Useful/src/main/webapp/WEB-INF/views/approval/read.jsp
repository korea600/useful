<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결재문서 조회</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
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
	var flag=false;
	function comment_list(){
		$.ajax({
			url:'/useful/approval/comment/count/${vo.no}',
			type:'POST',
			success:function(result){
				if(result>0){
					window.open('${pageContext.request.contextPath}/approval/comment/list/${vo.no}','list','toolbar=no,location=no,status=no'
							+'menubar=no,scrollbars=no,resizable=0,width=400,height=300,top=100,left=100');
				}
				else{
					if(flag) alert('현재 문서에 달린 코멘트가 없습니다.');
				}
				flag=true;
			}
		})
	}
	$(function(){
		comment_list();
	
		$('[name=approval]').click(function(){
			window.open('${pageContext.request.contextPath}/approval/comment/form','add_comment','toolbar=no,location=no,status=no'
					+'menubar=no,scrollbars=no,resizable=0,width=400,height=300,top=100,left=100');
		})
		$('[name=modify]').click(function(){
			location.href='${pageContext.request.contextPath}/approval/modify?no='+${vo.no}
		});
	})
</script>
</head>
<body>
<div id='page-wrapper'>
	<form id='frm' method="post" action='${pageContext.request.contextPath}/approval/do_approval'>
	<input type='hidden' name='writer' size='80' value='${vo.writer}'>
	<input type='hidden' name='no' value='${vo.no}'>
	<input type='hidden' name='next_approval' value='${vo.next_approval}'>
	<div class='row' style="width: 80%">
	<div class='col-lg-6' style="width: 80%">
	<div class='panel panel-default'>
	<div class='panel-body'>
		<div class='table-responsive'>
		<table class='table table-striped table-bordered table-hover'>
		<tr>
			<td style="text-align: center;">발신자</td>
			<td><input type='text' class='form-control' name='writer_name' size='80' value='${vo.writer_name}' readonly></td>
		</tr>
		<tr>
			<td style="text-align: center;">발신부서</td>
			<td><input type='text' class='form-control' name='writer_dname' size='80' value='${vo.writer_dname}' readonly></td>
		</tr>
		<tr>
		<td style="text-align: center;">수신처</td>
			<td>
				<input type='text' class='form-control' name='receiver_name' size='80' value='${vo.receiver_dname }' readonly>
				<input type='hidden' name='receiver' value='${vo.receiver}'>
			</td>
		</tr>
		<tr><td style="text-align: center;">제목</td><td><input type='text' class='form-control' name='title' size='80' value="${vo.title}" readonly></td></tr>
		<tr><td colspan="2"><textarea class='form-control' name='content' cols="80" readonly rows="15">${vo.content}</textarea></td></tr>
		<tr>
			<td style="text-align: center;">첨부파일</td>
			<td>
				<c:if test="${vo.filename==null}">첨부된 파일이 없습니다.</c:if>
				<c:if test="${vo.filename!=null}"><a href='${pageContext.request.contextPath}/approval/filedownload?filename=${vo.filename}'>${vo.filename}</a></c:if>
			</td>
		</tr>
		</table>
		<c:if test="${vo.status eq '반려'}">
			<c:if test="${vo.writer eq LoginUser.empno}">
				<input type='button' class='btn btn-default' name='modify' value='수정/삭제'>
			</c:if>
		</c:if>
		<c:if test="${vo.next_approval eq LoginUser.empno}">
			<input type='button'  class='btn btn-default' name='approval' value='결재/반려'>
		</c:if>
			<div align="center">
			<input type='button'  class='btn btn-default' name='view_comments' value='코멘트 보기' onclick='comment_list()'>
			<input type='button'  class='btn btn-default' name='cancel' value='뒤로' onclick='history.back()'>
			</div>
		</div>
	</div></div></div></div>
	<input type='hidden' name='comments'>
	<input type='hidden' name='status'>
	</form>
</div>
</body>
</html>