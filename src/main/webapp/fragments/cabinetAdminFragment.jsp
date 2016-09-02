<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div id="sideNavContainer" ng-controller="sideNavController as ctrl"
	class="cotainer" layout="row" flex>
	<md-sidenav class="md-whiteframe-10dp" md-is-locked-open="true"
		style="background-color: lightblue">Sidenaw</md-sidenav>
	<md-content id="content" flex>Content </md-content>

	<md-sidenav md-component-id="left" class="md-sidenav-left md-whiteframe-10dp">Welcome
	to TutorialsPoint.Com</md-sidenav>
</div>

