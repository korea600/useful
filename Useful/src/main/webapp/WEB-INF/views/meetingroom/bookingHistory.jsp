<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
회의실 예약내역
  <form>
    <table border="1" cellspacing="0">
    <tr>
   <td> 
       <select name="searchType">
         <option value="n">--</option>
         <option value="x">승인요청</option>
         <option value="o">승인완료</option>
         <option value="d">날짜</option>
       </select>
    </td>
    </tr>
      <tr>
      <th>글번호</th>
      <th>회의실 이름</th>
      <th>작성자</th>
      <th>날짜</th>
      <th><a href="">대여시간</a></th>
      <th>확인</th>
      <th></th>
      </tr>
      <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td><input type="button" value="승인"><input type="button" value="승인취소"></td>    
      </tr>
    </table>
  </form>


</center>

</body>
</html>