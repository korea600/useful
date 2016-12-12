<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회의 내용</title>
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
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
	
<script>


 function clean(){
	 self.close();
 }
 

</script>

</head>
<body>
<center>

  <div class="row" style="width:50%; margin-top: 50px; ">
                <div class="col-lg-4">
                    <div class="panel panel-info">
                        <div class="panel-heading" >
                            내용
                        </div>
                        <div class="panel-body" 	style="height:300px; overflow: auto;">
                            ${content }
                        </div>
                        <div class="panel-footer">
                            
                        </div>
                    </div>
                </div>
                </div>
                </center>
</body>
</html>