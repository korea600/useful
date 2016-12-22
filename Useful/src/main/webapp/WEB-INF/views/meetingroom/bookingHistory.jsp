<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약관리목록</title>
<%@include file="../login/Main.jsp" %>
<%@include file="../login/Sidebar.jsp" %>
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

function checkYes(serial){
	location.href="/useful/meetingroom/checkYes?serial="+serial;
}

function checkNo(serial){
	location.href="/useful/meetingroom/checkNo?serial="+serial;
}

function contentCk(serial){
	contentWin=window.open('content_Check?serial='+serial,'input','toolbar=no,location=no,status=no'
 			+'menubar=no,scrollbars=no,resizable=0,width=400,height=500');
	
	
}

function changeType(){
	  var checked=$("[name=searchType]").val();
	  
	 
		  location.href="/useful/meetingroom/bookingHistory?checked="+checked;
	  
	  
}

</script>



</head>
<body>
<div id='page-wrapper'>
	<div class='row'>
		<div class="col-lg-12">
			<h1 class="page-header">회의실 예약관리</h1>
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
         <option value="선택">선택</option>
         <option value="승인">승인</option>
         <option value="대기">대기</option>
         <option value="거절">거절</option>
       </select>
        <input type="button" value="검색" id="searchBtn"  class='btn btn-warning'  onclick="changeType()">
    </td>
    </tr>
      <tr>
      <th>글번호</th>
      <th>회의실</th>
      <th>작성자</th>
      <th>날짜</th>
      <th>대여시간</th>
      <th>상태</th>
      <th>확인</th>
      </tr>
      
      <c:forEach items="${list }" var="MeetingVO">
      <tr>
      <td>${MeetingVO.serial}<input type="hidden" name="content" value="${MeetingVO.content }"></td>
      <td>${MeetingVO.roomno}</td>
      <td onclick="contentCk(${MeetingVO.serial})"><font style="text-decoration: underline; color:blue; cursor:pointer;">${MeetingVO.booker}</font>(${MeetingVO.empno })</td>
      <td>${MeetingVO.beginday}</td>
      <td>${MeetingVO.begin}~${MeetingVO.end }시</td>
      <td>${MeetingVO.checked }</td>
      <td>
      
      <c:if test="${MeetingVO.checked =='대기' }">
      <input type="button" id="a${MeetingVO.serial }" onclick="checkYes(${MeetingVO.serial})" class='btn btn-info' value="승인">
      <input type="button" value="거절" onclick="checkNo(${MeetingVO.serial})" class='btn btn-danger' >
      
      </c:if>
       <c:if test="${MeetingVO.checked=='거절' }">
       <input type="button" id="a${MeetingVO.serial }" onclick="checkYes(${MeetingVO.serial})" class='btn btn-info' value="승인">
       </c:if>
       
       <c:if test="${MeetingVO.checked =='승인' }">
      <input type="button" id="b${MeetingVO.serial }" onclick=" checkNo(${MeetingVO.serial})" class='btn btn-danger' value="승인취소">
      </c:if>
      </td>    
     
      </tr>
      </c:forEach>
      
              <tr><td colspan="7" align="center">
                      <ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="bookingHistory${pageMaker.makeSearch(pageMaker.startPage - 1)}">◀</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li	<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="bookingHistory${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="bookingHistory${pageMaker.makeSearch(pageMaker.endPage +1)}">▶</a></li>
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