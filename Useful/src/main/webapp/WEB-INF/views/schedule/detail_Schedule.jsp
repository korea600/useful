<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

</style>

</head>

<body>
	<center>
	<h3>스케줄 입력</h3>
		<form action="#" method="post">
			<table border="1"
				style="border-collapse: collapse; line-height: 30px;">
		
				<tr>
					<td bgcolor="#dae6f4"  align="center" width="150px">작성자</td>
					<td align="center">sss</td>
				</tr>
			     <tr>
			        <td bgcolor="#dae6f4"  align="center" width="150px">실행자</td>
			        <td align="right">
			       모두
			        </td>
			    </tr> 
				<tr>
					<td bgcolor="#dae6f4" align="center" width="150px">제목</td>
					<td width="350px" style="padding: 0;">
					<input type="text" name="title" value="${Schedule.title }" style="width:350px; height: 30px; margin: 0; border: 0;"></td>

				</tr>
				<tr>
				<td bgcolor="#dae6f4" align="center">시작날짜</td>
				<td>${Schedule.start}</td></tr>
				<tr>
				<td  bgcolor="#dae6f4" align="center">마감날짜</td>
				<td>${Schedule.end}</td></tr>
				<tr>
				<td bgcolor="#dae6f4" align="center">시간</td>
				<td>
				${Schedule.time}
				 </td></tr>

				<tr>
					<td colspan="2" style="padding:0; width:500px;">
					<textarea name="contents" style="font-size:15px; width:500px; margin: 0; height:200px; border:0;">상세한 내용
					</textarea></td>
				</tr>
				
			</table>
			
			
		</form>
		<br>
		            <input type="button"  value="수정" /> 
		            <input type="button"  value="삭제" /> 
					<input type="button"  value="닫기" onclick="" />
	</center>
</body>
</html>