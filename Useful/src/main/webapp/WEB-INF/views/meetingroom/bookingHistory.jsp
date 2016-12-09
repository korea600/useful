<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>

function checkYes(serial){
	location.href="/useful/meetingroom/checkYes?serial="+serial;
}

function checkNo(serial){
	location.href="/useful/meetingroom/checkNo?serial="+serial;
}
</script>
</head>
<body>

<center>
회의실 예약내역-관리자
  <form>
    <table border="1" cellspacing="0">
    <tr>
   <td> 
       <select name="searchType">
         <option value="n">--</option>
         <option value="o">승인</option>
         <option value="w">대기</option>
         <option value="no">거절</option>
       </select>
    </td>
    </tr>
      <tr>
      <th>글번호</th>
      <th>회의실</th>
      <th>작성자</th>
      <th>날짜</th>
      <th><a href="">대여시간</a></th>
      <th>상태</th>
      <th>확인</th>
      </tr>
      
      <c:forEach items="${list }" var="MeetingVO">
      <tr>
      <td>${MeetingVO.serial}<input type="hidden" name="content" value="${MeetingVO.content }"></td>
      <td>${MeetingVO.roomno}</td>
      <td><a href="">${MeetingVO.booker}(${MeetingVO.empno })</a></td>
      <td>${MeetingVO.beginday}</td>
      <td>${MeetingVO.begin}~${MeetingVO.end }시</td>
      <td>${MeetingVO.checked }</td>
      <td><input type="button" id="a${MeetingVO.serial }" onclick="checkYes(${MeetingVO.serial})" value="승인"><input type="button" id="b${MeetingVO.serial }" onclick=" checkNo(${MeetingVO.serial})"  value="승인취소"></td>    
      </tr>
      </c:forEach>
    </table>
  </form>


</center>

</body>
</html>