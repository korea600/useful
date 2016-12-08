<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수신문서 리스트</title>
<%@include file="/WEB-INF/views/login/Main.jsp" %>
<%@include file="/WEB-INF/views/login/Sidebar.jsp" %>
<style type="text/css">
th{text-align: center}
td{text-align: center}
</style>
<!-- jQuery -->
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
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script type="text/javascript">
	function selectSearchType(){
		var searchBy = $('[name=searchBy]').val();
		if(searchBy==''){
			$('[name=selectReceiver_name]').hide();
			$('[name=selectReceiver_name]').empty();
			$('[name=selectWriter_dname]').hide();
			$('[name=selectWriter_dname]').empty();
			$('[name=keyword]').hide();
			$('[name=keyword]').val('');
		}
		else if(searchBy=='receiver_name'){			// 수신부서 조회 (우리부서/전체부서)
			$('[name=selectReceiver_name]').empty();
			$('[name=selectReceiver_name]').append("<option value='${LoginUser.deptno}'>우리부서</option>"
											+"<option value='0'>전체부서</option>");
			$('[name=selectReceiver_name]').show();
			$('[name=selectWriter_dname]').hide();
			$('[name=selectWriter_dname]').empty();
			$('[name=keyword]').hide();
			$('[name=keyword]').val('');
		}
		else if(searchBy=='writer_dname'){			// 발신부서 조회 (타부서), 타부서 정보는 ajax로 얻어오기
			$.ajax({
				data:{
					deptno:"${LoginUser.deptno}"
				},
				url:'/useful/approval/getDept',
				type:'POST',
				success:function(result){
					var str='';
					for(var i=0;i<result.length;i++){
						str+="<option value="+result[i].dname+">"+result[i].dname+"</option>";
					}
					$('[name=selectReceiver_name]').hide();
					$('[name=selectReceiver_name]').empty();
					$('[name=selectWriter_dname]').empty();
					$('[name=selectWriter_dname]').append(str);
					$('[name=selectWriter_dname]').show();
					$('[name=keyword]').hide();
					$('[name=keyword]').val('');
				}
			})
			
		}
		
		else{										// 작성자별 조회
			$('[name=selectReceiver_name]').hide();
			$('[name=selectReceiver_name]').empty();
			$('[name=selectWriter_dname]').hide();
			$('[name=selectWriter_dname]').empty();
			$('[name=keyword]').val('');
			$('[name=keyword]').show();
			$('[name=keyword]').focus();
		}
	}
	function search(){
		var searchBy = $('[name=searchBy]').val();
		if(searchBy==''){						// 검색형식 미선택
			alert('검색형식을 선택해 주세요.');
			return;
		}
		else if(searchBy=='writer_name'){		// 작성자명 검색
			var keyword=$('[name=keyword]').val();
			if(keyword==''){
				alert('검색할 작성자명을 입력하세요.');
				return;
			}
		}
		else if(searchBy=='writer_dname')		// 발신부서검색
			var keyword=$('[name=selectWriter_dname]').val();
		
		else									// 수신부서 검색
			var keyword=$('[name=selectReceiver_name]').val();
		
		location.href='listdept${pagemaker.makeQuery(1)}&searchBy='+searchBy+'&keyword='+keyword;
	}
</script>
</head>
<body>
<div id='page-wrapper'>
	<div class='row'>
		<div class="col-lg-12">
			<h1 class="page-header">수신 문서</h1>
		</div>
	</div>	
	<div class='row'>
		<div class="col-lg-12">	
			<div class='panel panel-default'>
		
				<div class='panel-heading'>
					<select name='searchBy' class='form-control-static' style="width: 10%" onchange="selectSearchType()">
						<option value=''>선택</option>
						<option value='receiver_name'>수신부서 </option>
						<option value='writer_dname'>발신부서</option>
						<option value='writer_name'>작성자</option>
					</select>
					<select name='selectReceiver_name' class='form-control-static' style="width: 10%;display: none;"></select>
					<select name='selectWriter_dname' class='form-control-static' style="width: 10%;display: none;"></select>
					<input type='text' name='keyword' class='form-control-static' style="width: 15%;display: none;">
					<input type='button' id='search' class='btn btn-warning' value='검색' onclick='search()'>			
				</div>
				<div class='panel-body'>
					<div class='table-responsive'>
						<table class='table table-striped table-bordered table-hover'>
							<tr><th style="width: 13%">문서번호</th><th style="width: 13%">상태</th><th style="width: 13%">작성자</th><th style="width: 13%">발신부서</th><th style="width: 13%">수신처</th><th style="width: 22%">제목</th><th style="width: 13%">작성일자</th></tr>
							<c:if test="${list.size()==0}">
								<tr><td colspan="6">문서가 없습니다.</td></tr>
							</c:if>
							<c:if test="${list.size()>0}">
								<c:forEach items="${list}" var='i'>
									<tr><td>${i.no}</td><td>${i.status}</td><td>${i.writer_name}</td><td>${i.writer_dname }</td><td>${i.receiver_dname}</td><td><a href='/useful/approval/read/${i.no}'>${i.title}</a></td><td><fmt:formatDate value="${i.regdate}" pattern="yyyy-MM-dd HH:mm"/></td></tr>
								</c:forEach>
							</c:if>

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class='row'>

		<div class='dataTables_paginate paging_simple_numbers' id='dataTables-example_paginate' style="text-align: center;">
			<ul class='pagination'>
				<c:if test="${pagemaker.prev}">
					<li class='paginate_button' id='dataTables-example_previous'><a href="listdept${pagemaker.makeSearch(pagemaker.startPage-1)}">이전</a></li>
				</c:if>
				<c:forEach begin='${pagemaker.startPage}' end="${pagemaker.endPage }" var='i'>
					<c:if test="${pagemaker.cri.page==i}"><li class='paginate_button active'><a href='#'>${i}</a></li></c:if>
					<c:if test="${pagemaker.cri.page!=i}"><li class='paginate_button'><a href="listdept${pagemaker.makeSearch(i)}"> ${i} </a></li></c:if>
				</c:forEach>
				<c:if test="${pagemaker.next && pagemaker.endPage>0 }">
					<li class='paginate_button' id='dataTables-example_next'><a href="listdept${pagemaker.makeSearch(pagemaker.endPage+1)}">다음</a></li>
				</c:if>				
			</ul>
		</div>
	</div>
</div>

</body>
</html>