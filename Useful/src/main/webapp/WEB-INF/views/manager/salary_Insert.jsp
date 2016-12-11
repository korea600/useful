<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>급여등록</title>
 <link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script> 
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.11.0.min.js"></script>  --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>

<script type="text/javascript">
$(function(){	
	var now = new Date();
	var month = now.getMonth() + 1;
	var year = now.getFullYear();
	$("#pay_year").val(year).prop("selected", true);
	$("#pay_month").val(month).prop("selected", true);
	var empno_ex;
	
		$("#basicpay").val(parseInt(0));
		$("#car").val(parseInt(0));
		$("#meal").val(parseInt(0));
		$("#childcare").val(parseInt(0));
		$("#otherpay").val(parseInt(0));
		
 	   $( "#paymentdate" ).datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd'
 	   });
		$("#input_empno").click(function(){
			$("#popup").fadeIn(700);
		});
		
		$("#input_ename").click(function(){
			$("#popup").fadeIn(700);
		});
		$("#pop_search").click(function(){
			search_emp();
		});
		$("#btn_Cancel").click(function(){
	 		  location.href="/useful/manager/salary_List";  
		});
		$("#btn_insert").click(function(){
			 $.ajax({
				  type: 'POST',
				  url: '/useful/manager/salary_Insert',
				  headers : {
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override":"POST"
				  },
				  dataType: 'text',
				  data: JSON.stringify({
				  		empno:empno_ex,
					 	basicpay: $("#basicpay").val(),
					  	Paymentdate:$("#Paymentdate").val,
					 	Paymentmonth: $("#pay_year option:selected").val()+$("#pay_month option:selected").val(),
						basic: $("#basicpay").val(),
						car : $("#car").val(),
						meal: $("#meal").val(),
						childcare: $("#childcare").val(),
						otherpay: $("#otherpay").val(),
					  	national: $("#national").text(),
					  	health:$("#health").text(),
					  	employment:$("#employment").text(),
					  	care:$("#care").text(),
				  		incometax:$("#incometax").text(),
				  		localtax:$("#localtax").text(),
				  		grossincome:$("#grossincome").text(),
				  		deductions:$("#deductions").text(),
				  		adjustedIncome:$("#adjustedIncome").text()
					}),
				  success: function(result){
					  location.href="/useful/manager/salary_List";
					  alert('입력되었습니다');
					  },
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    alert('이미 등록된 정보가 존재 합니다.')
				}
				}); 
		});
		$("#btn_close").click(function(){
 			$("#popup").fadeOut(500);
 		});
		
		$("#basicpay").keyup(function(){ 
			clear();			
			calc();
		});
		$("#car").keyup(function(){ 
			clear();			
			calc();
		});
		$("#meal").keyup(function(){ 
			clear();			
			calc();
		});
		$("#childcare").keyup(function(){ 
			clear();			
			calc();
		});
		$("#otherpay").keyup(function(){ 
			clear();			
			calc();
		});
		
});
function search_emp(){
	 $.ajax({
		  type: 'POST',
		  url: '/useful/manager/emp_search',
		  headers : {
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override":"POST"
		  },
		  dataType: 'text',
		  data: JSON.stringify({
			searchType:$("#searchType option:selected").val(),
			keyword:$("#input_search").val()
			
			  }),
		  success: function(result){
				$("#pop_print").html(result);
			  },
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		}); 
}
function clear(){
			$("#grossincome").empty();
			$("#deductions").empty();
			$("#adjustedIncome").empty();
}
function calc(){

	var basic= parseInt($("#basicpay").val());
	var standard_income=0;
		if(basic<280000){
			standard_income=280000;
		}else if(basic>4340000){
			standard_income=4340000;
		}else{
			standard_income=basic*0.045;
		}
		var national = parseInt(basic *0.0306);
		var health  =parseInt(basic *0.03275);
		var employment =parseInt(basic *0.0065);
		var care  =parseInt(basic*0.0655);
		var incometax=0;
		var incometax12=0;
		var basic12=basic*12;
		if(basic12<=30000000){
			incometax12=310000+basic*0.04;
		}else if(basic12>30000000&&basic12<=45000000){
			incometax12=3100000+(basic*0.04)-(basic12-3000)*0.05;
		}else if(basic12>45000000&&basic12<=70000000){
			incometax12=3100000+(basic*0.015);
		}else if(basic12>70000000&&basic12<=120000000){
			incometax12=3100000+(basic*0.005);
		}
		incometax=parseInt(incometax12/12);
		var localtax=parseInt(incometax*0.01);
		var car = parseInt($("#car").val());
		var meal= parseInt($("#meal").val());
		var childcare=  parseInt($("#childcare").val());
		var otherpay=  parseInt($("#otherpay").val());
		//var grossincome = parseInt(basic)+parseInt(car)+parseInt(meal)+parseInt(childcare)+parseInt(otherpay);
		var grossincome =parseInt(0); 
		grossincome= basic+car+meal+childcare+otherpay;
		var deductions = parseInt(0);
		deductions=	national+ health+employment+care+incometax+localtax;
		var adjustedIncome = parseInt(0);
		adjustedIncome = grossincome-deductions;
		
		$("#national").text(national);
		$("#health").text(health);
		$("#employment").text(employment);
		$("#care").text(care);
		$("#incometax").text(incometax);
		$("#localtax").text(localtax);
		
		$("#grossincome").text(grossincome);
		$("#deductions").text(deductions);
		$("#adjustedIncome").text(adjustedIncome);
}

