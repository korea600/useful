<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>직원정보수정</title>
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
 				  alert("수정되었습니다")
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
<!-- employee_Update.jsp -->
	<div>
		<font size="5" style="font-style: inherit;margin-right: 300px;">직원정보수정 </font>
		<button id="btn_Save">수정완료</button>
		<button id="btn_Delete">삭제</button>
		<button id="btn_List">목록</button>
		<br>
	</div>
<hr>
	<table class="bbs_row">
		<colgroup>
			<col width="150" />
			<col />
		</colgroup>
		<tbody style="">
			<tr>
				<th>사원코드*</th>
				<input type="hidden" value="${vo.empno}" id="emp_no">
				<td>${vo.empno}</td>
			</tr>
			<tr>
				<th>성명 *</th>
				<td><input id="emp_nm" name="emp_nm" class="text" type="text"
					value="${vo.ename }" maxlength="15" /></td>
			</tr>

			<tr>
				<th>주민번호 *</th>
				<td><input id="ssn" name="ssn" class="text" type="text"
					value="${vo.ssn }" maxlength="14" /></td>
			</tr>
			<tr>
				<th>부서명*</th>
				<td><select id="dept" name="dept" class="select"
					style="width: 200px;" >
						<option value="" >-- 선택 --</option>
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
						<option value="">-- 선택 --</option>

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
					style="width: 200px;" type="text" value="${vo.email }"
					maxlength="50" /></td>
			</tr>
			<tr>
				<th>핸드폰 *</th>
				<td><input id="mobile" name="mobile" class="text"
					style="width: 200px;" type="text" value="${vo.phone }"
					maxlength="20" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input id="addr" name="addr" class="text"
					style="width: 100%;" type="text" value="${vo.address }"
					maxlength="100" /></td>
			</tr>
			<tr>
				<th>은행</th>
					<td>
					<select id="bank" name="bank" class="select" style="width:200px;">
						<option value="">--선택--</option>
						<option value="신한">신한</option>
						<option value="우리">우리</option>
						<option value="국민">국민</option>
						<option value="농협">농협</option>
						<option value="외환">외환</option>
						<option value="하나">하나</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td><input id="account_no" name="account_no" class="text"
					style="width: 200px;" type="text" value="${vo.account }" maxlength="100" /></td>
			</tr>

			<tr>
				<th>입사일</th>
				<td>
					<input type="text" id="hiredate" value="<fmt:formatDate value="${vo.hiredate }" type="date" pattern="yyyy-mm-dd "/>">  
				</td>
			</tr>


			<tr>
				<th>최근접속일</th>
				<td>
				<fmt:formatDate value="${vo.regdate}" type="date" pattern="yyyy-mm-dd "/>
				</td>
				
			</tr>
		</tbody>
	</table>
	
	
</body>
</html>