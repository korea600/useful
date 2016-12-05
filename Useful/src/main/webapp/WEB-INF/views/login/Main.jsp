<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UsefulWare</title>

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


 	<link rel="stylesheet" type="text/css" media="screen"
		href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" media="screen"
		href="${pageContext.request.contextPath}/resources/jqGrid/css/ui.jqgrid.css" /> 
	<link rel="stylesheet" type="text/css" media="screen"
		href="${pageContext.request.contextPath}/resources/jqGrid/plugins/ui.multiselect.css" />
	 <script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/jqGrid/js/i18n/grid.locale-en.js"></script> 
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery.jqGrid.min.js"></script> 
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/login/Mainview">Useful Logo</a>
            </div>
            <!-- /.navbar-header -->

   <!-- 메인에 오른쪽 위 상단 (메일링서비스 할 부분) -->
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <c:forEach items="${note }" var="note2">
							<div onclick="location.href='/useful/note/riciReadPage?serial=${note2.serial }'" style="cursor: pointer;">
								<b>${note2.reciid}</b> 
								<span class="pull-right text-muted">
									<em> <fmt:formatDate value="${note2.recipientdate }" pattern="yyyy-MM-dd" /></em>
								</span>
								<div>${note2.recontent }</div>
							</div>
								<li class="divider"></li>
							</c:forEach>
					<li><a class="text-center" href="/useful/note/noteMyPage"> 
					<strong>Read All Messages</strong> <i class="fa fa-angle-right"></i>
					</a></li></li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
               
               
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="${pageContext.request.contextPath}/mypage/Pass_Check?empno=${LoginUser.empno }"><i class="fa fa-user fa-fw"></i> Mypage</a>
                        </li>
                         <li>
                            <a href="${pageContext.request.contextPath}/organization/view">
                                <div>
                                    <i class="fa fa-sitemap fa-fw"></i> 조직도
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="/useful/login/Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

   
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>

</body>
</html>