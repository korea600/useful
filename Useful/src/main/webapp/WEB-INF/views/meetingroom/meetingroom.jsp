<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
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

html{
  width:100%;
  height:100%;
  
}
#rooms {
   margin:0 auto;
   text-align: center;
   background-color: orange;
    border: 2px solid #000;
    width: 100%;
    
}

form{
  background-color: yellow;
}

.room {
  float:left;
  width:100px;
  height:150px;
  border: 2px solid #333;
  margin: 20px;
}

</style>


<script>




var insertWin;
//회의실 입력창
 function input(){
 	
  insertWin=window.open('room_Input','input','toolbar=no,location=no,status=no'
 			+'menubar=no,scrollbars=no,resizable=0,width=400,height=500');
  
 }
 
 
 //부모창 리로드
 function reloadWin(){
 	 location.reload();
 	 insertWin.close();
 }
 
 
 //삭제를 눌렀을 경우 --->각 폼만 삭제
 function remove(roomno){
      alert(roomno);
      self.location="/useful/meetingroom/removeroom?roomno="+roomno;
	}



 $(document).ready(function(){
		
		$(".changeOK").hide();		

	});

 //수정버튼 눌렀을 경우 
		function change(num){
		alert('change');
		  $('#a'+num).show();
		  $('#b'+num).hide();
		  
		  
		  $('.a'+num).attr("readonly", false);
		  $('.a'+num).css('border','1px solid gray');
		  $('.a'+num+':first').focus();
		  //$('.a'+num+':first').parent().att('href','#'); 
		 // alert($('.room>a').attr('href'));
		  $('.room > a').attr('href','#');
		//alert($('.a'+num+':first').parent());
		//$('#c'+num).submit();
	}
		
	


</script>

</head>

<body>
<div id='page-wrapper'>
	<div class='row'>
		<div class="col-lg-12">
			<h1 class="page-header">사내 일정	</h1>
		</div>
	</div>
<div class="form-group">
<input type="button" onclick="input()" value="등록" >
<br>
  <div id="rooms">
   <c:forEach items="${list}" var="MeetingRoomVO" >
     <form id="c${MeetingRoomVO.roomno}" action="/useful/meetingroom/roomchange" method="post" >
     <div class="room">
     <a href="/useful/meetingroom/bookingList?roomno=${MeetingRoomVO.roomno }">
                  <input type="text" class="a${MeetingRoomVO.roomno}" name="roomname" readonly="readonly" value="${MeetingRoomVO.roomname }" style="width:90px;  border:0; cursor:pointer; text-align: center;"></a>
               <p><input type="text" class="a${MeetingRoomVO.roomno}" name="roomno" readonly="readonly"  value="${MeetingRoomVO.roomno}" style="width:90px; border:0; text-align: center;"></p>
               <p><input type="submit" id="a${MeetingRoomVO.roomno}" class="changeOK" value="확인"></p>
               <p><input type="button" id="b${MeetingRoomVO.roomno}" onclick="change(${MeetingRoomVO.roomno})" value="수정" ></p>
               <p><input type="button" value="삭제" onclick="remove(${MeetingRoomVO.roomno})"></p>
                <input type="hidden" name="serial" value="${MeetingRoomVO.serial }"> 
     </div>
     </form>
   </c:forEach>
  </div>
</div>
</div>



</body>
</html> 