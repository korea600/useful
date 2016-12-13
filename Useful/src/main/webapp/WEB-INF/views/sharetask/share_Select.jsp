<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업무공유상세</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>

<style>

/* 첨부파일 css */
#imgInp {
	display: none;
}

#fileName {
	font-family: '맑은 고딕';
	margin: 0;
	border: 0;
	width: 600px;
	height: 30px; /* border:solid #b9b9b9 1px;  */
}

#fileFind {
	background: #333;
	font-size: 13px;
	padding: 6px;
	color: white;
	font-family: '맑은 고딕';
	position: relative;
	cursor: pointer;
}

.ttr {
	width: 900px;
	height: 500px;
	margin: 0;
	border: 0;
}
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


$(document).ready(function(){
	
	
	$("#changeOK").hide();		
	
	$('#change').click(function(){
		$('#changeOK').show();
		$('#change').hide();
		$('#title').attr("readonly", false);
		$('#content').attr("readonly", false);                                                             
		$('#title').focus();
		
		$('#category').attr("disabled", false);
		$('#category').css("background-color", "#fff");
		

	})
	
	
	
	$("#replyBtn").on("click",function(){
		
		     empno=$('[name=empno]').val();
	           bno=$('[name=bno]').val();
			 replyer=$('[name=replyer]').val();
			 replytext=$('[name=replytext]').val();
			 if(replytext=='')alert("내용을 입력해 주세요");
				else{
		$.ajax({
			type:'post',
			url:'/useful/ShareReply',
			dataType:'text',
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"
			},
			data: JSON.stringify({bno:bno, empno:empno, replyer:replyer, replytext:replytext}),
			success:function(result){
				
				if(result=='SUCCESS'){
					
				   alert("등록되었습니다");
					location.reload();
					replytext.val("");
				}
			}
		}); //ajax
				}//else
	});//click
	
	
});//ready
	
	var flag=true;
	//댓글 수정
	
function replyDiv(rno){
		//alert(rno);
		
			var str="<div class='input-group' id='input-group'"
					+" style='height: 30px; width: 85%; size: 30; left: 10px; '>"
					+"<input name='changeReply' id='btn-input2' type='text' value=''"
					+" class='form-control input-sm' placeholder='내용을 작성해주세요'"
					+" style='height: 65px; ' /> <span class='input-group-btn'>"
					+"<button type='button' class='btn btn-warning btn-sm'  onclick='modifyreply("+rno+")'"
					+" style='height: 65px; width: 100px;'><h3>입력</h3></button></span></div>";
		  
	      $('#a'+rno).parent().append(str);
	      $('#a'+rno).hide();
	      $('#b'+rno).hide();
          $("#input-group").show();
		
}


function modifyreply(rno){
	var replytext=$('[name=changeReply]').val();
	if(replytext=='')alert('내용을 입력해 주세요');
	else{
	$.ajax({
		type:'PATCH',
		url:'/useful/ShareReply/'+rno,
		dataType:'text',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		data: JSON.stringify({rno:rno, replytext:replytext}),
		success:function(result){
			
			if(result=='SUCCESS'){
				
			   alert("수정되었습니다");
				location.reload();
				replytext.val("");
			}
		}
	}); 
	}
} 


function deleteReply(rno){
	alert(rno);
	$.ajax({
		type:'DELETE',
		url:'/useful/ShareReply/'+rno,
		dataType:'text',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"DELETE"
		},
		success:function(result){
			
			if(result=='SUCCESS'){
				
			   alert("삭제되었습니다");
				location.reload();
				replytext.val("");
			}
		}
	}); 
	
}


function changeSubmit(){
	
	var title = $("[name=title]").val();
	var category = $("[name=category]").val();
	var deptno = $("[name=deptno]").val();
	var writer = $("[name=writer]").val();
	var content = $("[name=content]").val();


	if(title  == ""){
		alert("제목을 입력해 주세요");
		
	}else if(category  == ""){
		alert("분류를 선택해 주세요");
		
	}else if(content  == ""){
		alert("내용을 입력해 주세요");
		
	}else{
	
	alert('입력하신 정보를 전송합니다.');
	document.changeForm.submit();
	}

}



</script>


