<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>증명서관리</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jqGrid/js/jquery-1.11.0.min.js"></script> 
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>  
<script type="text/javascript">
	$(function(){
	var now = new Date();
	var month=now.getMonth()+1;
	var year=now.getFullYear();
	$("#search_year").val(year).prop("selected", true);
	$("#search_month").val(month).prop("selected", true);
	$("#send_data").click(function(){
		 $.ajax({
			  type: 'POST',
			  url: '/useful/mypage/proof_Of_emp',
			  headers : {
				  "Content-Type" : "application/json",
				  "X-HTTP-Method-Override":"POST"
			  },
			  dataType: 'text',
			  data: JSON.stringify({
				empno:${LoginUser.empno},
				purpose:$("#purpose_of_use").val(),
				  }),
			  success: function(result){
				  self.location(result);
					//$("#div_print").html(result);
			  }
			});
	});
});
function button_click(){
	 $.ajax({
		  type: 'POST',
		  url: '/useful/mypage/proof_Of_emp',
		  headers : {
			  "Content-Type" : "application/json",
			  "X-HTTP-Method-Override":"POST"
		  },
		  dataType: 'text',
		  data: JSON.stringify({
			empno:${LoginUser.empno},
			purpose:$("#purpose_of_use").val(),
			  }),
		  success: function(result){
			  self.location(result);
				//$("#div_print").html(result);
		  }
		});
}
</script>
</head>
<body>
<br>
<font size="5" style="font-style: inherit;">증명서 출력</font><br><hr>
사용용도 : <input type="text" id="purpose_of_use"><br>
<a href="#"  onclick="button_click()" ><img src="/useful/resources/image/filedownload.GIF" ></a>
</body>
</html>