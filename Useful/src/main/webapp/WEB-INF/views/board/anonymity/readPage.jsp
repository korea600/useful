<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../resources/vendor/jquery/jquery.js"></script>
<link href="../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../../resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../../resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../../resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>
<body>
<body>

		<%@include file="../../login/Main.jsp" %>
<%@include file="../../login/Sidebar.jsp" %>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">게시판 보기</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">작성페이지</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<form role="form" method="post" action="createPage">
										<div class="form-group">
											<input type="hidden" name="serial" value="${board.serial }">
											<input type="hidden" name="searchType"
												value="${cri.searchType }"> <input type="hidden"
												name="keyword" value="${cri.keyword }"> <label>글
												제목</label> <input class="form-control" type="text" id="title"
												name="title" readonly="readonly" value="${board.title }">

										</div>
										<div class="form-group">
											<label>글쓴이</label> <input type="text" id="writer"
												class="form-control" placeholder="Enter text" name="writer"
												readonly="readonly" value="${board.writer }">
										</div>
										<div class="form-group">
											<label>글쓰기</label>
											<textarea id="content" class="form-control" rows="3"
												placeholder="내용을 입력해주세요" value="${board.content }"
												readonly="readonly" name="content"></textarea>
										</div>

										<div class="form-group"></div>

										<input type="hidden" name="page"
											value="${pageMaker.cri.page }"> <input type="hidden"
											name="perPageNum" value="${pageMaker.cri.perPageNum }">

										<button type="submit" class="btn btn-default" id="submit">작성완료</button>

										<button type="button" class="btn btn-default" id="backPage">되돌아가기</button>
									</form>


								</div>
								<!-- /.col-lg-12 -->
							</div>
							<!-- /.row -->

						</div>


						<!-- /#page-wrapper -->

					</div>

					<div id="page-wrapper" style="right: 17.6%; width: 100%;">
						<div class="row">
							<div class="col-lg-12">
								<h1 class="page-header">댓글 목록</h1>
							</div>
							<!-- /.col-lg-12 -->
						</div>
						<!-- /.row -->
						<div class="row">

							

										
										<!-- 댓글목록 -->
										<table>
										<core:forEach items="${list }" var="list">
							<div class="col-lg-4" style="width: 87%; right: 10px;">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                         <h5>${list.replyid } :<fmt:formatDate pattern="yyyy-MM-dd HH:MM" value="${list.regdate }"/> </h5>
                        </div>
                        <div class="panel-body">
                            <p>${list.replytext }</p>
                        </div>
                        <!-- div class="panel-footer">
                            버튼추가할지 아직몰라서 남김
                        </div> -->
                    </div>
                </div>
                
										</core:forEach>
										</table>
										<!-- 댓글목록 -->


										<!-- 댓글 입력란 -->
										
										<div class="input-group"
											style="height: 30px; width: 85%; size: 30; left: 10px;">

											<input name="keyword" id="btn-input" type="text"
												class="form-control input-sm" placeholder="댓글을 입력해주세요"
												style="height: 65px; " /> <span class="input-group-btn">
												<button type="submit" class="btn btn-warning btn-sm" id="replybtn"
													style="height: 65px; width: 100px;">
													<h3>입력</h3>
												</button>
											</span>
										</div>
									
									
									<!-- 댓글 입력란 -->


									<!-- <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
 
										

</div>
                /.col-lg-12
            </div>
            /.row
            
        </div> -->


									<!-- /#page-wrapper -->

								</div>
							</div>


								<!-- /#wrapper -->

								<!-- jQuery -->
								<script src="../resources/vendor/jquery/jquery.min.js"></script>

								<!-- Bootstrap Core JavaScript -->
								<script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

								<!-- Metis Menu Plugin JavaScript -->
								<script src="../resources/vendor/metisMenu/metisMenu.min.js"></script>

								<!-- Custom Theme JavaScript -->
								<script src="../resources/dist/js/sb-admin-2.js"></script>
								<!-- 게시물 버튼 설정 -->
								<script>
									$(document)
											.ready(
													function() {
														var formsubmit = $("from[role='form']");
														/* $("#submit").on("click",function(event){
															event.preventDefault();
															formsubmit.submit;
														}); */
														$("#backPage")
																.on(
																		"click",
																		function() {
																			history
																					.back();
																		});
														/*   	$("#reset").on("click",function(event){
														  		event.preventDefault();
														  		formsubmit.reset;
														  	}); */
														  
													});
								</script>
								<script type="text/javascript">
								$(document).ready(function(){
									$("#replybtn").on("click",function(){
										var replytext=$("#btn-input").val();
										var page=${".page"}
										var perPageNum=${".perPageNum"}
										var serial=${board.serial }
										
										
										$.ajax({
											type:'post',
											url:'/useful/board/replycreatePage'+replytext,
											dataType:'text',
											success:function(result){
												console.log("result:"+result);
												if(result=='success'){
													alert("등록완료");
													getPage("/useful/board/readPage?page="+page+"&perPageNum="+perPageNum+"&serial="+serial+")";
												}
											}
										})
										
									});
									
								});
								</script>
</body>
</body>
</html>