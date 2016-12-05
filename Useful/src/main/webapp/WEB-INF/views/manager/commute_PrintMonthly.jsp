<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px; width: 100%;">
	<tr>
		<th width="14%">월</th>
		<th width="14%">화</th>
		<th width="14%">수</th>
		<th width="14%">목</th>
		<th width="14%">금</th>
		<th width="14%">토</th>
		<th width="14%">일</th>
	</tr>
<c:forEach items="${commute }" var="print" varStatus="status">
	<c:set var="login" value="${print.login }"/>
	<c:set var="date_string" value="${fn:substring(login,6,8)}"/>
	<c:if test="${date_string==1}">
		<c:choose>
			<c:when test="${ print.whatday ==2}">
			 	<tr>
			</c:when>
			<c:when test="${ print.whatday ==3}">
			 	<tr><td></td>
			</c:when>
			<c:when test="${ print.whatday==4}">
			 	<tr><td></td><td></td>
			</c:when>
			<c:when test="${ print.whatday==5}">
			 	<tr><td></td><td></td><td></td>
			</c:when>
			<c:when test="${ print.whatday==6}">
			 	<tr><td></td><td></td><td></td><td></td>
			</c:when>
			<c:when test="${ print.whatday==7}">
			 	<tr><td></td><td></td><td></td><td></td><td></td>
			</c:when>
			<c:when test="${ print.whatday==1}">
			 	<tr><td></td><td></td><td></td><td></td><td></td><td></td>
			</c:when>
		</c:choose>
	</c:if>
	<c:if test="${print.whatday==2&&date_string>7}">
		<tr>
	</c:if>
			<td>
				 <br>${date_string } <br>
				<a onclick="search_oneday('${print.login}','출근')"><img src="/useful/resources/image/icon_work.gif" ></a> ${print.attendance }<br>
				<a onclick="search_oneday('${print.login}','지각')"><img src="/useful/resources/image/icon_late.gif"  ></a> ${print.late }<br>
				<a onclick="search_oneday('${print.login}',null)" ><img src="/useful/resources/image/icon_acc.gif" ></a> ${print.acc } <br><br>
				합계=${print.total }			
				<br>
			</td>
	<c:if test="${print.whatday==1}">
		</tr>
	</c:if>
		</c:forEach>
		</table>
		

</body>
</html>
