<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 결재할 문서</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<style type="text/css">
th{text-align: center}
td{text-align: center}
</style>
<!-- jQuery -->
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
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script type="text/javascript">
	$(function(){
		var msg='${msg}';
		if(msg=='success')
			alert('처리가 완료되었습니다.')
	})
	function search(){
		var searchBy = 'writer_name';		// 작성자명 검색
		var keyword=$('[name=keyword]').val();
		if(keyword=='')
			alert('검색할 작성자명을 입력하세요.');
		else
			location.href='listmyturn${pagemaker.makeQuery(1)}&searchBy='+searchBy+'&keyword='+keyword;
	}
	</script>
</head>
<body>
<div id='page-wrapper'>
	<div class='row'>
		<div class="col-lg-12">
			<h1 class="page-header">내가 결재할 문서</h1>
		</div>
	</div>
	<div class='row'>
		<div class='col-lg-12'>
			<div class='panel panel-default'>
				<div class='panel-heading'>
					작성자 : <input type='text' name='keyword' class='form-control-static' style="width:15%">
					<input type='button' id='search' value='검색' class='btn btn-warning'  onclick='search()'>
				</div>
				<div class='panel-body'>
					<div class='table-responsive'>
						<table class='table table-striped table-bordered table-hover'>
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
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class='row'>
		<div class='dataTables_paginate paging_simple_numbers' id='dataTables-example_paginate' style="text-align: center;">
			<ul class='pagination'>
				<c:if test="${pagemaker.prev}">
					<li class='paginate_button' id='dataTables-example_previous'><a href="listmyturn${pagemaker.makeSearch(pagemaker.startPage-1)}">이전</a></li>
				</c:if>
				<c:forEach begin='${pagemaker.startPage}' end="${pagemaker.endPage }" var='i'>
					<c:if test="${pagemaker.cri.page==i}"><li class='paginate_button active'><a href='#'>${i}</a></li></c:if>
					<c:if test="${pagemaker.cri.page!=i}"><li class='paginate_button'><a href="listmyturn${pagemaker.makeSearch(i)}"> ${i} </a></li></c:if>
				</c:forEach>
				<c:if test="${pagemaker.next && pagemaker.endPage>0 }">
					<li class='paginate_button' id='dataTables-example_next'><a href="listmyturn${pagemaker.makeSearch(pagemaker.endPage+1)}">다음</a></li>
				</c:if>				
			</ul>
		</div>
	</div>
</div>
</body>
</html>