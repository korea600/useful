<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->

	
<script>


function create(){
	alert('클릭');
	 $.ajax({
		 url:'/useful/meetingroom/makeroom',
		 type:'post',
		 data:{
			 roomname:$('[name=roomname]').val(),
			 roomno:$('[name=roomno]').val(),

		 },
		 success:function(){
			 alert("등록되었습니다.");
			 opener.reloadWin();
			
		 }    		 
	 });
 	 
}


 function clean(){
	 self.close();
 }
 

</script>

</head>
<body>

<center>
회의실 등록
  <form id="booking" action="">
    <table border="1" cellspacing="0">
      <tr><td>이름</td><td><input type="text" name="roomname"></td></tr>
      <tr><td>장소</td><td><input type="text" name="roomno" >호</td></tr>    
    </table>    

  <input type="button" value="등록" onclick="create()">
  <input type="button" value="닫기" onclick="clean()"> 
    </form>
</center>

</body>
</html>