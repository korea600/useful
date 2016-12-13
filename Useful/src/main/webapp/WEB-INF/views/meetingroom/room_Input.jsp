<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회의실 등록</title>
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


function create(){
	//alert('클릭');
			var roomname=$('[name=roomname]').val();
			var roomno=$('[name=roomno]').val();
			if(roomname=='')alert('이름을 입력해 주세요');
			else if(roomno=='')alert('호실을 입력해 주세요');
			else{
	 $.ajax({
		 url:'/useful/meetingroom/makeroom',
		 type:'post',
		 data:{
			 roomname:roomname,
			 roomno:roomno

		 },
		 success:function(){
			 alert("등록되었습니다.");
			 opener.reloadWin();
			
		 }    		 
	 });
			}
 	 
}


 function clean(){
	 self.close();
 }
 

</script>

</head>
<body>

<center>
<p style="margin-top: 30px;">회의실 등록</p>


  <form id="booking" action="">
    <table border="1" cellspacing="0">
      <tr><td bgcolor="#dae6f4" width="80px;" align="center">이름</td><td><input type="text" name="roomname"></td></tr>
      <tr><td bgcolor="#dae6f4" width="80px;" align="center">장소</td><td><input type="text" name="roomno" >호</td></tr>    
    </table>    
<br>
  <input type="button" class="btn btn-info" value="등록" onclick="create()">
  <input type="button" class="btn btn-danger" value="닫기" onclick="clean()"> 
    </form>
</center>

</body>
</html>