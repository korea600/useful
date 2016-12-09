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

<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>

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
	<header><%@include file="/WEB-INF/views/manager/Main.jsp"%></header>
	<div>
		<jsp:include page="/WEB-INF/views/manager/Sidebar.jsp"></jsp:include>
	</div>
<div id="page-wrapper" style="height: 100%;">
            <div class="row" style="height: 100%; width:100%;">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           업무 공유 게시판
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                            <form method="get">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
				<td><input type="button" value="글쓰기" id="newBtn" class="button2"></td>
				<td colspan="5">
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
                                        <tr>
                                            <th width="50px" >번호</th>
			                                <th width="150px">분류</th>
			                                <th width="350px">제목</th>
			                                    <th width="50px"></th>
			                                <th width="150px">작성자</th>
			                                <th width="150px">작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list}" var="ShareTaskVO">
                                        <tr>
                                            <td>${ShareTaskVO.bno}</td>
                                            <td>${ShareTaskVO.category}</td>
                                            <td><a href='/useful/sharetask/detail${pageMaker.makeQuery(pageMaker.cri.page) }&bno=${ShareTaskVO.bno}&deptno=${ShareTaskVO.deptno}'>${ShareTaskVO.title}</a></td>
                                            <td>첨부 ok</td>
                                            <td>${ShareTaskVO.ename}</td>
                                            <td><fmt:formatDate pattern="yyyy.MM.dd HH:mm"
										value="${ShareTaskVO.regdate}" /></td>
                                        </tr>
                                        </c:forEach>
                                       
                                    </tbody>
                                </table>
                                <input type="hidden" name="deptno" value="${LoginUser.empno}" >
	                            <input type="hidden" name="prevbno" value="${prevbno.bno }">
                               
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
                               </form>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                </div>
          </div>


</body>
</html>