<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              <small><a href="/useful/approval/listmine"><font size="2">+ MORE</font></a></small></span>               
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
	            <c:if test="${list5.size()==0 }">
	            	<tr><td colspan="4" style="text-align: center;height: 184px;vertical-align: middle;">작성한 결재문서가 없습니다.</td></tr>
	            </c:if>
	            <c:if test="${list5.size()!=0 }">
	            	<c:forEach items="${list5 }" var="my" varStatus="stat">
	            		<tr>
			                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${my.status }</td>
			                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${my.receiver_dname}</td>
			               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/approval/read/${my.no }">${my.title }</a></td>
			               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${my.regdate }" pattern="yyyy-MM-dd"/> </td>
		                </tr>     
	              </c:forEach>
	              <c:if test="${list5.size()<5 }">
	              	<c:forEach begin="${list5.size()}" end="4">
	              		<tr style="height: 36.8px"><td></td><td></td><td></td><td></td></tr>
	              	</c:forEach>
	              </c:if>
	            </c:if>
            </c:if>  
              
            <c:if test='${LoginUser.position != "사원" }'>
            	<c:if test="${list4.size()==0 }">
	            	<tr><td colspan="4"  style="text-align: center;height: 184px;vertical-align: middle;">
	            		결재 대기중인 문서가 없습니다.
	            	</td></tr>
            	</c:if>
            	<c:if test="${list4.size()!=0 }">
	            	<c:forEach items="${list4 }" var="my" varStatus="stat">
	            		<tr>
		                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${my.status }</td>
		                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${my.receiver_dname}</td>
		               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/approval/read/${my.no }">${my.title }</a></td>
		               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${my.regdate }" pattern="yyyy-MM-dd"/> </td>
		                  <%-- <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><span class="badge bg-red">${n1.hits}</span></td> --%>
		                </tr>	   	
	              </c:forEach>
	              <c:if test="${list4.size()<5 }">
	              	<c:forEach begin="${list4.size()}" end="4">
	              		<tr style="height: 36.8px"><td></td><td></td><td></td><td></td></tr>
	              	</c:forEach>
	              </c:if>
            	</c:if>
            	
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
           <c:if test="${note.size()==0 }">
           	<tr><td colspan="3" style="text-align: center;height: 184px;vertical-align: middle;">받은 메일이 없습니다.</td></tr>
           </c:if>
           <c:if test="${note.size()!=0 }">
            <c:forEach items="${note }" var="idx" varStatus="stat">
				<tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${idx.reciname }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/note/riciReadPage?serial=${note.serial }">${idx.recontent }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${idx.recipientdate }" pattern="yyyy-MM-dd"/> </td>
                </tr>
              </c:forEach>
              <c:if test="${note.size()<5 }">
	              	<c:forEach begin="${note.size()}" end="4">
	              		<tr style="height: 36.8px"><td></td><td></td><td></td></tr>
	              	</c:forEach>
	              </c:if>
         	</c:if>
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
           <c:if test="${notice.size()==0 }">
           	<tr><td colspan="4" style="text-align: center;height: 184px;vertical-align: middle;">공지글이 없습니다.</td></tr>
           </c:if>
           <c:if test="${notice.size()!=0 }">
            <c:forEach items="${notice}" var="n" varStatus="stat">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${n.serial }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/board/notice/readPage?page=1&perPageNum=10&serial=${n.serial }">${n.title }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${n.writer }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${n.regdate }" pattern="yyyy-MM-dd"/> </td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><span class="badge bg-red">${n.viewcnt}</span></td>
                </tr>
              </c:forEach>
              <c:if test="${notice.size()<5 }">
	              	<c:forEach begin="${notice.size()}" end="4">
	              		<tr style="height: 36.8px"><td></td><td></td><td></td><td></td><td></td></tr>
	              	</c:forEach>
	          </c:if>
           </c:if>
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
                <c:if test="${anonymity.size()==0 }">
                	<tr><td colspan="4" style="text-align: center;height: 184px;vertical-align: middle;">익명게시글이 없습니다.</td></tr>
                </c:if>
                <c:if test="${anonymity.size()!=0 }">
					<c:forEach items="${anonymity }" var="ano" varStatus="stat">
						<tr>
		                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${ano.serial }</td>
		                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/board/anonymity/readPage?page=1&perPageNum=10&keyword&searchType&serial=${ano.serial }">${ano.title}</a></td>
		               	  <!-- <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">--------</td> -->
		               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${ano.regdate }" pattern="yyyy-MM-dd"/> </td>
		                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><span class="badge bg-red">${ano.viewcnt}</span></td>
		                </tr>
		              </c:forEach>            
		              <c:if test="${anonymity.size()<5 }">
		              	<c:forEach begin="${anonymity.size()}" end="4">
		              		<tr style="height: 36.8px"><td></td><td></td><td></td><td></td></tr>
		              	</c:forEach>
		              </c:if>    
                </c:if>
            
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
			<c:if test="${board.size()==0 }">
				<tr><td colspan="4" style="text-align: center;height: 184px;vertical-align: middle;">게시글이 없습니다.</td></tr>
			</c:if>           
			<c:if test="${board.size()!=0 }">
				<c:forEach items="${board }" var="b">
	                <tr>
	                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${b.serial}</td>
	                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/board/readPage?page=1&perPageNum=10&keyword&searchType&serial=${b.serial }">${b.title }</a></td>
	               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${b.writer }</td>
	               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd"/> </td>
	                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><span class="badge bg-red">${b.viewcnt}</span></td>
	                </tr>
	              </c:forEach>
	              <c:if test="${board.size()<5 }">
	              	<c:forEach begin="${board.size()}" end="4">
	              		<tr style="height: 36.8px"><td></td><td></td><td></td><td></td><td></td></tr>
	              	</c:forEach>
	              </c:if>
			</c:if>
            
         
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
           <c:if test="${list7.size()==0 }">
           		<tr><td colspan="5" style="text-align: center;height: 184px;vertical-align: middle;">게시글이 없습니다.</td></tr>
           </c:if>
           <c:if test="${list7.size()!=0 }">
           		<c:forEach items="${list7 }" var="s">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${s.bno}</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><a href="/useful/sharetask/detail?page=1&perPageNum=10&bno=${s.bno }&deptno=${s.deptno}">${s.title }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;">${s.ename }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><fmt:formatDate value="${s.regdate }" pattern="yyyy-MM-dd"/> </td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid; text-align: center;"><span class="badge bg-red">${s.viewcnt}</span></td>
                </tr>
              </c:forEach>
              <c:if test="${list7.size()<5 }">
	              	<c:forEach begin="${list7.size()}" end="4">
	              		<tr><td></td><td></td><td></td><td></td><td></td></tr>
	              	</c:forEach>
	           </c:if>
           </c:if>
           
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
           
            </td>

            	</tr>
            </table>

          </div><!--/row-->
		</div>
	</div>
	