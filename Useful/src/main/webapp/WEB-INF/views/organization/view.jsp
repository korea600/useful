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
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../resources/vendor/bootstrap/css/button.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="../resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="../resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript" src="/useful/resources/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(function(){
		$('.empno').click(function(){
			var id = $(this).attr('id');
			window.open('detail/'+id,'detail','toolbar=no,location=no,status=no'
					+'menubar=no,scrollbars=no,resizable=0,width=400,height=300,top=100,left=100');
		})
	});
</script>

</head>
<body>
<div id="page-wrapper" style="height: 100%;">
	<div class="row" style="height: 100%;">
		<div class="col-lg-12">
			<h1 class="page-header">조직도</h1>
		</div>
	</div>
	<div class="col-lg-6" style="width: 100%;">
		<div class='deptlist'>
			<c:forEach items="${dept}" var='i'>
				<div class='dept' style="float: left; width: 25%; text-align: center;"><h4>${i.dname}</h4></div>
			</c:forEach>
		</div>
		<div class='emplist'>
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
</body>
</html>