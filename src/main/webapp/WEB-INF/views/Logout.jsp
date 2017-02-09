<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <link href="<c:url value='/static/css/mainpage.css' />" rel="stylesheet"></link>


<!--  <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>  -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="<c:url value='/static/js/app.js' />"></script>
<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
  <script src="<c:url value='/static/js/service/user_service.js' />"></script>	
<script src="<c:url value='/static/js/controller/cat_controller.js' />"></script>
<script src="<c:url value='/static/js/service/cat_service.js' />"></script>
<script src="<c:url value='/static/js/service/item_service.js' />"></script>
<script src="<c:url value='/static/js/controller/item_controller.js' />"></script>
 <script src="<c:url value='/static/js/service/po_service.js' />"></script>
<script src="<c:url value='/static/js/controller/po_controller.js' />"></script>
  
</head>
  <body ng-app="myApp" class="ng-cloak">
  <% 
  HttpSession session2= request.getSession(false);
  session2.removeAttribute("userid_apos");
  session2.invalidate();
		out.print("Thank you for using AyushPos, A unique point of sale system from RiverLog Software.<br>");
		out.print("You are now logged out! Please Login with appropriate credentials to use this system<br>");
		out.print("Un-Authorized attempts will be notified and action taken!");
	  
  %> 
  <jsp:forward page="login.jsp" />