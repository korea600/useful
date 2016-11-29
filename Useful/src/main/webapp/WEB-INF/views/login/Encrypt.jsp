<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="enc" class="kr.co.useful.encrypt.LocalEncrypter" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<%
        String str = request.getParameter("pass");
        String encryptcode = enc.returnEncryptCode(str);       
    %>
    <h3> 입력받은 패스워드 Encrypt 처리결과 : <%= encryptcode %></h3>
    <hr>
    <%
        String decryptcode = enc.returnDecryptCode(encryptcode);
    %>
    <h3> Encrypt 된 문자열을 Decrypt 한 결과 : <%= decryptcode %></h3>
    <hr>
    <% response.sendRedirect("Mainview");%>
    
</body>
</html>