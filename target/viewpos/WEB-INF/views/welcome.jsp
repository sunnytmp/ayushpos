<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html ng-app="app">
<head>
<link rel="stylesheet" type="text/css" href="mainpage.css">

<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.js"></script>
<script src="app.js"></script>
</head>
<body ng-controller="MainCtrl">

<!-- Adding the ng-app declaration to initialize AngularJS -->
<div>

	<!-- The navigation menu will get the value of the "active" variable as a class.
		 The $event.preventDefault() stops the page from jumping when a link is clicked. -->

	<nav class="{{active}}" ng-click="$event.preventDefault()">
   
		<!-- When a link in the menu is clicked, we set the active variable -->

		<a href="#" class="home" ng-click="noHrefTest()">Home</a>
		<a href="#" class="projects" ng-click="active='projects'">Projects</a>
		<a href="#" class="services" ng-click="active='services'">Services</a>
		<a href="#" class="contact" ng-click="active='contact'">Contact</a>
	</nav>
<div id="content"></div>
	<!-- ng-show will show an element if the value in the quotes is truthful,
		 while ng-hide does the opposite. Because the active variable is not set
		 initially, this will cause the first paragraph to be visible. -->

	<p ng-hide="active">Please click a menu item</p>
	<p ng-show="active">You chose <b>{{active}}</b></p>

</div>
</body>
</html>
