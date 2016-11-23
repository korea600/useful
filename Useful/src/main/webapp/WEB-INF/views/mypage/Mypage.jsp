<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인정보수정</title>
<style type="text/css">
th {
	background-color: #CCC;
}

</style>
</head>
<body>
	<!-- //contents -->
			<div id="contents">
				<form id="frm" action="/member/moveMemberNew.do" method="post">
				
				<input id="menu_cd" name="menu_cd" value="0003" type="hidden" value=""/>
				<input id="pageIdx" name="pageIdx" type="hidden" value=""/>
				<input id="comp_cd" name="comp_cd" value="0002" type="hidden" value=""/>
				<input id="chk_menu" name="chk_menu" type="hidden" value=""/>
				<input id="chk_auth_level" name="chk_auth_level" type="hidden" value=""/>

			<div>
				<font size="5" style="font-style: inherit; margin-right: 300px;">직원정보수정
				</font>
				<button id="btn_Save">저장</button>
				<button id="btn_List">목록</button>
				<br>
			</div>
			<hr>
			<!-- form -->
				<table class="bbs_row">
					<colgroup>
						<col width="150"/>
						<col/>
					</colgroup>
					<tbody> 
						<tr>  
							<th>사원번호*</th>
							<td>
								<input type="hidden" id="emp_no_dup_check" value="N"/>
								<input id="empno" name="empno" class="text" type="text" maxlength="20"/>
								
										<span id="sp_empNoDupMsg" class="blackColor b"></span>

							</td>
						</tr>  
						<tr>  
							<th>사원명        *</th>
							<td>
								<input type="hidden" id="emp_id_dup_check" value="N"/>
								<input id="ename" name="ename" class="text" type="text" maxlength="20"/>
	
										<span id="sp_empIdDupMsg" class="blackColor b"></span>
	
							</td>
						</tr>  
					
						<tr>  
							<th>비밀번호*</th>
							<td>
								<input id="pass" name="pass" class="text" type="password" maxlength="20"/>
							</td>
						</tr>  
					
						<tr>  
							<th>주민번호        *</th>
							<td>
								<input id="ssn" name="ssn" class="text" type="text" maxlength="14"/>
							</td>
						</tr>  
						<tr>  
							<th>부서번호*</th>
							<td>
								<select id="deptno" name="deptno" class="select" style="width:200px;">
									<option value="">-- 선택 --</option>
										<option value="0">0</option>									
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
										
								</select>
							</td>
						</tr> 
						<tr>  
							<th>직위(직급)        *</th>
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
							<th>이메일</th>
							<td>
								<input id="email" name="email" class="text" style="width:200px;" type="text" maxlength="50"/>
							</td>
						</tr>  
						<tr>  
							<th>핸드폰      *</th>
							<td>
								<input id="phone" name="phone" class="text" style="width:200px;" type="text" maxlength="20"/>&nbsp;&nbsp;(ex 010-1234-1234)
							</td>
						</tr> 
						<tr>  
							<th>주소      </th>
							<td>
								<input id="address" name="address" class="text" style="width:100%;" type="text" maxlength="100"/>
							</td>
						</tr>
					<tr>
						<th>은행</th>
						<td><select id="bank" name="bank" class="select" style="width:200px;">
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
							<td>
								<input id="account" name="account" class="text" style="width:200px;" type="text" maxlength="100"/>
							</td>
						</tr> 
						<tr>  
							<th>입사일   </th>
							<td>
								<div id="div_inDt">
								<input id="hiredate" name="hiredate" class="text" type="text" value="2016-11-23" maxlength="11"/>
								</div>	
							</td>
						</tr>  
					
					</tbody>  
				</table>  
				</form>
			</div>
			<!-- contents// -->
		</div>
</body>
</html>