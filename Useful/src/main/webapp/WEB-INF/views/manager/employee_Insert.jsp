<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
	employee_Insert.jsp 
	작성자 : 박지혜
	작성일자 : 2016-12-10
 -->	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원정보등록</title>
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
 	   $( "#hiredate" ).datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd'
 	   });
 	   
 	   $("#btn_Save").click(function(){
 		  $.ajax({
 			  type: 'POST',
 			  url: '/useful/manager/employee_Insert',
 			  headers : {
 				  "Content-Type" : "application/json",
 				  "X-HTTP-Method-Override":"POST"
 			  },
 			  dataType: 'text',
 			  data: JSON.stringify({
 				 empno:$("#emp_no").val(),
 				ename:$("#emp_nm").val(),
 				pass:$("#emp_pw").val(),
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
 				  alert("사원이 추가되었습니다.")
 				location.href="/useful/manager/employee_List";
 			  }
 			});
 	   });
 	   $("#btn_List").click(function(){
 		   
 			location.href="/useful/manager/employee_List";
 		   
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
                    <h1 class="page-header">직원정보등록</h1>
                </div>
            </div>
	<table class="table table-striped table-bordered table-hover">
		<colgroup>
			<col width="150" />
			<col />
		</colgroup>
		<tbody style="">
			<tr>
				<th style="text-align: center;">사원코드</th>
				<td><input id="emp_no" name="emp_no" class="text" type="text"
					maxlength="20" /> 



				</td>
			</tr>
			<tr>
				<th style="text-align: center;">성명 </th>
				<td><input id="emp_nm" name="emp_nm" class="text" type="text"
					 maxlength="15" /></td>
			</tr>
			<tr>
				<th style="text-align: center;">비밀번호</th>
				<td><input id="emp_pw" name="emp_pw" class="text"
					type="password" maxlength="20" /></td>
			</tr>
			<tr>
				<th style="text-align: center;">주민번호 </th>
				<td><input id="ssn" name="ssn" class="text" type="text"
					 maxlength="14" /></td>
			</tr>
			<tr>
				<th style="text-align: center;">부서명</th>
				<td><select id="dept" name="dept" class="form-control-static"
					style="width: 200px;">
						<option value="" selected="selected">-- 선택 --</option>
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
						<option value="" selected="selected">-- 선택 --</option>

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
					style="width: 200px;" type="text"
					maxlength="50" /></td>
			</tr>
			<tr>
				<th style="text-align: center;">핸드폰 </th>
				<td><input id="mobile" name="mobile" class="text"
					style="width: 200px;" type="text"
					maxlength="20" />&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<th style="text-align: center;">주소</th>
				<td><input id="addr" name="addr" class="text"
					style="width: 100%;" type="text"
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
					style="width: 200px;" type="text" value="" maxlength="100" /></td>
			</tr>

			<tr>
				<th style="text-align: center;">입사일</th>
				<td>
					<input type="text" id="hiredate">  
				</td>
			</tr>
		</tbody>
	</table>
	<div style="text-align: center;">
		<button id="btn_Save" class="btn btn-warning">등록</button>
		<button id="btn_List" class="btn btn-default" >목록으로</button>
		<br>
	</div>
	</div>
			<div id="page-wrapper"></div>
</body>
</html>