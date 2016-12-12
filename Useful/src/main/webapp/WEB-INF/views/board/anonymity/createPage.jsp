<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="../..resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../../resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../../resources/vendor/bootstrap/css/button.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../../resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="../../resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="../../resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../../resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../../resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
    
    
</head>
<body>
<body>

   	<%@include file="../../login/Main.jsp" %>
<%@include file="../../login/Sidebar.jsp" %>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시판 작성 하기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            작성페이지
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                   <form role="form" method="post" action="createPage" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label>글 제목</label>
                                            <input class="form-control" type="text" id="title" placeholder="글 제목을 입력해주세요" name="title">
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>게시글 비밀번호</label>
                                            <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="pass" id="pass">
                                        </div> 
										<div class="form-group">
                                            <label>글쓰기</label>
                                            <textarea id="content" class="form-control" rows="20" placeholder="내용을 입력해주세요" name="content"></textarea>
                                        </div>

                                        <div class="form-group">
                                        
                                        </div>
                                        <div class="form-group">
                                            <label>파일 올리기</label>
                                            <input type="file" id="file" name="file">
                                        </div>
                                        <input type="hidden" name="page" value="${pageMaker.cri.page }">
                                        <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }">
                                       
                                         <button type="submit" class="btn btn-default" id="submit">작성완료</button>
                                        <button type="reset" class="btn btn-default" id="reset">다시작성하기</button>
										<button type="button" class="btn btn-default" id="backPage">되돌아가기</button>
                                        </form>
										

</div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../../resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../../resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../../resources/dist/js/sb-admin-2.js"></script>
    <!-- 게시물 버튼 설정 -->
    <script>
    $(document).ready(function(){
    	var formsubmit=$("from[role='form']");
    	/* $("#submit").on("click",function(event){
    		event.preventDefault();
    		formsubmit.submit;
    	}); */
    	$("#backPage").on("click",function(){
    		history.back();
    	});
  /*   	$("#reset").on("click",function(event){
    		event.preventDefault();
    		formsubmit.reset;
    	}); */
    });
    </script>

</body>
</body>
</html>