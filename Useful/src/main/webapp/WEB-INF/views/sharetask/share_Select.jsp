<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

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

	})
	
	

});




</script>

</head>

<body>
	<center>
		<form action="/useful/sharetask/change" method="post">
			<table border="1"
				style="border-collapse: collapse; line-height: 30px;" width="900px">
				<tr>
					<td align="center" colspan="4" height="110px" align="center">업무	상세</td>
				</tr>
				<tr>
					<td colspan="4" align="right"><input type="hidden" name="bno" value="${shareTaskVO.bno}"> 글번호: ${shareTaskVO.bno} 조회수: ${shareTaskVO.bno }
					
				   <c:choose>
					   <c:when test="${prevBno==null }">이전</c:when>
					   <c:otherwise><a href="/useful/sharetask/prev?bno= ${shareTaskVO.bno}&deptno=${LoginUser.deptno}" >이전</a></c:otherwise>
					</c:choose> 
					
					<c:choose>
					   <c:when test="${nextBno==null }">다음</c:when>
					   <c:otherwise><a href="/useful/sharetask/next?bno= ${shareTaskVO.bno}&deptno=${LoginUser.deptno}" >다음</a></c:otherwise>
					</c:choose> 
				   
					
	           
				</tr>
				<tr>
					<td bgcolor="#dae6f4" align="center" width="150px">작성자</td>
					<td align="center" width="300px">
					${shareTaskVO.ename}</td>

					<td bgcolor="#dae6f4" align="center" width="150px">분류</td>
					<td align="center" colspan="3">
					<select name="category" id="category"
						style="width: 110px; height: 25px" disabled="disabled">
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
					</select></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#dae6f4" width="150px">첨부파일</td>
					<td colspan="3">첨부파일 목록</td>
				</tr>

				<tr>
					<td bgcolor="#dae6f4" align="center" width="150px"
						>제목</td>
					<td colspan="3" style="padding: 0;">
					<input type="text" id="title" name="title" readonly="readonly" value="${shareTaskVO.title}"></td>

				</tr>

				<tr>
					<td colspan="4" style="padding: 0;"><textarea id="content" name="content"
							readonly="readonly" 
							style="width: 900px; margin: 0; height: 500px; border: 0;">
					
					
					
					${shareTaskVO.content}
					${LoginUser.deptno}
					
					
					
					</textarea></td>
				</tr>
				<tr>
					<td colspan="4" align="right">
					<%-- <% if(session.getAttribute("id")==""){} %> --%>
					     <input type="hidden" name="deptno" value="${shareTaskVO.deptno }">
					     <input type="hidden" name="writer" value="${shareTaskVO.writer }">
					     
                             
					    <input type="button" id="change" value="수정" />
					    <input type="submit" id="changeOK" value="확인">
						<input type="button" value="삭제" onClick="location.href='remove?page=${cri.page }&bno=${shareTaskVO.bno }'"/> 
						<input type="button"	value="목록" onClick="location.href='share_Board?page=${cri.page}'" /></td>
					<!-- '" -->
				</tr>
				 
			</table>
		</form>

               <table>
               <c:forEach items="${list}" var="ShareReplyVO"></c:forEach>
               <tr>
               <td>${ShareReplyVO.Rno }</td>
               <td>${ShareReplyVO.replyer }<input type="hidden" name="empno" value="${ShareReplyVO.empno }"></td>
               <td>${ShareReplyVO.replytext }</td>
               <td>${regdate }</td>
               </tr>
               </table>

		                   <!-- 댓글 입력란 -->
										
										<div class="input-group"
											style="height: 30px; width: 85%; size: 30; left: 10px;">

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
		
		
	</center>
</body>
</html>