<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UsefulWare</title>
	<script type="text/javascript">
		
	</script>



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
                <a class="navbar-brand" href="Mainview">Useful Logo</a>
            </div>
            <!-- /.navbar-header -->

   <!-- 메인에 오른쪽 위 상단 (메일링서비스 할 부분) -->
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a data-toggle="dropdown" href="#">
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
							</c:forEach><li><a class="text-center" href="/useful/note/noteMyPage"> 
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
                        <li><a href="../mypage/Pass_Check?empno=${LoginUser.empno }"><i class="fa fa-user fa-fw"></i> Mypage</a>
                        </li>
                         <li>
                            <a href="../organization/view">
                                <div>
                                    <i class="fa fa-sitemap fa-fw"></i> 조직도
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="/useful/mypage/proof_Of_emp">
                                <div>
                                    <i class="fa fa-file-o fa-fw"></i> 재직증명서
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

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
                            <a href="#"><i class="fa fa-users fa-fw"></i> 인사관리<span class="fa arrow"></span></a>
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
                                   <a href="/useful/manager/employee_List">연차관리</a>
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
                            <a href="#"><i class="fa fa-calendar fa-fw"></i> 일정관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">회사일정관리</a>
                                </li>
                                <li>
                                    <a href="buttons.html">부서별일정관리</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-calendar-o fa-fw"></i> 회의실예약<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">예약하기</a>
                                </li>
                                <li>
                                    <a href="#">예약내역</a>
                                </li>
                                
                                    </ul>
                                    <!-- /.nav-third-level -->
                               </li>
                        
                         <li>
                            <a href="#"><i class="fa fa-sort fa-fw"></i> 출퇴근내역조회<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">출근내역조회</a>
                                </li>
                                <li>
                                    <a href="#">퇴근내역조회</a>
                                </li>
                                <li>
                                   <a href="/useful/commute/Login_Commute">출퇴근관리</a>
                                </li>
                                
                                    </ul>
                                    <!-- /.nav-third-level -->
                               </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

      <!-- 메인 바디부분 -->
      
        <div id="page-wrapper">
        	<%@include file="../login/Body_Main.jsp" %>
          <div id=""></div>
           
			                              
				<!-- footer  -->
                        <div class="">
                            <div class="">
                             
                            </div>
                        </div>
                        <!-- /.panel-footer -->

                       
                

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#commute_in').on("click",function(){
				
				$.ajax({
					type:'post',
					async:true,
					url:'/useful/commute/Commute_In?empno='+${LoginUser.empno},
					success:function(result){
						if(result == 'SUCCESS'){
							alert('정상적으로 출근처리 되었습니다.');
						}else if(result == 'FAIL'){
							alert('이미 출근처리 되었습니다.');
						}
					}
				});
			});
			
			$('#commute_out').on("click",function(){
				$.ajax({
					type:'post',
					async:true,
					url:'/useful/commute/Commute_Out?empno='+${LoginUser.empno},
					success:function(result){
						if(result == 'SUCCESS'){
						alert('정상적으로 퇴근처리 되었습니다.');
						location.href="/useful/login/Logout";
						}else if(result == 'FAIL'){
							alert('먼저 출근체크를 해주세요.');
						}
					}
				});
			});
			
			$('#note').on("click",function(){
				location.href="/useful/note/noteMyPage";
			});
			
		});
		
	
	</script>
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