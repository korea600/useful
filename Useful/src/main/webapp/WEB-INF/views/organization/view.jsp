<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조직도</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
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
<script type="text/javascript">
	$(function(){
		$('.empno').click(function(){
			var id = $(this).attr('id');
			window.open('detail/'+id,'detail','toolbar=no,location=no,status=no,'
					+'menubar=no,scrollbars=no,resizable=0,width=400,height=300,top=100,left=100');
		})
	});
</script>

</head>
<body>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">조직도</h1>
		</div>
	</div>
	<div class='row'>
		<div class="col-lg-12">
			<div class='panel panel-default'>
				<div class='panel-heading' style="height: 50px">
					<c:forEach items="${dept}" var='i'>
						<div class='dept' style="float: left; width: 25%; text-align: center;"><h4>${i.dname}</h4></div>
					</c:forEach>
				</div>
				<div class='panel-body'>	
					<c:forEach items="${list}" var='i'>
						<div class='emp' style="float: left; width:25%; text-align: center;">
							<c:forEach items="${i}" var='j'>
								<span class='empno' id='${j.empno}' style="cursor: pointer; text-align: center; width: 55%;">${j.ename}</span><span class='position' style="text-align: center; width: 45%;"> ${j.position}</span><br>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>			
	</div>
</div>
</body>
</html>