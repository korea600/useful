<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수신문서 리스트</title>
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
</head>
<script type="text/javascript">
	function selectSearchType(){
		var searchBy = $('[name=searchBy]').val();
		if(searchBy==''){
			$('[name=selectReceiver_name]').hide();
			$('[name=selectReceiver_name]').empty();
			$('[name=keyword]').hide();
			$('[name=keyword]').val('');
		}
		else if(searchBy=='receiver_name'){			// 수신부서 조회 (우리부서/전체부서)
			$('[name=selectReceiver_name]').empty();
			$('[name=selectReceiver_name]').append("<option value='${LoginUser.deptno}'>우리부서</option>"
											+"<option value='0'>전체부서</option>");
			$('[name=selectReceiver_name]').show();
			$('[name=keyword]').hide();
			$('[name=keyword]').val('');
		}
		else{										// 작성자별 조회
			$('[name=selectReceiver_name]').hide();
			$('[name=selectReceiver_name]').empty();
			$('[name=keyword]').val('');
			$('[name=keyword]').show();
			$('[name=keyword]').focus();
		}
	}
	function search(){
		var searchBy = $('[name=searchBy]').val();
		if(searchBy==''){						// 검색형식 미선택
			alert('검색형식을 선택해 주세요.');
			return;
		}
		else if(searchBy=='writer_name'){		// 작성자명 검색
			var keyword=$('[name=keyword]').val();
			if(keyword==''){
				alert('검색할 작성자명을 입력하세요.');
				return;
			}
		}
		else									// 수신부서 검색
			var keyword=$('[name=selectReceiver_name]').val();
		
		location.href='listdept${pagemaker.makeQuery(1)}&searchBy='+searchBy+'&keyword='+keyword;
	}
</script>
<body>
<div class="col-lg-12" style="margin-right: 10%">
	<h1 class="page-header" style="text-align: right;">수신 문서</h1>
</div>
<div align="right" style='margin-right: 10%'>
	<select name='searchBy' onchange="selectSearchType()">
		<option value=''>선택</option>
		<option value='receiver_name'>수신부서 </option>
		<option value='writer_name'>작성자</option>
	</select>
	<select name='selectReceiver_name' style="display: none;">
	</select>
	<input type='text' name='keyword' style="display: none;">
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
		<a href="listdept${pagemaker.makeSearch(pagemaker.startPage-1)}">이전</a>
	</c:if>
	<c:forEach begin='${pagemaker.startPage}' end="${pagemaker.endPage }" var='i'>
		<c:if test="${pagemaker.cri.page==i}"> ${i}</c:if>
		<c:if test="${pagemaker.cri.page!=i}">
			<a href="listdept${pagemaker.makeSearch(i)}"> ${i} </a>
		</c:if>
	</c:forEach>
	<c:if test="${pagemaker.next && pagemaker.endPage>0 }">
		<a href="listdept${pagemaker.makeSearch(pagemaker.endPage+1)}">다음</a>
	</c:if>
</td></tr>
</table>
</body>
</html>