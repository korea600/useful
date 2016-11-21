<!DOCTYPE html PUBLIC>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
<style>
html, body {
	margin: 0;
	padding: 0;
}

div {
	text-align: center;
}

#wrapper {
	width: 800px;
	overflow: hidden;
	margin: 0 auto;
}

#wrapper #header {
	background-color: #ffff00;
	color: #bbb;
	height: 100px;
}

#wrapper #menu {
	background-color: #bbb;
	height: 50px;
	color: #fff;
	width: 800px;
}

#wrapper #contents {
	background-color: #eee;
	height: 1000px;
}
</style>
<script src="/resources/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(function(){
		var menupos = $("#menu").offset().top;
		$(window).scroll(function() {
			if ($(window).scrollTop() >= menupos) {
				$("#menu").css("position", "fixed");
				$("#menu").css("top", "0");
			} else {
				$("#menu").css("position", "relative");
				$("#menu").css("top", "");
				
			}
		});
	});
</script>
</head>
<body>
	<div id="wrapper">
		<div id="header">header</div>
		<div id="menu">menu</div>
		<div id="contents">contents</div>
	</div>
</body>
</html>