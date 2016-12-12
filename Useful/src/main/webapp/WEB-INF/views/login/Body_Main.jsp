<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 
	Body_Main.jsp 
	작성자 : 채효원
	작성일자 : 2016-12-10
 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

	<div class="container"> 
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
	
	<table>
		<tr>

			<td >
			 <div class="col-xs-5 col-lg-6" style="width: 100%">
			 	<div class='table-title' style="height: 35px">
              <h3><span class="glyphicon glyphicon-file" style="color:black;float: left;">전자결재</span>
     
              <c:if test='${LoginUser.position == "사원" }'>
             <span style="float: right;"> <small><a href="/useful/approval/listmine"><font size="2">+ MORE</font></a></small></span>               
              </c:if>           

              <c:if test='${LoginUser.position != "사원" }'>
              
              <span style="float: right;"><small><a href="/useful/approval/listmyturn"><font size="2">+ MORE</font></a></small></span> 
              </c:if></h3>
              </div>
			<table class="table table-bordered" style="width: 500px;">
                <tr style="background-color: silver;">
                  
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">상태</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">수신처</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">작성일자</th>
                  
                </tr>
            <c:if test="${LoginUser.position == '사원'}">
            
            <c:forEach items="${list5 }" var="my">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${my.status }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${my.receiver_dname}</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/approval/read/${my.no }">${my.title }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${my.regdate }" pattern="yyyy-MM-dd"/> </td>
                </tr>
              </c:forEach>
            </c:if>  
              
            <c:if test='${LoginUser.position != "사원" }'>
            	<c:forEach items="${list4 }" var="my">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${my.status }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${my.receiver_dname}</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/approval/read/${my.no }">${my.title }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${my.regdate }" pattern="yyyy-MM-dd"/> </td>
                  <%-- <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><span class="badge bg-red">${n1.hits}</span></td> --%>
                </tr>
              </c:forEach>
            </c:if>
              </table>	
             
            </div><!--/.col-xs-6.col-lg-4-->
           </td>

			<td >
		<div class="col-xs-5 col-lg-6" style="width: 100%">
			<div class='table-title' style="height: 35px">
           <h3><span class="glyphicon glyphicon-envelope" style="color:black;float: left;">메일함</span></h3>
              <span style="float: right;"><small><a href="/useful/note/noteMyPage"><font size="2">+ MORE</font></a></small></span>
              </div>
			<table class="table table-bordered" style="width: 500px;">
                <tr style="background-color: silver;">
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">보낸사람</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">내용</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">보낸날짜</th>
                </tr>
           
            <c:forEach items="${note }" var="note">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${note.reciname }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/note/riciReadPage?serial=${note.serial }">${note.recontent }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${note.recipientdate }" pattern="yyyy-MM-dd"/> </td>
                 
                </tr>
              </c:forEach>
         
              </table>	
            </div><!--/.col-xs-6.col-lg-4--> 
		
		</td>
		</tr>
		
		<tr>
			<td>
		<div class="col-xs-5 col-lg-6" style="width: 100%">
			<div class='table-title' style="height: 35px">
              <h3><span class="glyphicon glyphicon-info-sign" style="color:black;float: left;">공지사항</span>
             
              
              <span style="float: right;"><small><a href="/useful/board/notice/listPage"><font size="2">+ MORE</font></a></small></h3></span>
            </div>  
              
			<table class="table table-bordered" style="width: 500px;">
                <tr style="background-color:silver;">
                  <th style="width: 50px">번호</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">작성자</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">등록일</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">조회수</th>
                </tr>
            <c:forEach items="${notice}" var="n">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${n.serial }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/board/notice/readPage?page=1&perPageNum=10&serial=${n.serial }">${n.title }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${n.writer }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${n.regdate }" pattern="yyyy-MM-dd"/> </td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><span class="badge bg-red">${n.viewcnt}</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
         	   </td>

            	<td>
		 <div class="col-xs-5 col-lg-6" style="width: 100%">
		 	<div class='table-title' style="height: 35px">
              <h3><span class="glyphicon glyphicon-ok-sign" style="color:black;float: left;">익명게시판</span>
              <span style="float: right;"><small><a href="/useful/board/anonymity/listPage"><font size="2">+ MORE</font></a></small> </h3></span>
            </div>  
			<table class="table table-bordered" style="width: 500px;">
                <tr style="background-color: silver;">
                  <th style="width: 50px">번호</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">제목</th>
                 <!--  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">작성자</th> -->
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">등록일</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">조회수</th>
                </tr>
            <c:forEach items="${anonymity }" var="ano">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${ano.serial }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/board/anonymity/readPage?page=1&perPageNum=10&keyword&searchType&serial=${ano.serial }">${ano.title}</a></td>
               	  <!-- <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">--------</td> -->
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${ano.regdate }" pattern="yyyy-MM-dd"/> </td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><span class="badge bg-red">${ano.viewcnt}</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
            	</td>
            </tr>
            
            <tr>
            	<td>
		<div class="col-xs-5 col-lg-6"  style="width: 100%">
		<div class='table-title' style="height: 35px">
           <h3><span class="glyphicon glyphicon-list-alt" style="color:black;float: left;">사내게시판</span>
              <span style="float: right;"><small><a href="/useful/board/listPage"><font size="2">+ MORE</font></a></small> </h3></span>
           </div>
			<table class="table table-bordered" style="width: 500px;">
                <tr style="background-color: silver;">
                  <th style="width: 50px">번호</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">작성자</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">등록일</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">조회수</th>
                </tr>
           
            <c:forEach items="${board }" var="b">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${b.serial}</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/board/readPage?page=1&perPageNum=10&keyword&searchType&serial=${b.serial }">${b.title }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${b.writer }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd"/> </td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><span class="badge bg-red">${b.viewcnt}</span></td>
                </tr>
              </c:forEach>
         
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
            </td>

            	<td>
		<div class="col-xs-5 col-lg-6"  style="width: 100%">
		<div class='table-title' style="height: 35px">
           <h3><span class="glyphicon glyphicon-share" style="color:black;float: left;">업무공유게시판</span>
              <span style="float: right;">
             <small><a href="/useful/sharetask/share_Board"><font size="2">+ MORE</font></a></small> </h3>
             </span>
             </div>
			<table class="table table-bordered" style="width: 500px;">
                <tr style="background-color: silver;">
                  <th style="width: 50px">번호</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">작성자</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">등록일</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">조회수</th>
                </tr>
           
            <c:forEach items="${list7 }" var="s">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${s.bno}</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/sharetask/detail?page=1&perPageNum=10&bno=${s.bno }&deptno=${s.deptno}">${s.title }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${s.ename }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${s.regdate }" pattern="yyyy-MM-dd"/> </td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><span class="badge bg-red">${s.viewcnt}</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
           
            </td>

            	</tr>
            </table>

          </div><!--/row-->
		</div>
	</div>
	