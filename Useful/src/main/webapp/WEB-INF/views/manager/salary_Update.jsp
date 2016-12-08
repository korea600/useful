<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>급여금액수정</title>
 <link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script> 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.11.0.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>

<script type="text/javascript">
$(function(){	
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
					 	basicpay: $("#basicpay").val(),
					  	Paymentdate:$("#Paymentdate").val,
					 	Paymentmonth: $("#pay_year option:selected").val()+$("#pay_month option:selected").val()+"00",
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
					  },
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
				}); 
		});
		$("#btn_close").click(function(){
 			$("#popup").fadeOut(500);
 		});
		
		$("#basicpay").keyup(function(){ 
			var basic= parseInt($("#basicpay").val());
			var standard_income=0;
			if(basic<280000){
				standard_income=280000;
			}else if(basic>4340000){
				standard_income=4340000;
			}else{
				standard_income=basic*0.045;
			}
			var national = basic *0.0306;
			var health  =basic *0.03275;
			var employment =basic *0.0065;
			var care  =basic*0.0655;
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
			incometax=incometax12/12;
			var localtax=incometax*0.01;
			
			var car = parseInt($("#car").val());
			var meal= parseInt($("#meal").val());
			var childcare= parseInt($("#childcare").val());
			var otherpay= parseInt($("#otherpay").val());
			//var grossincome = parseInt(basic)+parseInt(car)+parseInt(meal)+parseInt(childcare)+parseInt(otherpay);
			var grossincome= basic+car+meal+childcare+otherpay;
			var deductions =	national+ health+employment+care+incometax+localtax;
			var adjustedIncome = grossincome-deductions;
			$("#national").text(national);
			$("#health").text(health);
			$("#employment").text(employment);
			$("#care").text(care);
			$("#incometax").text(incometax);
			$("#localtax").text(localtax);
			$("#grossincome").text(grossincome);
			$("#deductions").text(deductions);
			$("#adjustedIncome").text(adjustedIncome);
		});
		$("#car").keyup(function(){ 
			var basic= parseInt($("#basicpay").val());
			var car = parseInt($("#car").val());
			var meal= parseInt($("#meal").val());
			var childcare= parseInt($("#childcare").val());
			var otherpay= parseInt($("#otherpay").val());
			alret("basic:"+basic+"차 "+car+meal+"보육 "+childcare+"기타 "+otherpay);
			var grossincome= basic+car+meal+childcare+otherpay;
			var deductions=$("#deductions").text();
			var adjustedIncome= grossincome-deductions;
			$("#grossincome").empty();
			$("#deductions").empty();
			$("#adjustedIncome").empty();
			$("#grossincome").text(grossincome);
			$("#deductions").text(deductions);
			$("#adjustedIncome").text(adjustedIncome);
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
function call_select(empno,ename,dname,position){
	$("#emptable").html("<table><tr><td>사번</td><td>"+empno+"</td><td>사원명</td><td>"+ename+"</td><td>부서</td><td>"+
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
	<p>
		<font size="5" style="font-style: inherit;">급여등록</font>
		<input type="button" id="btn_insert" value="등록" /> 
		<input type="button" id="btn_Cancel" value="취소" />
	</p>
	<hr>
	<p>※사원정보</p>
	<div id="emptable">
	<table>
		<tr>
			<td>사번</td>
			<td>empno</td>
			<td>사원명</td>
			<td>ename</td>
			<td>부서</td>
			<td>dname</td>
			<td>직책</td>
			<td>position</td>
		</tr>
	</table>
	</div>
	<br>
	<p>※지급정보</p>
	<table>
	 <tr>
	 	<td>지급일</td>
	 	<td><input id="paymentdate" type="text"></td>
	 	<td>귀속월</td> 
	 	<td><select name="pay_year" id="pay_year" style='width:80px;' >
 												<%for(int i=2010;i<2019;i++){ %>
												<option value="<%=i%>" ><%=i%>년</option>
												<%} %> 
											</select>
					<select name="pay_month" id="pay_month" style='width:80px;' >
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
	<table>
	 	<tr>
			<th colspan="2">수당</th>
			<th colspan="2">공제</th>
	 	</tr>
	 	<tr>
	 		<td>기본급</td>
	 		<td><input id="basicpay" type="text"></td>
	 		<td>국민연금</td>
	 		<td><div id="national"></div></td>
	 	</tr>
	 	<tr>
	 		<td>차량유지비</td>
	 		<td><input id="car" type="text"></td>
	 		<td>건강보험</td>
	 		<td><div id="health"></div></td>
	 	</tr>
	 	<tr>
	 		<td>식대보조금</td>
	 		<td><input id="meal" type="text"></td>
	 		<td>고용보험</td>
	 		<td><div id="employment"></div></td>
	 	</tr>
	 	<tr>
	 		<td>보육수당</td>
	 		<td><input id="childcare" type="text"></td>
	 		<td>장기요양보험</td>
	 		<td><div id="care"></div></td>
	 	</tr>
	 	<tr>
	 		<td>기타수당</td>
	 		<td><input id="otherpay" type="text"></td>
	 		<td>소득세</td>
	 		<td><div id="incometax"></div></td>
	 	</tr>
	 	<tr>
	 		<td></td>
	 		<td></td>
	 		<td>지방소득세</td>
	 		<td><div id="localtax"></div></td>
	 	</tr>
	</table>
	<br>
	<p>※합계</p>
	<table>
	<tr>
		<td>지급합계</td>
	 	<td><div id="grossincome"></div></td>
		<td>공제합계</td>
	 	<td><div id="deductions"></div></td>
		<td>차인지급액</td>
	 	<td><div id="adjustedIncome"></div></td>
	</tr>
	</table>
</div>

</body>
</html>