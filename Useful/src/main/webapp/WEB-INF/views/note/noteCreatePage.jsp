<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<body>

  <%@include file="../login/Main.jsp" %>
<%@include file="../login/Sidebar.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">쪽지보내기</h1>
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
                                    <form method="post" action="noteCreatePage">
                                        <div class="form-group">
                                            <label>받는사람</label>  <button type="button" class="fa fa-user" id="userfind" style="width: 40px;height: 20px;"></button>
                                            <input class="form-control" type="text" id="sendman" name="sendman" readonly="readonly"></input>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>보내는사람</label>
                                            <input type="text" id="mynote" class="form-control" value="${LoginUser.ename }" name="mynote" readonly="readonly">
                                        </div>
										<div class="form-group">
                                            <label>쪽지내용</label>
                                            <textarea id="sendcontent" class="form-control" rows="3" placeholder="내용을 입력해주세요" name="sendcontent"></textarea>
                                        </div>

                                        <div class="form-group">
                                        
                                        </div>
                                        <input type="hidden" name="page" value="${pageMaker.cri.page }">
                                        <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }">
                                       
                                         <button type="submit" class="btn btn-default" id="submit">보내기</button>
                                        <button type="reset" class="btn btn-default" id="reset">다시 쓰기</button>
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
    <script src="../resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/dist/js/sb-admin-2.js"></script>
    <!-- 게시물 버튼 설정 -->
    <script>
    $(document).ready(function(){
    	
    	$("#backPage").on("click",function(){
    		history.back();
    	});
    	
    	
     	function openNewWindow(url) {
  		  var name = 'finduserPage';
  		  var specs = 'toolbar=no,location=no,status=no'
				+'menubar=no,scrollbars=no,resizable=0,width=800,height=300,top=100,left=100';
  		  var newWindow = window.open(url, name, specs);
  		  newWindow.focus();
  		}

  		
  		$("#userfind").on("click",function(){
  			//alert("눌림")
  			openNewWindow('finduserPage');
  			
  		});
    
    });
    function getReturnValue(result) {
		  //alert(result);
		  $("#sendman").val(result);
		}
 
    </script>

</body>
</body>
</html>