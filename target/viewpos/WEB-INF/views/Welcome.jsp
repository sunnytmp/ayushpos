<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 

<!--  <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>  -->

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>


   <script src="<c:url value='/static/js/app.js' />"></script>

<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
<script src="<c:url value='/static/js/service/user_service.js' />"></script>	
  
  
<script src="<c:url value='/static/js/controller/cat_controller.js' />"></script>
<script src="<c:url value='/static/js/service/cat_service.js' />"></script>

<script src="<c:url value='/static/js/controller/item_controller.js' />"></script>
<script src="<c:url value='/static/js/service/item_service.js' />"></script>


<script src="<c:url value='/static/js/controller/po_controller.js' />"></script>
<script src="<c:url value='/static/js/service/po_service.js' />"></script>

<script src="<c:url value='/static/js/controller/sup_controller.js' />"></script>
<script src="<c:url value='/static/js/service/supplier_service.js' />"></script>

    <script> var myaws = 'http://localhost'; </script> 
 <!-- <script> var myaws = 'http://ec2-52-25-144-174.us-west-2.compute.amazonaws.com'; </script> -->
</head>
  <body ng-app="myApp" class="ng-cloak">
  <% if (request.getSession().getAttribute("userid_apos") == null) {
	  out.print("Un-Authorized Access Attempt! This attempt has sent an alert!");  
	  return;
  }
  
  %>
<style>
ul {
    list-style: none;
    padding: 0;
    margin: 0;
}
li {
    float: left;
    border: 5px solid #0B3B39;
    border-bottom-width: 4;
    margin: 3px 3px 0px 3px;
    padding: 5px 5px 0px 5px;
    background-color: #01DFD7;
    color: #696969;
}
#mainView {
    border: 3px solid blue;
	clear: both;
	padding: 0 1em;
}
.active {
    background-color: #F2F2F2;
    color: #190707;
}

</style>

<!-- Adding the ng-app declaration to initialize AngularJS -->

    <div id="tabs" ng-controller="UserController">
        <ul>
            <li ng-repeat="tab in tabs" 
                ng-class="{active:isActiveTab(tab.url)}" 
                ng-click="onClickTab(tab)">{{tab.title}}
                </li>
        </ul>
        <div id="mainView">
            <div ng-include="currentTab"></div>
        </div>
    </div>
    
    <script type="text/ng-template" id="one.tpl.html">
		<div id="viewOne">
			<h1>Customer</h1>
			<p>Customer Screen Will Appear Here.</p>
		</div>
	</script>
	
</body>
</html>
