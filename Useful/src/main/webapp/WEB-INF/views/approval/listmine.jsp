<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 기안 문서</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<style type="text/css">
th{text-align: center; width: 150px}
td{text-align: center}
</style>
<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script type="text/javascript">
	function search(){
		var searchBy = 'status'					// 결재 진행상태별 검색
		var keyword=$('[name=searchBy]').val();
		if(keyword=='')
			alert('검색형식을 선택해 주세요.');
		else	
			location.href='listmine${pagemaker.makeQuery(1)}&searchBy='+searchBy+'&keyword='+keyword;
	}
	</script>
</head>
<body>
<div class="col-lg-12" style="margin-right: 10%">
	<h1 class="page-header" style="text-align: right;">내 기안 문서</h1>
</div>
<div align="right" style='margin-right: 10%'>
	<select name='searchBy'>
		<option value=''>선택</option>
		<option value='진행'>진행</option>
		<option value='완료'>완료</option>
		<option value='반려'>반려</option>
	</select>
	<input type='button' id='search' value='검색' onclick='search()'>
</div>
<table align="right" style="margin-right: 10%" border="1">
<tr><th>문서번호</th><th>상태</th><th>작성자</th><th>수신처</th><th>제목</th><th>작성일자</th></tr>
<c:if test="${list.size()==0}">
<tr><td colspan="6">문서가 없습니다.</td></tr>
</c:if>
<c:if test="${list.size()>0}">
<c:forEach items="${list}" var='i'>
	<tr>
		<td>${i.no}</td><td>${i.status}</td><td>${i.writer_name}</td><td>${i.receiver_dname}</td><td><a href='/useful/approval/read/${i.no}'>${i.title}</a></td><td><fmt:formatDate value="${i.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
	</tr>
</c:forEach>
</c:if>
<tr><td colspan="6" align="center">
	<c:if test="${pagemaker.prev}">
		<a href="listmine${pagemaker.makeSearch(pagemaker.startPage-1)}">이전</a>
	</c:if>
	<c:forEach begin='${pagemaker.startPage}' end="${pagemaker.endPage }" var='i'>
		<c:if test="${pagemaker.cri.page==i}"> ${i}</c:if>
		<c:if test="${pagemaker.cri.page!=i}">
			<a href="listmine${pagemaker.makeSearch(i)}"> ${i} </a>
		</c:if>
	</c:forEach>
	<c:if test="${pagemaker.next && pagemaker.endPage>0 }">
		<a href="listmine${pagemaker.makeSearch(pagemaker.endPage+1)}">다음</a>
	</c:if>
</td></tr>
</table>
</body>
</html>