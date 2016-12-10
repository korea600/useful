<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>

<style>



/* 첨부파일 css */
#imgInp{display: none;}
#fileName{ font-family: '맑은 고딕'; margin:0; border:0; width:600px; height:30px;  /* border:solid #b9b9b9 1px;  */}
#fileFind{
 background: #333;
 font-size:13px;
 padding:6px;
 color: white;
 font-family: '맑은 고딕';
 position: relative;
 cursor: pointer;
 

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


</head>

<body>
<div id='page-wrapper'>
	<div class='row'>
		<div class="col-lg-12">
			<h1 class="page-header">업무등록</h1>
		</div>
	</div>
    <div class="row">
        <div class="col-lg-12">
           <div class="panel panel-default">
              <div class="panel-heading">작성페이지
              </div>            
                <div class="panel-body">
                   <div class="row">
                     <div class="col-lg-6">
                        <form  method="post" action="/useful/sharetask/insert">
                          <div class="form-group">
                             <label>글제목</label>
                             <input class="form-control" type="text" placeholder="글 제목을 입력해주세요" id="title"	name="title" value="${shareTaskVO.title}">
                          </div>
                          <div class="form-group">
                            <label>분류</label><br>
                        <select class="form-control" name="category">
				            <option value="선택">선택</option>
				            <option value="업무관련">업무관련</option>
				            <option value="회의관련">회의관련</option>
				            <option value="기타">기타</option>
				        </select>
                          </div>
                          <div class="form-group">
                             <label>글쓴이</label>
                             <input class="form-control" type="text" id="ename" name="ename" readonly="readonly" value="${LoginUser.ename}">
                             <input type="hidden" name="writer" value="${LoginUser.empno}">
                             <input type="hidden" name="deptno" value="${LoginUser.deptno}">
                          </div>
                          <div class="form-group">
							<label>글내용</label>
							<textarea id="content" class="form-control" rows="3"  name="content"  placeholder="내용을 입력해주세요"></textarea>
						  </div>
                          
						<div class="form-group">
                         
										<label>첨부파일</label>
									
										
						</div>
                                        
                          	    <div class="form-group">
                          	   
                                
					                <input type="submit" class="btn btn-default" value="등록">
					    		    <input type="button" class="btn btn-default" value="취소" onClick="location.href='share_Board'" />

                                    </div>
									</form>

						 </div>
                      </div>
                   </div>
                </div>
           </div>
        </div>
        </div>
</body>
</html>