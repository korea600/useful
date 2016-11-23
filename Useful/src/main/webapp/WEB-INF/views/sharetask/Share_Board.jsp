<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
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
<form action="#" method="post">
	<table border="1"
				style="border-collapse: collapse; line-height: 30px;"
				width="900px">
				<tr><td align="center" class="border2" colspan="6" height="110px" align="center">업무 공유</td></tr>
				<tr>
				<td height="50px"><input type="submit" value="글쓰기" class="button2"></td>
				<td align="right" colspan="5">
				    <select name="serchType">
				    <option name="n">---</option>
				    <option name="no">글번호</option>
				    <option name="t">제목</option>
				    <option name="w">작성자</option>
				    </select>
				    <input type="text" name="keyword" id="keywordInput" value="">
				    <button id="serchBtn">검색</button>
					
				</td>
				</tr>
		<tr height="35px"  bgcolor="#dae6f4">
			<th width="50px" >번호</th>
			<th width="150px">분류</th>
			<th width="350px">제목</th>
			<th width="50px"></th>
			<th width="150px">작성자</th>
			<th width="150px">작성일</th>
		</tr>
		
		<tr>
			<td align="center">2</td>
			<td align="center">회의 관련/일정 관련/보고서 관련</td>
			<td>제목</td>
			<td align="right">
		첨부가 되어있는지 표시-이미지사용/글
			</td>
			<td align="center">안선영</td>
			<td align="center">2016-11-23</td>
		</tr>
			<tr>
			<td align="center">1</td>
			<td align="center">회의 관련/일정 관련/보고서 관련</td>
			<td><a href="#">제목</a></td>
			<td align="right">
		첨부가 되어있는지 표시-이미지사용/글
			</td>
			<td align="center">안선영</td>
			<td align="center">2016-11-23</td>
		</tr>
    <tr><td colspan="6" align="center"><a href="#">1</a> <a href="#">2</a> <a href="#">3</a></td></tr>
	</table>
</form>	
	
	
</center>
</body>
</html>