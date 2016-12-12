<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내 예약목록</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
<style>

th{text-align: center;}
</style>

<script>

function contentCk(serial){
	contentWin=window.open('content_Check?serial='+serial,'input','toolbar=no,location=no,status=no'
 			+'menubar=no,scrollbars=no,resizable=0,width=400,height=500');
	
	
}

function deleteBooking(serial){
	location.href="/useful/meetingroom/deleteBooking?serial="+serial;
}

function changeType(){
  var checked=$("[name=searchType]").val();
  if(checked=='')alert('검색항목을 선택하세요');
  else{
	  
	  location.href="/useful/meetingroom/myBooking?checked="+checked;
  
  }
  
   
}


</script>
</head>
<body>
 <div id='page-wrapper'>
	<div class='row'>
		<div class="col-lg-12">
			<h1 class="page-header">내 예약목록</h1>
		</div>
	</div>
  <div class='panel-body'>
  <div class='table-responsive'>
  <div class="form-group" style="text-align:center;">	
    <form>
  <table class='table table-striped table-bordered table-hover'  border="1" cellspacing="0">
    <tr>
   <td colspan="7" align="right"> 
       <select name="searchType" class='form-control-static' style="width:80px;">
         <option value="">선택</option>
         <option value="승인">승인</option>
         <option value="대기">대기</option>
         <option value="거절">거절</option>
       </select>
       <input type="button" value="검색" class='btn btn-warning' id="searchBtn" onclick="changeType()">
    </td>
    </tr>
      <tr>
      <th>글번호</th>
      <th>회의실</th>
      <th>작성자</th>
      <th>날짜</th>
      <th>대여시간</th>
      <th>상태</th>
      <th></th>
      </tr>
      
      <c:forEach items="${list }" var="MeetingVO">
      <tr>
      <td>${MeetingVO.serial}<input type="hidden" name="content" value="${MeetingVO.content }"></td>
      <td>${MeetingVO.roomno}</td>
      <td onclick="contentCk(${MeetingVO.serial})"><font style="text-decoration: underline; color:blue; cursor:pointer;">${MeetingVO.booker}</font>(${MeetingVO.empno })</td>
      <td>${MeetingVO.beginday}</td>
      <td>${MeetingVO.begin}~${MeetingVO.end }시</td>
      <td>${MeetingVO.checked }</td>  
      <td><input type="button" value="삭제" class='btn btn-danger' onclick="deleteBooking(${MeetingVO.serial})"></td>
      </tr>
      </c:forEach>
      
        <tr><td colspan="7" align="center">
   <ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="bookingList?${pageMaker.startPage - 1}">◀</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li	<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="bookingList?page=${idx}&roomno=${integer}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="bookingList?${pageMaker.endPage +1}">▶</a></li>
							</c:if>

						</ul>
    </td>
    </tr>
    </table>
  </form>
  </div>
  </div>
</div>
</div>

</body>
</html>