<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../login/Main.jsp" %>
<%@include file="../login/Sidebar.jsp" %>

<style>

.pagination li{
   list-style: none;
   display:inline-block; 
}

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


<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
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
<center>
<form action="#" method="get">
	<table border="1"
				style="border-collapse: collapse; line-height: 30px;"
				width="900px">
				<tr><td align="center" class="border2" colspan="6" height="110px" align="center">업무 공유</td></tr>
				<tr>
				<td height="50px"><input type="button" value="글쓰기" id="newBtn" class="button2"></td>
				<td align="right" colspan="5">
				    <select name="searchType">
				    <option value="no" <c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
				    <option value="n" <c:out value="${cri.searchType eq 'n' ?'selected':''}"/>>글번호</option>
				    <option value="t" <c:out value="${cri.searchType eq 't' ?'selected':''}"/>>제목</option>
				    <option value="w" <c:out value="${cri.searchType eq 'w' ?'selected':''}"/>>작성자</option>
				    </select>
				    <input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
				    <button id="searchBtn" type="button">검색</button>
					
				</td>
				</tr>
		<tr height="35px"  bgcolor="#dae6f4">
			<th width="50px" >번호</th>
			<th width="150px">분류</th>
			<th width="350px">제목</th>
			<th width="50px"></th>
			<th width="150px">작성자</th>
			<th width="150px">작성일</th>
		</tr>
		
		<c:forEach items="${list}" var="ShareTaskVO">
		<tr>
			<td align="center">${ShareTaskVO.bno}</td>
			<td align="center">
			<select name="category" style=" width:110px; height:25px" disabled="disabled">
			<c:if test="${ShareTaskVO.category=='업무관련'}">
			<option value="업무관련" selected="selected">업무관련</option>
			</c:if>
			<c:if test="${ShareTaskVO.category!='업무관련'}">
			<option value="업무관련">업무관련</option>
			</c:if>
			<c:if test="${ShareTaskVO.category=='회의관련'}">
			<option value="회의관련" selected="selected">회의관련</option>
			</c:if>
			<c:if test="${ShareTaskVO.category!='회의관련'}">
			<option value="회의관련">회의관련</option>
			</c:if>
			<c:if test="${ShareTaskVO.category=='기타'}">
			<option value="기타" selected="selected">기타</option>
			</c:if>
			<c:if test="${ShareTaskVO.category!='기타'}">
			<option value="기타">기타</option>
			</c:if>
			</select>
			</td>
			<td><a href='/useful/sharetask/detail${pageMaker.makeQuery(pageMaker.cri.page) }&bno=${ShareTaskVO.bno}&deptno=${ShareTaskVO.deptno}'>${ShareTaskVO.title}</a></td>
			<td align="right">
		첨부가 되어있는지 표시-이미지사용/글
			</td>
			<td align="center">${ShareTaskVO.ename}</td>
			<td align="center"><fmt:formatDate pattern="yyyy.MM.dd HH:mm"
										value="${ShareTaskVO.regdate}" /></td>
		</tr>
		
		</c:forEach>
    
    
    <tr><td colspan="6" align="center">
    <ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="share_Board?${pageMaker.startPage - 1}">◀</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li	<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="share_Board?page=${idx}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="share_Board?${pageMaker.endPage +1}">▶</a></li>
							</c:if>

						</ul>
    </td>
    </tr>
	</table>
	
	<input type="hidden" name="deptno" value="${ShareTaskVO.deptno}" >
	<input type="hidden" name="prevbno" value="${prevbno.bno }">
</form>	
	
	
</center>
</body>
</html>