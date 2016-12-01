<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<!-- Bootstrap Core CSS -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../resources/vendor/bootstrap/css/button.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="../resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="../resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<%@include file="../login/Main.jsp" %>
<%@include file="../login/Sidebar.jsp" %>

		<div id="page-wrapper" style="height: 100%;">
			<div class="row" style="height: 100%;">
				<div class="col-lg-12">
					<h1 class="page-header">쪽지함</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>


			<form>
			<div class="col-lg-6" style="width: 100%;">
				<div class="panel panel-default">
					<div class="panel-heading">${LoginUser.ename}님 안녕하세요~!!</div>
						<div class="list_number">
						
									<!-- 검색버튼 -->
									 <div class="panel-footer">
                            <div class="input-group" >
                            
                            
                              <select id="searchType" name="searchType" class="form-control" style="width: 15%;height: 30px;">
                                                    <option selected="selected" value="n" <c:out value="${cri.searchType=='n'?'selected':'' }"/> >검색어 선택</option>
                                                    <option value="t"<c:out value="${cri.searchType=='sendman'?'selected':'' }"/> >보낸사람</option>
                                                    <option value="c" <c:out value="${cri.searchType=='sendcontent'?'selected':'' }"/>>내용</option>
                                                </select>
                                <input name="keyword" value="${cri.keyword }" id="btn-input" type="text" class="form-control input-sm" placeholder="검색어를 입력해주세요.." style="height: 30px;width: 85%;size: 30;"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-warning btn-sm" id="searchBtn"  style="height: 30px;">
                                        검색
                                    </button>
                                </span>
                            </div>
									<!-- 검색버튼 -->
					<!-- /.panel-heading -->
					
					<div class="panel-body">
					
						<div class="table-responsive">
							<table class="table" width="100%">
							
								<thead>
									<tr>
										<th>받는사람</th>
										<th>내용</th>
										<th>보낸날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="sendVO">
										<tr>
											<%-- <td><a href="/useful/board/readPage${pageMaker.serach(pageMaker.cri.page) }&serial=${BoardVO.serial}">${BoardVO.title }</a></td> --%>

											<td>${sendVO.sendman }</td>
											<td>${sendVO.sendcontent }</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:MM" value="${sendVO.senddate }"/></td>
											
										</tr>
									</c:forEach>
									
									
								</tbody>

							</table>
						
									
									
									<!-- 페이지번호 -->
										<div>
											<p>
											<div class="list_n_menu">
											<c:if test="${pageMaker.prev }">
											<span><a href="/useful/board/listPage${pageMaker.serach(pageMaker.startPage -1) }">이전</a></span>
											
											</c:if>
												
												<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
												<span <c:out value="${pageMaker.cri.page==idx?'class=active':'' }"/>>
												<a href="/useful/board/listPage${pageMaker.query(idx) }">${idx }</a>
												</span>
												</c:forEach>
												
													<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<span><a href="/useful/board/listPage${pageMaker.serach(pageMaker.endPage +1)}">다음</a></span>
											</c:if>
											</div>
											</p>
										</div>
									</div>
									<!-- 페이지번호 -->
						</div>
						
						  <input type='hidden' name="page" value='${pageMaker.cri.page}'>
                          <input type='hidden' name="perPageNum" value='${pageMaker.cri.perPageNum}'>
						
						</form>
						<button class="btn btn-default" id="register">글쓰기</button>
						
						<!-- /.table-responsive -->
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-6 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

	</div>

	<div id="page-wrapper" style="height: 100%;">
		<div class="row" style="height: 100%;">
			<div class="col-lg-12"></div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="../resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="../resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script
		src="../resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
$(document).ready(function(){
	$("#register").on("click",function(event){
		event.preventDefault();
		self.location="/useful/board/createPage";
	});
	$("#searchBtn").on("click",function(event){
		event.preventDefault();
		self.location="listPage"+
		'${pageMaker.query(1)}'+
		"&searchType="+
		$("select option:selected").val()+
		"&keyword=" + $('#btn-input').val();
	});
	
});
</script>

</body>
</html>