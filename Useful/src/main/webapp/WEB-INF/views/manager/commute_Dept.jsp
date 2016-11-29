<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부서별 근태집계</title>
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
		var now = new date();
		
		var month=now.getMonth();
		var year=now.getFullYear();
		$("#search_year").val(month).prop("selected", true);
		$("#search_month").val(year).prop("selected", true);
		
		searchDate();
		$("#btn_search").click(function(){
			searchDate();
		});
		
	});
	function searchDate(){
	 		  $.ajax({
	 			  type: 'POST',
	 			  url: '/useful/manager/employee_Dept',
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
	 					$("#div_print").innerHTML(result);
	 			  }
	 			});
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
<font size="5" style="font-style: inherit;">사원별 근태현황</font><br><hr>
<table>
		<tr>
			<th>부서</th>
			<td><select id="dept">
				<option value="" selected="selected">-- 선택 --</option>
				<option value="10">잘했조</option>
				<option value="20">보여조</option>
				<option value="30">강조</option>
				<option value="40">삼삼오오조</option>
			</select></td>
		</tr>
	</tbody>
</table>
<div><button id="btn_search">검색</button></div>
<a href='#' onclick="Common.getObj('cal_next_prev').value='prev';document.search_form.submit();" >
<img src='/useful/resources/image/paging_prev.gif'  alt='이전월' /></a>
					<select name="search_year" id="search_year" style='width:80px;' onChange='searchDate()'>
												<option value="2010" >2010</option>
												<option value="2011" >2011</option>
												<option value="2012" >2012</option>
												<option value="2013" >2013</option>
												<option value="2014" >2014</option>
												<option value="2015" >2015</option>
												<option value="2016" >2016</option>
												<option value="2017" >2017</option>
												<option value="2018" >2018</option>
											</select>
					<select name="search_month" id="search_month" onChange='searchDate()'>
						<option value="1">1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
						<option value="4">4월</option>
						<option value="5">5월</option>
						<option value="6">6월</option>
						<option value="7">7월</option>
						<option value="8">8월</option>
						<option value="09">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
					</select>
					<a href='#' onclick="Common.getObj('cal_next_prev').value='next';document.search_form.submit();">
					<img src='/useful/resources/image/paging_next.gif'  alt='다음월' /></a>
	<div id="div_print">
	<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<th width="20%">부서</th>
		<th width="20%">직급</th>
		<th width="10%">출근</th>
		<th width="10%">지각</th>
		<th width="10%">결근</th>
		<th width="10%">휴가</th>
		<th width="10%">출장</th>
		<th width="10%">조퇴</th>
	</tr>
			<tr>
			<td colspan="8">
			<b>데이터가 없습니다.</b>
			</td>
		</tr>
		</table>
	</div>
	
</div>
</body>
</html>