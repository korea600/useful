<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>월별근퇴현황</title>
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

		$("#btn_close").click(function() {
			$("#popup").fadeOut(500);
		});
		$("#btn_search").click(function() {
			searchDate();
		});
	});
	function searchDate() {
		$.ajax({
			type : 'POST',
			url : '/useful/manager/commute_Monthly',
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
		}
	}
	function search_oneday(date, checked) {
		$.ajax({
			type : 'POST',
			url : '/useful/manager/commute_Monthly_Oneday',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				checked : checked,
				login : date
			}),
			success : function(result) {
				$("#popup_inside").html(result);
				$("#popup").fadeIn(700);
			}
		});

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
                    <h1 class="page-header">월별 근태집계</h1>
                </div>
            </div>

		<table class="table table-striped table-bordered table-hover">
				<tr>
					<th style="text-align: center;">부서</th>
					<td><select id="dept" class="form-control-static"	>
							<option value="0" selected="selected">전체</option>
							<option value="10">잘했조</option>
							<option value="20">보여조</option>
							<option value="30">강조</option>
							<option value="40">삼삼오오조</option>
					</select></td>
				</tr>
				<tr>
					<th style="text-align: center;">근무월</th>
					<td>
				<select name="search_year" id="search_year" style='width: 80px;'
						class="form-control-static"	>
					<%
					for (int i = 2010; i < 2019; i++) {
				%>
				<option value="<%=i%>"><%=i%>년
				</option>
				<%
					}
				%>
			</select> <select name="search_month" id="search_month" style='width: 80px;'
				 class="form-control-static">
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
					
					</td>
				</tr>
				</tbody>
			</table>
					<div style="text-align: center;">
					<button id="btn_search" class="btn btn-warning">검색</button>
					</div>
			<br>
					<div id="div_print">
						<table class="table table-striped table-bordered table-hover" style="width: 100%;">
							<tr>
								<th style="text-align: center;" width="14%">월</th>
								<th style="text-align: center;" width="14%">화</th>
								<th style="text-align: center;" width="14%">수</th>
								<th style="text-align: center;" width="14%">목</th>
								<th style="text-align: center;" width="14%">금</th>
								<th style="text-align: center;" width="14%">토</th>
								<th style="text-align: center;" width="14%">일</th>
							</tr>
							<tr>
								<td colspan="7"><b>데이터를 로딩중입니다...</b></td>
							</tr>
						</table>
					</div>
				</div>
		
		<div id="popup" class="overlay"
			style="z-index: 25; display: none; position: fixed; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.6); width: 100%; height: 100%;">
			<div
				style="background-color: white; width: 50%; height: 65%; margin-left: 20%; margin-top: 10%; border: 1px solid black;overflow:auto;">

				<br>
				<div id="popup_inside"></div>
				<button style="text-align: center;" type="button" class="btn btn-default" id="btn_close">닫기</button>


			</div>
		</div>
</body>
</html>