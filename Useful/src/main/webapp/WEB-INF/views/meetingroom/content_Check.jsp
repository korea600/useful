<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회의 내용</title>

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
내용
    <table border="1" cellspacing="0">
      <tr><td>${content }</td></tr>
         
    </table>    

  <input type="button" value="닫기" onclick="clean()"> 
    
</center>

</body>
</html>