</head>
<body>
<div id='page-wrapper'>
	<div class='row'>
		<div class="col-lg-12">
			<h1 class="page-header">업무공유 보기</h1>
		</div>
	</div>
    <div class="row">
        <div class="col-lg-12">
           <div class="panel panel-default">
              <div class="panel-heading">작성하기
              
              <span style="float: right;">글번호: ${shareTaskVO.bno}&nbsp;조회수: ${shareTaskVO.viewcnt }&nbsp;&nbsp;
                <c:choose>
					   <c:when test="${prevBno==null }">이전</c:when>
					   <c:otherwise><a href="/useful/sharetask/prev?bno= ${shareTaskVO.bno}&deptno=${LoginUser.deptno}" >이전</a></c:otherwise>
					</c:choose> 
					
					<c:choose>
					   <c:when test="${nextBno==null }">다음</c:when>
					   <c:otherwise><a href="/useful/sharetask/next?bno= ${shareTaskVO.bno}&deptno=${LoginUser.deptno}" >다음</a></c:otherwise>
					</c:choose> 
					</span> 
              </div>            
                <div class="panel-body">
                   <div class="row">
                     <div class="col-lg-6">
                     
                        <form name="changeForm" method="post" action="/useful/sharetask/change">
                          <div class="form-group">
                             <input type="hidden" name="bno" value="${shareTaskVO.bno}"> 
                             <input type="hidden" name="deptno" value="${shareTaskVO.deptno }">
					         <input type="hidden" name="writer" value="${shareTaskVO.writer }">
                             <label>글제목</label>
                             <input class="form-control" type="text" id="title"	name="title" readonly="readonly" value="${shareTaskVO.title}">
                          </div>
                          <div class="form-group">
                            <label>분류</label><br>
                            <select class="form-control" name="category" id="category"
						         style="background-color:#e7e7e7;" disabled="disabled">
							<c:if test="${shareTaskVO.category=='업무관련'}">
								<option value="업무관련" selected="selected">업무관련</option>
							</c:if>
							<c:if test="${shareTaskVO.category!='업무관련'}">
								<option value="업무관련">업무관련</option>
							</c:if>
							<c:if test="${shareTaskVO.category=='회의관련'}">
								<option value="회의관련" selected="selected">회의관련</option>
							</c:if>
							<c:if test="${shareTaskVO.category!='회의관련'}">
								<option value="회의관련">회의관련</option>
							</c:if>
							<c:if test="${shareTaskVO.category=='기타'}">
								<option value="기타" selected="selected">기타</option>
							</c:if>
							<c:if test="${shareTaskVO.category!='기타'}">
								<option value="기타">기타</option>
							</c:if>
					        </select>
                          </div>
                          <div class="form-group">
                             <label>글쓴이</label>
                             <input class="form-control" type="text" id="ename"	name="ename" readonly="readonly" value="${shareTaskVO.ename}">
                          </div>
                          <div class="form-group">
							<label>글내용</label>
							<textarea id="content" class="form-control" rows="3" readonly="readonly" name="content">${shareTaskVO.content}</textarea>
						  </div>
                          
						<div class="form-group">
                         
										<label>첨부파일</label>
									
										
						</div>
                                        
                          	    <div class="form-group">
                          	   
                                  <c:if test='${empno==shareTaskVO.writer || position !="사원"}'>
                                    <input type="button" class="btn btn-default" id="change" value="수정" >
                                    <input type="button" class="btn btn-default" onclick="changeSubmit()" id="changeOK" value="확인">
					    		    <input type="button" class="btn btn-default" value="삭제" onClick="location.href='remove?page=${cri.page }&bno=${shareTaskVO.bno }'"/> 
						             </c:if>
						            <input type="button" class="btn btn-default" value="목록" onClick="location.href='share_Board?page=${cri.page}'" />

                                    </div>
									</form>

						 </div>
                      </div>
                   </div>
                </div>
           </div>
        </div>
    
    
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
					<c:forEach items="${list }" var="ShareReplyVO">
					<div class="col-lg-4" style="width: 87%; right: 10px;">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                        <h5>${ShareReplyVO.replyer }(${ShareReplyVO.empno }) <fmt:formatDate pattern="yyyy-MM-dd HH:MM" value="${ShareReplyVO.regdate}"/> </h5>
                        </div><input type="hidden" id="rno" value="${ShareReplyVO.rno }">
                        <div class="panel-body">
                            <p id="text">${ShareReplyVO.replytext }</p>
                        </div>
                 
                         <div class="panel-footer">   
                         
                         
                         <c:if test="${empno==ShareReplyVO.empno}">
                         <button type="button" class="btn btn-default" id="a${ShareReplyVO.rno }" name="modify" onclick="replyDiv(${ShareReplyVO.rno })">수정</button>
                         <button type="button" class="btn btn-default" id="b${ShareReplyVO.rno }" onclick="deleteReply(${ShareReplyVO.rno })">삭제</button>
                        </c:if>  
                        </div>
                       
                       
                    </div>
                </div>
                   	</c:forEach>
										
										</table>
									    <input type="hidden" id="hi-input" >
										<!-- 댓글 입력란 -->
										
										<div class="input-group"
											style="height: 30px; width: 85%; size: 30; left: 10px;">
											<input type="hidden" value="${replyer}" name="replyer"> 
                                            <input type="hidden" value="${empno}" name="empno">
											<input name="replytext" id="replyInput" type="text" class="form-control input-sm" placeholder="댓글을 입력해주세요" 
											style="height: 65px; " />
											 <span class="input-group-btn">
												<button type="button" class="btn btn-warning btn-sm" id="replyBtn"
													style="height: 65px; width: 100px;">
													<h3>입력</h3>
												</button>
											</span>
										</div>
									
								</div>
    
    </div>
    
   
    
    <div id="page-wrapper"></div>
    




		


</body>
</html>
