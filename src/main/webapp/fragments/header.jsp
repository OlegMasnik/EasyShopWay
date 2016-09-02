<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<md-toolbar class="md-hue-2">
<div class="md-toolbar-tools" ng-controller="sideNavController as ctrl">
	<md-button ng-click="openLeftMenu()" class="md-primary md-raised">
	Search </md-button>
	<h2>
		<span>EasyShopWay</span>
	</h2>
	<span flex></span>
	<div ng-controller='DialogController' >
		<md-button class="md-primary md-raised" ng-click="openCabinet()">
		Cabinet </md-button>
		<md-button class="md-primary md-raised"
			ng-click="showSignUpDialog($event)"> SignUp </md-button>
		<md-button class="md-primary md-raised"
			ng-click="showLoginDialog($event)"> LogIn </md-button>
	</div>
</div>
</md-toolbar>
