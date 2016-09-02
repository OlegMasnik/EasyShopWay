<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>A Pen by Team  Angular Material</title>
    
    <link rel='stylesheet prefetch' href='${pageContext.request.contextPath}/css/angular-material.min.css'>


    <body ng-app="myApp" ng-cloak layout="column">

  <md-toolbar>
      <div class="md-toolbar-tools">
        <md-button aria-label="Go Back">
          Go Back
        </md-button>
        <a href="HomePage.do">link to home</a>
        <h2>
          <span>Toolbar with Standard Buttons</span>
        </h2>
        <span flex></span>
        <md-button class="md-raised" aria-label="Learn More">
          Learn More
        </md-button>
        <md-button class="md-fab md-mini" aria-label="Favorite">
          <md-icon md-svg-icon="img/icons/favorite.svg"></md-icon>
        </md-button>
      </div>
    </md-toolbar>
  <div flex layout="row">
    <md-sidenav flex="15" md-is-locked-open="true" class="md-whiteframe-z1">
      <md-content>
        Navigation bar
      </md-content>
    </md-sidenav>
    <div layout="column" flex>
      <div class="box1">
        70
      </div>
      <div class="box2">
        fixed
      </div>
      <div class="box3">
        flex
      </div>
    </div>

  </div>


<!--
Copyright 2016 Google Inc. All Rights Reserved. 
Use of this source code is governed by an MIT-style license that can be in foundin the LICENSE file at http://material.angularjs.org/license.
-->
<script src='${pageContext.request.contextPath}/js/angular.js'></script>
<script src='${pageContext.request.contextPath}/js/angular-aria.js'></script>
<script src='${pageContext.request.contextPath}/js/angular-animate.js'></script>
<script src='${pageContext.request.contextPath}/js/angular-material.min.js'></script>
<script src='${pageContext.request.contextPath}/js/app.js'></script>

    
  </body>
</html>