<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>월별근퇴현황</title>
<style type="text/css">
th {
	background-color: #CCC;
}
</style>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.11.0.min.js"></script> 
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>  
	
 <script type="text/javascript" 
	src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		var now = new Date();
		var month=now.getMonth()+1;
		var year=now.getFullYear();
		$("#search_year").val(year).prop("selected", true);
		$("#search_month").val(month).prop("selected", true);
		searchDate();
	});
	function searchDate(){
	 		  $.ajax({
	 			  type: 'POST',
	 			  url: '/useful/manager/commute_Monthly',
	 			  headers : {
	 				  "Content-Type" : "application/json",
	 				  "X-HTTP-Method-Override":"POST"
	 			  },
	 			  dataType: 'text',
	 			  data: JSON.stringify({
	 				dept:$("#dept option:selected").val(),
	 				year:$("#search_year option:selected").val(),
	 				month:$("#search_month option:selected").val()
	 				  }),
	 			  success: function(result){
	 					$("#div_print").html(result);
	 			  }
	 			});
	}
	function changeMonthprev(){
		var nowmonth =$("#search_month option:selected").val()
		if(nowmonth!=1){
		$("#search_month").val(nowmonth-1).prop("selected", true);
		}
	}
	function call_attendance(date){
	
	
		alert(date);
	}		
	function call_late(date){
		alert(date);
	
	}		
	function call_acc(date){
	
		alert(date);
	
	}		
</script>
</head>
<body>
 <header><%@include file="/WEB-INF/views/manager/Main.jsp"%></header> 
<div>
	<jsp:include page="/WEB-INF/views/manager/Sidebar.jsp"></jsp:include>  
</div>
<!-- commute_Dept.jsp -->
<div id="page-wrapper">
<br>
<font size="5" style="font-style: inherit;">월별 근태집계</font><br><hr>
<div>
<table style="width: 80%;border-color: black;">
		<tr>
			<th align="center">부서</th>
			<td><select id="dept" onChange='searchDate()'> 
				<option value="0" selected="selected">-- 선택 --</option>
				<option value="10">잘했조</option>
				<option value="20">보여조</option>
				<option value="30">강조</option>
				<option value="40">삼삼오오조</option>
			</select></td>
		</tr>
	</tbody>
</table>
<br>
</div>
<div>
<a href='#' onclick="changeMonthprev()" >
<img src='/useful/resources/image/paging_prev.gif'  alt='이전월' /></a>
					<select name="search_year" id="search_year" style='width:80px;' onChange='searchDate()'>
 												<%for(int i=2010;i<2019;i++){ %>
												<option value="<%=i%>" ><%=i%>년</option>
												<%} %> 
											</select>
					<select name="search_month" id="search_month" style='width:80px;' onChange='searchDate()'>
 						<%for(int i=1;i<13;i++){
 						if(i<10){%>
 						
						<option value="0<%=i%>"><%=i%>월</option>
						<%}else{ %>
						<option value="<%=i%>"><%=i%>월</option>
						<%} }%> 
					</select>
					<a href='#' onclick="changeMonthnext()">
					<img src='/useful/resources/image/paging_next.gif'  alt='다음월' /></a>
</div>
	<div id="div_print">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px; width: 100%;">
	<tr>
		<th width="14%">월</th>
		<th width="14%">화</th>
		<th width="14%">수</th>
		<th width="14%">목</th>
		<th width="14%">금</th>
		<th width="14%">토</th>
		<th width="14%">일</th>
	</tr>
			<tr>
			<td colspan="7">
			<b>데이터를 로딩중입니다...</b>
			</td>
		</tr>
		</table>
	</div>
	
</div>
</body>
</html>