<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지게시판 읽기</title>
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
	
	<script type="text/javascript">
var flag=true;
function modifyreply(){
	//alert("눌림");
	var rno=$("#hi-input").val();
	var replytext=$("#btn-input2").val();
	var serial=$("#serial").val();
	var page=$("#page").val();
	var perPageNum=$("#perPageNum").val();
	var keyword=$("#keyword").val();
	var searchType=$("#searchType").val(); 
	//alert("rno="+rno)
	 $.ajax({
		type:'post',
		url:'/useful/reply/notice/update',
		dataType:'text',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		data:JSON.stringify({replytext:replytext,rno:rno,serial:serial}),
		success:function(result){
			console.log("result:"+result);
			if(result=='SUCCESS'){
				self.location="readPage?page="+page+"&perPageNum="+perPageNum+"&keyword="+keyword+"&searchType="+searchType+"&serial="+serial+"";
			
				$(this).hide();
				flag=true;
			}
		}
	})

	
}
	$(function(){
		$("[name=modify]").on("click",function(){
			if(flag){
				var name=$(this).attr("id");
				$("#hi-input").val(name);
				//alert(name);
				var str="<div class='input-group' id='input-group'"
						+" style='height: 30px; width: 85%; size: 30; left: 10px; display: none;'>"
						+"<input name='keyword' id='btn-input2' type='text' value=''"
						+" class='form-control input-sm' placeholder='내용을 작성해주세요'"
						+" style='height: 65px; ' /> <span class='input-group-btn'>"
						+"<button type='button' class='btn btn-warning btn-sm' id='replybtn2' onclick=modifyreply()"
						+" style='height: 65px; width: 100px;'><h3>입력</h3></button></span></div>";
			  $(this).parent().append(str);
	          $("#input-group").show();
			  flag=false;
			}
		});//댓글 수정버튼
		/* $("#replybtn2").on("click",function(){}); */
		$("#replybtn").on("click",function(){
			var replytext=$("#btn-input").val();
			var serial=$("#serial").val();
			var page=$("#page").val();
			var perPageNum=$("#perPageNum").val();
			var keyword=$("#keyword").val();
			var searchType=$("#searchType").val();
			$.ajax({
				type:'post',
				url:'/useful/reply/notice/create',
				dataType:'text',
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"
				},
				data: JSON.stringify({serial:serial, replyid:"${LoginUser.empno}",replytext:replytext }),
				success:function(result){
					console.log("result:"+result);
					if(result=='SUCCESS'){
						self.location="readPage?page="+page+"&perPageNum="+perPageNum+"&keyword="+keyword+"&searchType="+searchType+"&serial="+serial+"";
						replytext.val("");
					}
				}
			}) 
		});
		$("#remove").on("click",function(){
			var replytext=$("#btn-input").val();
			var serial=$("#serial").val();
			var page=$("#page").val();
			var perPageNum=$("#perPageNum").val();
			var keyword=$("#keyword").val();
			var searchType=$("#searchType").val();
			var rno=$("#rno").val();
			$.ajax({
				type:'delete',
				url:'/useful/reply/notice/delete',
				datetype:'text',
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"delete"
				},
				data: JSON.stringify({serial:serial,rno:rno }),
				success:function(result){
					console.log("result:"+result);
					if(result=='SUCCESS'){
						self.location="readPage?page="+page+"&perPageNum="+perPageNum+"&keyword="+keyword+"&searchType="+searchType+"&serial="+serial+"";
						replytext.val("rno="+rno);
					}
				}
			})
		});
		
		$(document)
		.ready(
				function() {
					var formsubmit = $("from[role='form']");
					$("#backPage")
							.on(
									"click",
									function() {
										history
												.back();
									});
				
					  
				});
		$("#modifybt").on("click",function(){
			var serial=$("#serial").val();
			var page=$("#page").val();
			var perPageNum=$("#perPageNum").val();
			var keyword=$("#keyword").val();
			var searchType=$("#searchType").val();
			self.location="/useful/board/notice/modifyPage?page="+page+"&perPageNum="+perPageNum+"&keyword="+keyword+"&searchType="+searchType+"&serial="+serial+"";
		});
		
});
</script>
</head>
<body>
<%@include file="../../login/Main.jsp" %>
<%@include file="../../login/Sidebar.jsp" %>

		<!-- /.navbar-static-side --> 

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
									<form role="form" method="post" action="deletePage">
										<div class="form-group">
											<input type="hidden" id="serial" name="serial" value="${board.serial }">
											<input type="hidden" id="searchType" name="searchType"
												value="${cri.searchType }"> <input type="hidden" id="keyword"
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
											<label>글내용</label>
											<textarea id="content" class="form-control" rows="20" readonly="readonly" name="content">${board.content }</textarea>
										</div>
										<core:if test="${board.originalfileName!=null }">
										<div class="form-group">
										<label>첨부파일</label>
										<a href="/useful/board/notice/download?originalfileName=${board.originalfileName }&serial=${board.serial}">${board.originalfileName }</a>
										</div>
										</core:if>

										<div class="form-group"></div>

										<input type="hidden" name="page" id="page"
											value="${cri.page }"> <input type="hidden"
											name="perPageNum" value="${cri.perPageNum }" id="perPageNum">
											<core:if test="${board.empno==LoginUser.empno }">

										<button type="button" class="btn btn-default" id="modifybt" value="${board.serial }">수정하기</button>
										<button type="submit" class="btn btn-default" id="modifybt" onclick="deletePage?serial=${board.serial }">삭제하기</button>
</core:if>
										<button type="button" class="btn btn-default" id="backPage">되돌아가기</button>
										<input type='hidden' name="page" value='${pageMaker.cri.page}'>
                          <input type='hidden' name="perPageNum" value='${pageMaker.cri.perPageNum}'>
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
							<div class="col-lg-4" style="width: 80%; right: 10px;">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                         <h5>${list.replyname } : (${list.replyid }) : <fmt:formatDate pattern="yyyy-MM-dd HH:MM" value="${list.regdate }"/> </h5>
                        </div><input type="hidden" id="rno" value="${list.rno }">
                        <div class="panel-body">
                            <p id="text">${list.replytext }</p>
                        </div>
                        <core:if test="${list.replyid==LoginUser.empno }">
                         <div class="panel-footer">
<button type="button" class="btn btn-default" id="${list.rno }" name="modify">수정하기</button>
<button type="button" class="btn btn-default" id="remove">삭제하기</button>
                        </div>
                        </core:if>
                       
                      	
										
                        
                    </div>
                    
                    
                </div>
                
                
										</core:forEach>
										
										</table>
										 <input type="hidden" id="hi-input" >
										<!-- 댓글목록 -->


										<!-- 댓글 입력란 -->
										
										<div class="input-group"
											style="height: 30px; width: 50%; size: 30; left: 10px;">

											<input name="keyword" id="btn-input" type="text"
												class="form-control input-sm" placeholder="댓글을 입력해주세요"
												style="height: 65px; " /> <span class="input-group-btn">
												<button type="button" class="btn btn-warning btn-sm" id="replybtn"
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
								<script src="/useful/resources/vendor/jquery/jquery.min.js"></script>

								<!-- Bootstrap Core JavaScript -->
								<script src="/useful/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

								<!-- Metis Menu Plugin JavaScript -->
								<script src="/useful/resources/vendor/metisMenu/metisMenu.min.js"></script>

								<!-- Custom Theme JavaScript -->
								<script src="/useful/resources/dist/js/sb-admin-2.js"></script>
							
								
</body>
</body>
</html>