<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>




 

<style type="text/css">

 </style>
 
<style type="text/css">

</style>



 <script type="text/javascript">



 </script>


	<div class="container"> 
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
		
		
		
		
		 <div class="col-xs-5 col-lg-6">
              <h3><span class="glyphicon glyphicon-file" style="color:black">전자결재</span>
              <c:forEach begin="1" end="29">
              &nbsp;
              </c:forEach> 
              <c:if test='${LoginUser.position == "사원" }'>
              <small><a href="/useful/approval/listmine"><font size="2">+ MORE</font></a></small>               
              </c:if>           

              <c:if test='${LoginUser.position != "사원" }'>
              
              <small><a href="/useful/approval/listmyturn"><font size="2">+ MORE</font></a></small> 
              </c:if></h3>
              
			<table class="table table-bordered">
                <tr style="background-color: silver;">
                  
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">상태</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">수신처</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">작성일자</th>
                  
                </tr>
            <c:if test="${LoginUser.position == '사원'}">
            
            <c:forEach items="${list5 }" var="my">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${my.status }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${my.receiver_dname}</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><a href="/useful/approval/read/${my.no }">${my.title }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><fmt:formatDate value="${my.regdate }" pattern="yyyy-MM-dd"/> </td>
                </tr>
              </c:forEach>
            </c:if>  
              
            <c:if test='${LoginUser.position != "사원" }'>
            	<c:forEach items="${list4 }" var="my">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${my.status }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${my.receiver_dname}</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><a href="/useful/approval/read/${my.no }">${my.title }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><fmt:formatDate value="${my.regdate }" pattern="yyyy-MM-dd"/> </td>
                  <%-- <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><span class="badge bg-red">${n1.hits}</span></td> --%>
                </tr>
              </c:forEach>
            </c:if>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
		
		<div class="col-xs-5 col-lg-6">
           <h3><span class="glyphicon glyphicon-envelope" style="color:black">메일함</span>
              <c:forEach begin="1" end="20">
              &nbsp;&nbsp;
              </c:forEach>
             <small><a href="/useful/note/noteMyPage"><font size="2">+ MORE</font></a></small> </h3>
			<table class="table table-bordered">
                <tr style="background-color: silver;">
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">보낸사람</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">내용</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">보낸날짜</th>
                </tr>
           
            <c:forEach items="${note }" var="note">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${note.reciid }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><a href="/useful/note/riciReadPage?serial=${note.serial }">${note.recontent }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><fmt:formatDate value="${note.recipientdate }" pattern="yyyy-MM-dd"/> </td>
                 
                </tr>
              </c:forEach>
         
              </table>	
            </div><!--/.col-xs-6.col-lg-4--> 
		
		
		
		
		<div class="col-xs-5 col-lg-6">
              <h3><span class="glyphicon glyphicon-info-sign" style="color:black">공지사항</span>
               <c:forEach begin="1" end="19">
              &nbsp;&nbsp;
              </c:forEach> 
              
              <small><small><a href="/useful/board/notice/listPage"><font size="2">+ MORE</font></a></small></small></h3>
              
              
			<table class="table table-bordered">
                <tr style="background-color: lime;">
                  <th style="width: 50px">번호</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">작성자</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">등록일</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">조회수</th>
                </tr>
            <c:forEach items="${notice}" var="n">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${n.serial }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><a href="/useful/board/notice/readPage?page=1&perPageNum=10&serial=${n.serial }">${n.title }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${n.writer }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><fmt:formatDate value="${n.regdate }" pattern="yyyy-MM-dd"/> </td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><span class="badge bg-red">${n.viewcnt}</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
            
		 <div class="col-xs-5 col-lg-6">
              <h3><span class="glyphicon glyphicon-ok-sign" style="color:black">익명게시판</span>
              <c:forEach begin="1" end="18">
              &nbsp;&nbsp;
              </c:forEach>
              <small><a href="/useful/board/anonymity/listPage"><font size="2">+ MORE</font></a></small> </h3>
              
			<table class="table table-bordered">
                <tr style="background-color: #FF5E00">
                  <th style="width: 50px">번호</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">작성자</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">등록일</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">조회수</th>
                </tr>
            <c:forEach items="${anonymity }" var="ano">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${ano.serial }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><a href="/useful/board/anonymity/readPage?page=1&perPageNum=10&keyword&searchType&serial=${ano.serial }">${ano.title}</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">--------</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><fmt:formatDate value="${ano.regdate }" pattern="yyyy-MM-dd"/> </td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><span class="badge bg-red">${ano.viewcnt}</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
		
		<div class="col-xs-5 col-lg-6">
           <h3><span class="glyphicon glyphicon-list-alt" style="color:black">사내게시판</span>
              <c:forEach begin="1" end="18">
              &nbsp;&nbsp;
              </c:forEach>
             <small><a href="/useful/board/listPage"><font size="2">+ MORE</font></a></small> </h3>
			<table class="table table-bordered">
                <tr style="background-color: #FF4848;">
                  <th style="width: 10px">no</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">작성자</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">등록일</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">조회수</th>
                </tr>
           
            <c:forEach items="${board }" var="b">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${b.serial}</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><a href="/useful/board/readPage?page=1&perPageNum=10&keyword&searchType&serial=${b.serial }">${b.title }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${b.writer }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd"/> </td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><span class="badge bg-red">${b.viewcnt}</span></td>
                </tr>
              </c:forEach>
         
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
		
		
          </div><!--/row-->
		</div>
	</div>
	