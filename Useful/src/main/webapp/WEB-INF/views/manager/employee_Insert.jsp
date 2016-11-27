<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>직원정보등록</title>
<style type="text/css">
th {
	background-color: #CCC;
}

</style>
 <link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqGrid/css/ui.jqgrid.css" /> 
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqGrid/plugins/ui.multiselect.css" /> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/i18n/grid.locale-en.js"></script> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery.jqGrid.src.js"></script> 
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
 				  alert("사원이 추가되었습니다")
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
	<div>
		<font size="5" style="font-style: inherit;margin-right: 300px;">직원정보등록 </font>
		<button id="btn_Save">저장</button>
		<button id="btn_List">목록</button>
		<br>
	</div>
<hr>
	<table>
		<colgroup>
			<col width="150" />
			<col />
		</colgroup>
		<tbody style="">
			<tr>
				<th>사원코드*</th>
				<td><input id="emp_no" name="emp_no" class="text" type="text"
					maxlength="20" /> 



				</td>
			</tr>
			<tr>
				<th>성명 *</th>
				<td><input id="emp_nm" name="emp_nm" class="text" type="text"
					 maxlength="15" /></td>
			</tr>
			<tr>
				<th>비밀번호*</th>
				<td><input id="emp_pw" name="emp_pw" class="text"
					type="password" maxlength="20" /></td>
			</tr>
			<tr>
				<th>주민번호 *</th>
				<td><input id="ssn" name="ssn" class="text" type="text"
					 maxlength="14" /></td>
			</tr>
			<tr>
				<th>부서명*</th>
				<td><select id="dept" name="dept" class="select"
					style="width: 200px;">
						<option value="" selected="selected">-- 선택 --</option>
						<option value="10">잘했조</option>
						<option value="20">보여조</option>
						<option value="30">강조</option>
						<option value="40">삼삼오오조</option>

				</select></td>
			</tr>
			<tr>
				<th>직책 *</th>
				<td><select id="position" name="position" class="select"
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
				<th>이메일</th>
				<td><input id="email" name="email" class="text"
					style="width: 200px;" type="text"
					maxlength="50" /></td>
			</tr>
			<tr>
				<th>핸드폰 *</th>
				<td><input id="mobile" name="mobile" class="text"
					style="width: 200px;" type="text"
					maxlength="20" />&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input id="addr" name="addr" class="text"
					style="width: 100%;" type="text"
					maxlength="100" /></td>
			</tr>
			<tr>
				<th>은행</th>
					<td>
					<select id="bank" name="bank" class="select" style="width:200px;">
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
				<th>계좌번호</th>
				<td><input id="account_no" name="account_no" class="text"
					style="width: 200px;" type="text" value="" maxlength="100" /></td>
			</tr>

			<tr>
				<th>입사일</th>
				<td>
					<input type="text" id="hiredate">  
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>