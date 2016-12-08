<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부서별 근태집계</title>
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
		var now = new Date();
		var month = now.getMonth() + 1;
		var year = now.getFullYear();
		$("#search_year").val(year).prop("selected", true);
		$("#search_month").val(month).prop("selected", true);
		searchDate();
	});
	function searchDate() {
		$.ajax({
			type : 'POST',
			url : '/useful/manager/commute_Dept',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				dept : $("#dept option:selected").val(),
				year : $("#search_year option:selected").val(),
				month : $("#search_month option:selected").val()
			}),
			success : function(result) {
				$("#div_print").html(result);
			}
		});
	}

	function changeMonthprev() {
		var nowmonth = $("#search_month option:selected").val()
		if (nowmonth != 1) {
			$("#search_month").val(nowmonth - 1).prop("selected", true);
			searchDate();
		}
	}
	function changeMonthnext() {
		var nowmonth = $("#search_month option:selected").val()
		if (nowmonth != 12) {
			nowmonth = nowmonth + 1
			$("#search_month").val(nowmonth).prop("selected", true);
			searchDate();
		}
	}
</script>
</head>
<body>
	<header><%@include file="/WEB-INF/views/manager/Main.jsp"%></header>
	<div>
		<jsp:include page="/WEB-INF/views/manager/Sidebar.jsp"></jsp:include>
	</div>
	<!-- commute_Dept.jsp -->
	<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">부서별 근태집계</h1>
                </div>
            </div>
		<div>
			<table style="width: 80%; border-color: black;">
				<tr>
					<th align="center">부서</th>
					<td><select id="dept" class="form-control" onChange='searchDate()'>
							<option value="0" selected="selected">-- 선택 --</option>
							<option value="10">잘했조</option>
							<option value="20">보여조</option>
							<option value="30">강조</option>
							<option value="40">삼삼오오조</option>
					</select></td>
				</tr>
				</tbody>
			</table>
			<br>
		</div>
		<div class="form-group">
			<select name="search_year" id="search_year" style='width: 80px;'
				onChange='searchDate()' class="form-control"	>
				<%
					for (int i = 2010; i < 2019; i++) {
				%>
				<option value="<%=i%>"><%=i%>년
				</option>
				<%
					}
				%>
			</select> <select name="search_month" id="search_month" style='width: 80px;'
				onChange='searchDate()' class="form-control">
				<%
					for (int i = 1; i < 13; i++) {
						if (i < 10) {
				%>

				<option value="0<%=i%>"><%=i%>월
				</option>
				<%
					} else {
				%>
				<option value="<%=i%>"><%=i%>월
				</option>
				<%
					}
					}
				%>
			</select>
		</div>
		<div id="div_print">
			<div class="panel-heading"></div>

			<div class="panel-body">

				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th width="20%">부서</th>
								<th width="20%">사원</th>
								<th width="10%">출근</th>
								<th width="10%">지각</th>
								<th width="10%">결근</th>
								<th width="10%">휴가</th>
								<th width="10%">출장</th>
								<th width="10%">조퇴</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="8"><b>데이터를 로딩중입니다...</b></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</body>
</html>