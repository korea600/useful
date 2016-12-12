<%@page import="kr.co.useful.manager.domain.SalaryVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%SimpleDateFormat df = new SimpleDateFormat("yyyy, MM-1, dd, hh, mm, ss");
	SalaryVO vo = (SalaryVO)request.getAttribute("salary");
		String paydate = "0";
		String paymonth = "0";
	if(vo!=null){
		if(vo.getPaymentdate()!=null){
			paydate = df.format(vo.getPaymentdate());
		}
		if(vo.getPaymentmonth()!=null){
			paymonth = df.format(vo.getPaymentmonth());
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>급여수정</title>
 <link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" />
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script> 
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.11.0.min.js"></script>  --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>

<script type="text/javascript">
$(function(){	
	var serial=${salary.serial}
	var empno=${salary.empno}
	var paymentdate=new Date(<%=paydate %>)
	var paymentmonth=new Date(<%=paymonth %>)
	
//	var pay_year =paymentmonth.substring(0,4);
//	var pay_month =paymentmonth.substring(5,7);
	var pay_year =paymentmonth.getFullYear();
	var pay_month =paymentmonth.getMonth()+1;
//	var paymentdate =${salary.paymentdate}
	var basicpay=${salary.basicpay}
	var car=${salary.car}
	var meal=${salary.meal}
	var childcare=${salary.childcare}
	var otherpay=${salary.otherpay}
	
	var national=${salary.national}
	var health=${salary.health}
	var employment=${salary.employment}
	var care=${salary.care}
	var incometax=${salary.incometax}
	var localtax=${salary.localtax}
	var grossincome=${salary.grossincome}
	var deductions=${salary.deductions}
	var adjustedIncome=${salary.adjustedIncome}
	
		//$("#paymentdate").val(paymentdate);
		$("#pay_year").val(pay_year).prop("selected", true);
		if(pay_month<10){
			$("#pay_month").val("0"+pay_month).prop("selected", true);
		}else{
			$("#pay_month").val(pay_month).prop("selected", true);
		}
	
		$("#basicpay").val(basicpay);
		$("#car").val(car);
		$("#meal").val(meal);
		$("#childcare").val(childcare);
		$("#otherpay").val(otherpay);

		$("#national").text(national);
		$("#health").text(health);
		$("#employment").text(employment);
		$("#care").text(care);
		$("#incometax").text(incometax);
		$("#localtax").text(localtax);
		$("#grossincome").text(grossincome);
		$("#deductions").text(deductions);
		$("#adjustedIncome").text(adjustedIncome);
		
 	   $( "#paymentdate" ).datepicker({
 		  changeMonth: true, 
          changeYear: true,
 		  dateFormat: 'yy-mm-dd'
 	   }).datepicker("setDate", new Date(paymentdate));


		$("#btn_Cancel").click(function(){
	 		  location.href="/useful/manager/salary_List";  
		});
		$("#btn_insert").click(function(){
			
			var paymentmonth_in = new Date();
			paymentmonth_in.setFullYear($("#pay_year option:selected").val(),$("#pay_month option:selected").val()-1,01)
			 $.ajax({
				  type: 'POST',
				  url: '/useful/manager/salary_Update',
				  headers : {
					  "Content-Type" : "application/json",
					  "X-HTTP-Method-Override":"POST"
				  },
				  dataType: 'text',
				  data: JSON.stringify({
					  	serial:serial,
				  		empno:empno,
					 	basicpay: $("#basicpay").val(),
					  	paymentdate:$("#paymentdate").val(),
					 	paymentmonth:paymentmonth_in,
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
				  success: function(){
					  alert('수정되었습니다');
					  location.href="/useful/manager/salary_List";
					  }
			
				}); 
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
                    <h1 class="page-header">급여수정</h1>
                </div>
            </div>
	<p>※사원정보</p>
	<div id="emptable">
	<table class='table table-striped table-bordered table-hover' style='text-align: center;' >
		<tr>
			<td>사번</td>
			<td>${salary.empno}</td>
			<td>사원명</td>
			<td>${salary.ename}</td>
			<td>부서</td>
			<td>${salary.dname}</td>
			<td>직책</td>
			<td>${salary.position}</td>
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
			<input type="button" id="btn_insert"  class="btn btn-warning"  value="수정" /> 
			<input type="button" id="btn_Cancel"  class="btn btn-default" value="취소" />
		</div>
		<br>
		<br>
		<br>
		<br>
</div>

</body>
</html>