<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- 
	employee_Update.jsp
	작성자 : 박지혜
	작성일자 : 2016-12-10
 -->	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원정보수정</title>
<style type="text/css">
th {
	background-color: #CCC;
}

</style>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>  
 <script type="text/javascript" 
	src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">

	$(function() {
		$("#dept").val("${vo.deptno}").prop("selected", true);
		$("#position").val("${vo.position}").prop("selected", true);
		$("#bank").val("${vo.bank}").prop("selected", true);
		
 	   $( "#hiredate" ).datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd'
 	   });
 	   
 	   $("#btn_Save").click(function(){
 		  $.ajax({
 			  type: 'POST',
 			  url: '/useful/manager/employee_Update',
 			  headers : {
 				  "Content-Type" : "application/json",
 				  "X-HTTP-Method-Override":"POST"
 			  },
 			  dataType: 'text',
 			  data: JSON.stringify({
 				empno: $("#emp_no").val(),
 				ename:$("#emp_nm").val(),
 				ssn:$("#ssn").val(),
 				deptno:$("#dept option:selected").val(),
 				position:$("#position option:selected").val(),
 				email:$("#email").val(),
 				phone:$("#mobile").val(),
 				address:$("#addr").val(),
 				bank:$("#bank option:selected").val(),
 				account:$("#account_no").val(),
 				hiredate:$("#hiredate").val(),
 				  }),
 			  success: function(){
 				  alert("수정되었습니다");
 				 location.href="/useful/manager/employee_List";
 			  }
 			});
 	   });
 	   $("#btn_List").click(function(){
 		   
 			location.href="/useful/manager/employee_List";
 		   
 	   });
 	   $("#btn_Delete").click(function(){
 		  if (confirm("정말 삭제하시겠습니까?") == true){    //확인
 			  	$.ajax({
 		 			  type: 'POST',
 		 			  url: '/useful/manager/employee_Delete?empno='+$("#emp_no").val(),
 		 			  headers : {
 		 				  "Content-Type" : "application/json",
 		 				  "X-HTTP-Method-Override":"POST"
 		 			  },
 		 			  success: function(result){
 		 				if(result=='SUCCESS'){
 		 					alert("삭제되었습니다");
			 			location.href="/useful/manager/employee_List";
 		 			 	 }
 		 			  }
 			  	});
 			}else{   //취소
 			    return;
 			}
 		   
 	   });
	});

</script>

</head>
<body>
 <header><%@include file="/WEB-INF/views/manager/Main.jsp"%></header> 
<div>
	<jsp:include page="/WEB-INF/views/manager/Sidebar.jsp"></jsp:include>  
</div>

<div id="page-wrapper">
		<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">직원정보수정</h1>
                </div>
            </div>
	<br>
	<table class="table table-striped table-bordered table-hover">
		<colgroup>
			<col width="150" />
			<col />
		</colgroup>
		<tbody style="">
			<tr>
				<th style="text-align: center;">사원코드</th>
				<input type="hidden" value="${vo.empno}" id="emp_no">
				<td>${vo.empno}</td>
			</tr>
			<tr>
				<th style="text-align: center;">성명 </th>
				<td><input id="emp_nm" name="emp_nm" class="text" type="text"
					value="${vo.ename }" maxlength="15" /></td>
			</tr>	

			<tr>
				<th style="text-align: center;">주민번호 </th>
				<td><input id="ssn" name="ssn" class="text" type="text"
					value="${vo.ssn }" maxlength="14" /></td>
			</tr>
			<tr>
				<th style="text-align: center;">부서명</th>
				<td><select id="dept" name="dept" class="form-control-static"
					style="width: 200px;" >
						<option value="" >-- 선택 --</option>
						<option value="10">잘했조</option>
						<option value="20">보여조</option>
						<option value="30">강조</option>
						<option value="40">삼삼오오조</option>

				</select></td>
			</tr>
			<tr>
				<th style="text-align: center;">직책 </th>
				<td><select id="position" name="position" class="form-control-static"
					style="width: 200px;">
						<option value="">-- 선택 --</option>

						<option value="사장">사장</option>

						<option value="부장">부장</option>

						<option value="팀장">팀장</option>

						<option value="대리">대리</option>

						<option value="사원">사원</option>

				</select></td>
			</tr>
			
			<tr>
				<th style="text-align: center;">이메일</th>
				<td><input id="email" name="email" class="text"
					style="width: 200px;" type="text" value="${vo.email }"
					maxlength="50" /></td>
			</tr>
			<tr>
				<th style="text-align: center;">핸드폰 </th>
				<td><input id="mobile" name="mobile" class="text"
					style="width: 200px;" type="text" value="${vo.phone }"
					maxlength="20" /></td>
			</tr>
			<tr>
				<th style="text-align: center;">주소</th>
				<td><input id="addr" name="addr" class="text"
					style="width: 100%;" type="text" value="${vo.address }"
					maxlength="100" /></td>
			</tr>
			<tr>
				<th style="text-align: center;">은행</th>
					<td>
					<select id="bank" name="bank" class="form-control-static" style="width:200px;">
                        <option value="">--선택--</option>
                        <option value="신한은행">신한</option>
                        <option value="우리은행">우리</option>
                        <option value="국민은행">국민</option>
                        <option value="농협은행">농협</option>
                        <option value="외환은행">외환</option>
                        <option value="하나은행">하나</option>
                        <option value="한국은행">한국</option>
                  </select>
				</td>
			</tr>
			<tr>
				<th style="text-align: center;">계좌번호</th>
				<td><input id="account_no" name="account_no" class="text"
					style="width: 200px;" type="text" value="${vo.account }" maxlength="100" /></td>
			</tr>

			<tr>
				<th style="text-align: center;">입사일</th>
				<td>
					<input type="text" id="hiredate" value="<fmt:formatDate value="${vo.hiredate }" type="date" pattern="yyyy-MM-dd "/>">  
				</td>
			</tr>


			<tr>
				<th style="text-align: center;">최근접속일</th>
				<td>
				<fmt:formatDate value="${vo.regdate}" type="date" pattern="yyyy-MM-dd "/>
				</td>
				
			</tr>
		</tbody>
	</table>
	<div style="text-align: center;">  
		<button id="btn_Save"  class="btn btn-warning">수정완료</button>
		<button id="btn_List" class="btn btn-default" >목록으로</button>
		<button id="btn_Delete" class="btn btn-default" >삭제</button>
		<br>
	</div>
	</div>
		<div id="page-wrapper"></div>
	</body>
	</html>