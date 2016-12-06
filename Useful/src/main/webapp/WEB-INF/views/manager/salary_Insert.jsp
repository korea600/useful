<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>급여등록</title>
 <link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqGrid/css/ui.jqgrid.css" /> 
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqGrid/plugins/ui.multiselect.css" /> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/i18n/grid.locale-en.js"></script> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery.jqGrid.src.js"></script> 
<script type="text/javascript">
$(function(){	
 	   $( "#startdate" ).datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd'
 	   });
 	   $( "#enddate" ).datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd'
 	   });
});
</script> 
</head>
<body>
<header><%@include file="/WEB-INF/views/manager/Main.jsp"%></header> 
<div>
	<jsp:include page="/WEB-INF/views/manager/Sidebar.jsp"></jsp:include>  
</div>
	<div id="page-wrapper">
	<p>
		<font size="5" style="font-style: inherit;">급여등록</font>
		<input type="button" id="btn_search" value="조회" />
		<input type="button" id="btn_oneReg" value="급여개별등록" /> 
		<input type="button" id="btn_delete" value="삭제" />
	</p>
	<hr>
	<p>※사원정보</p>
	<table>
	 <tr>
	 	<td>사번</td>
	 	<td>사번</td>
	 	<td>사원명</td> 
	 	<td>사원명</td> 
	 </tr>
	</table>
	<p>※지급정보</p>
	<table>
	 <tr>
	 	<td>지급일</td>
	 	<td>지급일</td>
	 	<td>귀속월</td> 
	 	<td>귀속월</td> 
	 </tr>
	</table>
	<p>※금액정보</p>
	<table>
	 	<tr>
			<th colspan="2">수당</th>
			<th colspan="2">공제</th>
	 	</tr>
	 	<tr>
	 		<td>기본급</td>
	 		<td>기본급</td>
	 		<td>국민연금</td>
	 		<td>기본급</td>
	 	</tr>
	 	<tr>
	 		<td>차량유지비</td>
	 		<td>차량유지비</td>
	 		<td>건강보험</td>
	 		<td>건강보험</td>
	 	</tr>
	 	<tr>
	 		<td>식대보조금</td>
	 		<td>식대보조금</td>
	 		<td>고용보험</td>
	 		<td>고용보험</td>
	 	</tr>
	 	<tr>
	 		<td>보육수당</td>
	 		<td>보육수당</td>
	 		<td>장기요양보험</td>
	 		<td>장기요양보험</td>
	 	</tr>
	 	<tr>
	 		<td>기타수당</td>
	 		<td>기타수당</td>
	 		<td>소득세</td>
	 		<td>소득세</td>
	 	</tr>
	 	<tr>
	 		<td></td>
	 		<td></td>
	 		<td>지방소득세</td>
	 		<td>지방소득세</td>
	 	</tr>
	</table>
	<p>※합계</p>
	<table>
	<tr>
		<td>지급합계</td>
		<td>지급합계</td>
		<td>공제합계</td>
		<td>공제합계</td>
		<td>차인지급액</td>
		<td>차인지급액</td>
	</tr>
	</table>
</div>
</body>
</html>