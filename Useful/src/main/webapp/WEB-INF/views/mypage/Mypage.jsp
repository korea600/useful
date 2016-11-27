<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인정보수정</title>
<%@include file="../login/Main.jsp" %>
<script type="text/javascript" src="../resources/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	function InfoSave(){
		if($.trim($('#pass').val()) == ""){
			alert("비밀번호를 입력해주세요.");
			$('#pass').focus();
			return;
		}else if($.trim($('#ssn').val()) == ""){
			alert("주민번호를 입력해주세요.");
			$('#ssn').focus();
			return;
		}else if($.trim($('#email').val()) == ""){
			alert("이메일을 입력해주세요.");
			$('#email').focus();
			return;
		}else if($.trim($('#phone').val()) == ""){
			alert("핸드폰번호를 입력해주세요.");
			$('#phone').focus();
			return;
		}else if($.trim($('#address').val()) == ""){
			alert("주소를 입력해주세요.");
			$('#address').focus();
			return;
		}else if($.trim($('#bank').val()) == ""){
			alert("은행을 선택해주세요.");
			$('#bank').focus();
			return;
		}else if($.trim($('#account').val()) == ""){
			alert("계좌번호를 입력해주세요.");
			$('#account').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'/useful/mypage/MypageUp',
			data:$('#frm').serialize(),
			success:function(result){
				if(result=="SUCCESS"){
					
					alert("정보 수정완료!!");
					location.href="/useful/login/Mainview";
				}
			}
		});
		
	}
	
	$(document).ready(function(){
		$("#deptno").val("${vo.deptno}").prop("selected", true);
		$("#position").val("${vo.position}").prop("selected", true);
		$("#bank").val("${vo.bank}").prop("selected", true);
		
	}); 
	
	function cancel(){
		location.href="/useful/login/Mainview";
	}
</script>


<style type="text/css">
th {
	background-color: #CCC;
}

</style>



</head><%@include file="../login/Sidebar.jsp" %>
<body>
	<center>
	
	<!-- //contents -->
			<div id="contents">
				<form id="frm">
				
				<input id="menu_cd" name="menu_cd" value="0003" type="hidden" value=""/>
				<input id="pageIdx" name="pageIdx" type="hidden" value=""/>
				<input id="comp_cd" name="comp_cd" value="0002" type="hidden" value=""/>
				<input id="chk_menu" name="chk_menu" type="hidden" value=""/>
				<input id="chk_auth_level" name="chk_auth_level" type="hidden" value=""/>

			<div>
				<font size="5" style="font-style: inherit; margin-right: 300px;">직원정보수정
				</font>
				<button type="button" id="btn_Save" onclick="InfoSave()">저장</button>
				<button type="button" id="btn_List" onclick="cancel()">취소</button>
				<br>
			</div>
			
			<!-- form -->
				<table class="bbs_row">
					<colgroup>
						<col width="150"/>
						<col/>
					</colgroup>
					<tbody> 
						<tr>  
							<th>사원번호</th>
							<td>
								<input type="hidden" id="emp_no_dup_check" value="N"/>
								<input id="empno" name="empno" class="text" type="text" maxlength="20" value="${LoginUser.empno }"/>
								
										<span id="sp_empNoDupMsg" class="blackColor b"></span>

							</td>
						</tr>  
						<tr>  
							<th>사원명        </th>
							<td>
								<input type="hidden" id="emp_id_dup_check" value="N"/>
								<input id="ename" name="ename" class="text" type="text" maxlength="20" value="${LoginUser.ename }"/>
	
										<span id="sp_empIdDupMsg" class="blackColor b"></span>
	
							</td>
						</tr>  
					
						<tr>  
							<th>비밀번호 </th>
							<td>
								<input id="pass" name="pass" class="text" type="password" maxlength="20" value="${vo.pass }"/>
							</td>
						</tr>  
					
						<tr>  
							<th>주민번호        </th>

							<td>
								<input id="ssn" name="ssn" class="text" type="text" maxlength="14" value="${vo.ssn }"/>
							</td>
						</tr>  
						<tr>  
							<th>부서번호</th>
							<td>
								<select id="deptno" name="deptno" class="select" style="width:200px;">
									<option value="">-- 선택 --</option>
										<option value="0">0</option>									
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
										<option value="40">40</option>
										
								</select>
							</td>
						</tr> 
						<tr>  
							<th>직위(직급)        </th>
							<td>
								<select id="position" name="position" class="select" style="width:200px;">
									<option value="">-- 선택 --</option>
									
										<option value="사장">사장</option>
									
										<option value="부장">부장</option>
									
										<option value="대리">대리</option>
									
										<option value="사원">사원</option>
										
								</select>
							</td>
						</tr> 
						
						<tr>
							<th>이메일      </th>
							<td>
								<input id="email" name="email" class="text" style="width:200px;" type="text" maxlength="50" value="${vo.email }"/>
							</td>
						</tr>  
						<tr>  
							<th>핸드폰      </th>
							<td>
								<input id="phone" name="phone" class="text" style="width:200px;" type="text" maxlength="20" value="${vo.phone }"/>&nbsp;&nbsp;(ex: 010-1234-1234)
							</td>
						</tr> 
						<tr>  
							<th>주소      </th>
							<td>
								<input id="address" name="address" class="text" style="width:100%;" type="text" maxlength="100" value="${vo.address }"/>
							</td>
						</tr>
					<tr>
						<th>은행 </th>
						<td><select id="bank" name="bank" class="select" style="width:200px;">
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
							<th>계좌번호 </th>
							<td>
								<input id="account" name="account" class="text" style="width:200px;" type="text" maxlength="15" value="${vo.account }"/>
							</td>
						</tr> 
						<tr>  
							<th>입사일   </th>
							<td>
								<div id="div_inDt">
								<fmt:formatDate value="${vo.hiredate }" pattern="yyyy-MM-dd"/>
								</div>	
							</td>
						</tr>  
					<tr>
						<th>최근접속일</th>
						<td>
							<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm"/>
						</td>
					</tr>
					
					</tbody>  
				</table>  
				</form>
			</div>
			<!-- contents// -->
		</center>
		
</body>
</html>