function call_select(empno,ename,dname,position){
	empno_ex=empno;
	$("#emptable").html("<table class='table table-striped table-bordered table-hover' style='text-align: center;' ><tr><td>사번</td><td>"+empno+"</td><td>사원명</td><td>"+ename+"</td><td>부서</td><td>"+
						dname+"</td><td>직책</td><td>"+position+"</td></tr></table>");
	$("#popup").fadeOut(500);
}
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
                    <h1 class="page-header">급여등록</h1>
                </div>
            </div>
	<p>※사원정보</p>
	<div id="emptable">
	<table class="table table-striped table-bordered table-hover">
	 <tr>
	 	<td width="20%">사번</td>
	 	<td width="30%"><input id="input_empno" type="text"></td>
	 	<td width="20%">사원명</td> 
	 	<td width="30%"><input id="input_ename"type="text"></td>
	 </tr>
	</table>
	</div>
	<br>
	<p>※지급정보</p>
	<table class="table table-striped table-bordered table-hover">
	 <tr>
	 	<td width="20%">지급일</td>
	 	<td width="30%"><input id="paymentdate" type="text"></td>
	 	<td width="20%">귀속월</td> 
	 	<td width="30%"><select name="pay_year" id="pay_year"  class="form-control-static"	style='width:80px;' >
 												<%for(int i=2010;i<2019;i++){ %>
												<option value="<%=i%>" ><%=i%>년</option>
												<%} %> 
											</select>
					<select name="pay_month" id="pay_month"  class="form-control-static"	style='width:80px;' >
 						<%for(int i=1;i<13;i++){
 						if(i<10){%>
 						
						<option value="0<%=i%>"><%=i%>월</option>
						<%}else{ %>
						<option value="<%=i%>"><%=i%>월</option>
						<%} }%> 
					</select></td> 
	 </tr>
	</table>
	<br>
	<p>※금액정보</p>
	<table class="table table-striped table-bordered table-hover">
	 	<tr>
			<th colspan="2"   width="50%">수당</th>
			<th colspan="2"  width="50%">공제</th>
	 	</tr>
	 	<tr>
	 		<td  width="20%">기본급</td>
	 		<td  width="30%"><input id="basicpay" type="text">원</td>
	 		<td  width="20%">국민연금</td>
	 		<td  width="30%"><span id="national"></span>원</td>
	 	</tr>
	 	<tr>
	 		<td>차량유지비</td>
	 		<td><input id="car" type="text">원</td>
	 		<td>건강보험</td>
	 		<td><span id="health"></span>원</td>
	 	</tr>
	 	<tr>
	 		<td>식대보조금</td>
	 		<td><input id="meal" type="text">원</td>
	 		<td>고용보험</td>
	 		<td><span id="employment"></span>원</td>
	 	</tr>
	 	<tr>
	 		<td>보육수당</td>
	 		<td><input id="childcare" type="text">원</td>
	 		<td>장기요양보험</td>
	 		<td><span id="care"></span>원</td>
	 	</tr>
	 	<tr>
	 		<td>기타수당</td>
	 		<td><input id="otherpay" type="text">원</td>
	 		<td>소득세</td>
	 		<td><span id="incometax"></span>원</td>
	 	</tr>
	 	<tr>
	 		<td></td>
	 		<td></td>
	 		<td>지방소득세</td>
	 		<td><span id="localtax"></span>원</td>
	 	</tr>
	</table>
	<br>
	<p>※합계</p>
	<table class="table table-striped table-bordered table-hover">
	<tr>
		<td width="15%">지급합계</td>
	 	<td  width="20%"><span id="grossincome"></span>원</td>
		<td  width="15%">공제합계</td>
	 	<td  width="15%"><span id="deductions"></span>원</td>
		<td  width="15%">차인지급액</td>
	 	<td  width="20%"><span id="adjustedIncome"></span>원</td>
	</tr>
	</table>
		<div style="text-align: center;">
			<input type="button" id="btn_insert"  class="btn btn-warning"  value="등록" /> 
			<input type="button" id="btn_Cancel"  class="btn btn-default" value="취소" />
		</div>
		<br>
		<br>
		<br>
		<br>
</div>
<div id="popup" class="overlay"
		style="z-index: 25; display: none; position: fixed; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.6); width: 100%; height: 100%;">
		<div
			style="background-color: white; width: 50%; height: 60%; margin-left: 20%; margin-top: 10%;  border: 1px solid black;overflow:auto; ">

			<br>
		<table class="table" style="margin-left: 30px;margin-top: 10px;margin-right: 30px;width: 90%;">
				<tr>
					<td colspan="2" align="center">연차 변경페이지</td>
				</tr>
		<tr> <td colspan="2" align="center"> <select id="searchType" name="searchType" class="form-control-static"	>
						<option value="divGbn" selected="selected">전체</option>
						<option value="ename">성명</option>
						<option value="empno">사번 </option>
						<option value="dname">부서</option>
						<option value="position">직책</option>
						</select>	<input id="input_search" type="text">
			<button type="button" class="btn btn-warning" id="pop_search">검색</button>
			<button type="button" class="btn btn-default" id="btn_close">닫기</button>
				</td>
			</tr>
			</table>
		<div id="pop_print"></div>
		  
		</div>
</div>
</body>
</html>