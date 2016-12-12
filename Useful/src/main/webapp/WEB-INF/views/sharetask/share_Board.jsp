<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업무공유게시판</title>
<%@include file="../login/Main.jsp" %>
<%@include file="../login/Sidebar.jsp" %>

<style>
th{text-align: center}
td{text-align: center}



</style>

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


<script>
	$(document).ready(
			function() {

				$('#newBtn').on("click", function(e) {
					self.location = "share_Input";
				});
				
				$('#searchBtn').on("click", function(e){
					self.location = "share_Board"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + $('#keywordInput').val();

			    });
			});
</script>

</head>
<body>
<div id='page-wrapper'>
	<div class='row'>
		<div class="col-lg-12">
			<h1 class="page-header">업무 공유 게시판</h1>
		</div>
	</div>
	<div class='row'>
		<div class='col-lg-12'>
			<div class='panel panel-default'>
				<div class='panel-heading'>
                                    <select name="searchType" class='form-control-static'>
				    <option value="no" <c:out value="${cri.searchType == null?'selected':''}"/>>선택</option>
				    <option value="n" <c:out value="${cri.searchType eq 'n' ?'selected':''}"/>>글번호</option>
				    <option value="t" <c:out value="${cri.searchType eq 't' ?'selected':''}"/>>제목</option>
				    <option value="w" <c:out value="${cri.searchType eq 'w' ?'selected':''}"/>>작성자</option>
				    </select>
					
					<input type='text' name='keyword' class='form-control-static' id="keywordInput" value="${cri.keyword }" style="width:15%;" >
					<input type='button' id='searchBtn' value='검색' class='btn btn-warning'>
					<input type="button" class="btn btn-default" id="newBtn" value="글쓰기" style="width: 5%; float: right;">
				</div>
				<div class='panel-body'>
					<div class='table-responsive'>
						<table class='table table-striped table-bordered table-hover'>
							<tr><th>문서번호</th>
                                                            <th>분류</th>
                                                            <th>제목</th>
                                                            <th></th>
                                                            <th>작성자</th>
                                                            <th>작성일자</th></tr>
						
							<c:forEach items="${list}" var='ShareTaskVO'>
								
                                                         <tr><td>${ShareTaskVO.bno}</td>
                                                             <td>${ShareTaskVO.category}</td>
                                                             <td><a href='/useful/sharetask/detail${pageMaker.makeQuery(pageMaker.cri.page) }&bno=${ShareTaskVO.bno}&deptno=${ShareTaskVO.deptno}'>${ShareTaskVO.title}</a></td>
                                                             <td>첨부 ok</td>
                                                             <td>${ShareTaskVO.ename}</td>
                                                             <td><fmt:formatDate pattern="yyyy.MM.dd HH:mm"
										value="${ShareTaskVO.regdate}" /></td>
                                                        </tr>
							</c:forEach>
							
						</table>
                                                              <input type="hidden" name="deptno" value="${LoginUser.empno}" >
	                                                      <input type="hidden" name="prevbno" value="${prevbno.bno }">
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class='row'>
		<div class='dataTables_paginate paging_simple_numbers' id='dataTables-example_paginate' style="text-align: center;">
			<ul class='pagination'>

				<c:if test="${pagemaker.prev}">
					<li class='paginate_button' id='dataTables-example_previous'><a href="share_Board?${pageMaker.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach begin='${pageMaker.startPage}' end="${pageMaker.endPage }" var='idx'>
                                        <c:if test="${pageMaker.cri.page==idx}"><li class='paginate_button active'><a href='#'>${idx}</a></li></c:if>
                                        <c:if test="${pageMaker.cri.page!=idx}"><li class='paginate_button'><a href="share_Board?page=${idx}">${idx}</a></li></c:if>
                             	</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
					<li class='paginate_button' id='dataTables-example_next'><a href="share_Board?${pageMaker.endPage +1}">다음</a></li>
				</c:if>				
			</ul>
		</div>
	</div>
</div>
<div id="page-wrapper"></div>
</body>
</html>