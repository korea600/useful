<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UsefulWare</title>

    <!-- Bootstrap Core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../resources/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">

@media (min-width: 768px) {
  .sidebar {
    z-index: 1;
    position: absolute;
    width: 250px;
    margin-top: 0;
  }
</style>
</head>
<body>
  <div id="wrapper">
      <!-- 왼쪽 사이드바 쪽  -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <div>
                           <div>
                              <center><span><i class="fa fa-user fa-fw"></i>[${LoginUser.position }] ${LoginUser.ename}님 안녕하세요~!!</span></center> 
                           </div>
                           <p></p>
                           <div>
                           <center>
                           <span>
                              <button type="button" id="note">  <i class="fa fa-envelope fa-fw"></i>메일함</button>
                              <button type="button" id="commute_in"><i class="fa fa-sort-up fa-fw"></i>출근</button>
                              <button type="button" id="commute_out"><i class="fa fa-sort-down fa-fw"></i>퇴근</button>
                           </span>
                           </center>
                           </div>
                           <p></p>
                           <div>
                           		<span><i class="fa fa-clock-o fa-fw"></i>최근접속 : <fmt:formatDate value="${LoginUser.regdate}" pattern="yyyy-MM-dd HH:mm"/> </span>
                           </div>
                        </div>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="index.html"><i class="fa fa-file-text fa-fw"></i> 전자결재 <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/useful/approval/form">기안하기</a>
                                </li>
                                <li>
                                    <a href="/useful/approval/liststatus">결재진행</a>
                                </li>
                                <li>
                                   <a href="/useful/approval/listdept">결재완료(수신)</a>
                                </li>
                                <li>
                                   <a href="/useful/approval/listmine">내 기안문서</a>
                                </li>
                                <li>
                                   <a href="/useful/approval/listmyturn">내 결재문서</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 인사관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                   <a href="/useful/manager/employee_List">사원정보관리</a>
                                </li>
                                <li>
                                   <a href="#">근태관리<span class="fa arrow"></span></a>
                                   <ul class="nav nav-third-level">
                                   	 	<li>
                                  			 <a href="/useful/manager/commute_Employee">사원별근태현황</a>
                              			</li>
                                   	 	<li>
                                  			 <a href="/useful/manager/commute_Dept">부서별근태집계</a>
                              			</li>
                                   	 	<li>
                                  			 <a href="/useful/manager/commute_Monthly">월별근태현황</a>
                              			</li>
                                   </ul>
                                </li>
                                <li>
                                    <a href="/useful/manager/salary_List">급여관리</a>
                                </li>
                                <li>
                                   <a href="/useful/manager/leave_List">연차관리</a>
                                </li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> 게시판<span class="fa arrow"></span></a>
                           <ul class="nav nav-second-level">
                           <li>
                              <a href="/useful/board/notice/listPage">공지게시판</a>
                           </li>
                           <li>
                              <a href="/useful/board/listPage">사내게시판</a>
                           </li>
                           
                           <li>
                              <a href="/useful/board/anonymity/listPage">익명게시판</a>
                           </li>
                           </ul>
                        </li>
                        
                        <li>
                            <a href="/useful/sharetask/share_Board"><i class="fa fa-list-alt fa-fw"></i> 업무공유</a>
                        </li>
                        <li>
                            <a href="/useful/schedule/co_Schedule"><i class="fa fa-calendar fa-fw"></i> 일정관리</a>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-calendar-o fa-fw"></i> 회의실예약<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/useful/meetingroom/meetingroom">예약하기</a>
                                </li>
                                <li>
                                    <a href="#">예약내역</a>
                                </li>
                                
                                    </ul>
                                    <!-- /.nav-third-level -->
                               </li>
                        
                         <li>
                            <a href="/useful/commute/Login_Commute"><i class="fa fa-sort fa-fw"></i> 출퇴근내역조회</a>
                                    <!-- /.nav-third-level -->
                         </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
            </div>
    
    <!-- /#wrapper -->

    <!-- jQuery -->

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../resources/vendor/raphael/raphael.min.js"></script>
    <script src="../resources/vendor/morrisjs/morris.min.js"></script>
    <script src="../resources/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/dist/js/sb-admin-2.js"></script>

</body>
</html>