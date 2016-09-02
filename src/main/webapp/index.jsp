<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/angular-material.min.css">
</head>
<body ng-app='toolbarDemo1'>
	<div ng-controller="SideNavCtrl" layout="column" ng-cloak>

		<jsp:include page="fragments/header.jsp"></jsp:include>
		<jsp:include page="fragments/sidebar.jsp"></jsp:include>
		<jsp:include page="fragments/mainContent.jsp"></jsp:include>
	</div>
	
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	
	<script src='${pageContext.request.contextPath}/js/angular.js'></script>
	<script src='${pageContext.request.contextPath}/js/angular-aria.js'></script>
	<script src='${pageContext.request.contextPath}/js/angular-animate.js'></script>
	<script src='${pageContext.request.contextPath}/js/angular-material.min.js'></script>
	<script src='${pageContext.request.contextPath}/js/app.js'></script>

	<script src="${pageContext.request.contextPath}/js/index.js"></script>

</body>
</html>