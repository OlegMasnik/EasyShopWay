<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/angular-material.min.css">
</head>
<body ng-app='toolbarDemo1'>
	<div ng-controller="SideNavCtrl" layout="column" ng-cloak>

		<md-toolbar class="md-hue-2">
		<div class="md-toolbar-tools">
			<md-button ng-click="toggleLeft()" class="md-primary md-raised">
			Search </md-button>
			<h2>
				<span>EasyShopWay</span>
			</h2>
			
			<span flex></span>
			<div ng-controller='DialogController'>
				<md-button class="md-primary md-raised"
					ng-click="showSignUpDialog($event)"> SignUp </md-button>
				<md-button class="md-primary md-raised"
					ng-click="showLoginDialog($event)"> LogIn </md-button>
			</div>
		</div>
		</md-toolbar>

		<!--        End of-->

		<!--        Sidenav-->
		<div ng-controller="ToolBarCtrl" layout="column" ng-cloak>
			<section layout="row" flex> <md-sidenav
				class="md-sidenav-left" md-component-id="left" md-whiteframe="4">
			<md-toolbar class="md-theme-indigo">
			<h1 class="md-toolbar-tools">Disabled Backdrop</h1>
			</md-toolbar>

			<div ng-controller="InputProdTypeCtrl as ctrl" layout="column"
				ng-cloak>
				<md-content class="md-padding autocomplete" layout="column">

				<h2 class="md-title">Searching asynchronously.</h2>
				<md-contact-chips ng-model="ctrl.asyncContacts"
					md-contacts="ctrl.delayedQuerySearch($query)"
					md-contact-name="name" md-contact-image="image"
					md-contact-email="email" md-require-match="true"
					md-highlight-flags="i" filter-selected="ctrl.filterSelected"
					placeholder="To"> </md-contact-chips> <md-list class="fixedRows">
				<md-subheader class="md-no-sticky">Contacts</md-subheader> <md-list-item
					class="md-2-line contact-item"
					ng-repeat="(index, contact) in ctrl.allContacts"
					ng-if="ctrl.contacts.indexOf(contact) < 0"> <img
					ng-src="{{contact.image}}" class="md-avatar" alt="{{contact.name}}" />
				<div class="md-list-item-text compact">
					<h3>{{contact.name}}</h3>
					<p>{{contact.email}}</p>
				</div>
				</md-list-item> <md-list-item class="md-2-line contact-item selected"
					ng-repeat="(index, contact) in ctrl.contacts"> <img
					ng-src="{{contact.image}}" class="md-avatar" alt="{{contact.name}}" />
				<div class="md-list-item-text compact">
					<h3>{{contact.name}}</h3>
					<p>{{contact.email}}</p>
				</div>
				</md-list-item> </md-list> <br>

				</md-content>
			</div>

			<md-button ng-click="toggleLeft()" class="md-accent">
			Close this Sidenav </md-button> </md-sidenav> </section>
		</div>
		<!--        End of sidenav-->

		<!--       Content -->

		<md-content class='md-padding' layout="column" flex> </md-content>
		<!--        End of content-->



		<!--    Footer-->

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