<!--  /*************************************************************************
 * 
 * RiverLog Software
 * __________________
 * 
 *  [2016] - [2017] RiverLog Software 
 *  All Rights Reserved.
 * 
 * NOTICE:  All information contained herein is, and remains
 * the property of RiverLog Software and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to RiverLog Software
 * and its suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from RiverLog Software.
 */ -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>Code Named Ayush POS</title>  
    <style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
      
    .myButton {
	-moz-box-shadow: 7px 28px 20px -1px #3e9329;
	-webkit-box-shadow: 7px 28px 20px -1px #3e9329;
	box-shadow: 9px 20px 27px -4px #3e7327;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #77b55a), color-stop(1, #72b352));
	background:-moz-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:-webkit-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:-o-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:-ms-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77b55a', endColorstr='#72b352',GradientType=0);
	background-color:#77b55a;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:3px solid #4b8f39;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	padding:8px 99px;
	text-decoration:none;
	text-shadow:0px 8px 0px #5b8a3c;
}
 .myButton1 {
	-webkit-box-shadow: 7px 28px 20px -1px #3e9329;
	box-shadow: 9px 20px 27px -4px #3e7327;;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #77b55a), color-stop(1, #72b352));
	background:-moz-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:-webkit-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:-o-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:-ms-linear-gradient(top, #77b55a 5%, #72b352 100%);
	background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77b55a', endColorstr='#72b352',GradientType=0);
	background-color:#77b75a;
	-moz-border-radius:17px;
	-webkit-border-radius:17px;
	border-radius:7px;
	border:1px solid #4b8f29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	padding:8px 90px;
	text-decoration:none;
	text-shadow:0px 8px 0px #5b8a3c;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #72b352), color-stop(1, #77b55a));
	background:-moz-linear-gradient(top, #72b352 5%, #77b55a 100%);
	background:-webkit-linear-gradient(top, #72b352 5%, #77b55a 100%);
	background:-o-linear-gradient(top, #72b352 5%, #77b55a 100%);
	background:-ms-linear-gradient(top, #72b352 5%, #77b55a 100%);
	background:linear-gradient(to bottom, #72b352 5%, #77b55a 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#72b352', endColorstr='#77b55a',GradientType=0);
	background-color:#72b667;
}
.myButton:active {
	position:relative;
	top:7px;
}

.btn2 {
  background: #3498db;
  background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
  background-image: -moz-linear-gradient(top, #3498db, #2980b9);
  background-image: -ms-linear-gradient(top, #3498db, #2980b9);
  background-image: -o-linear-gradient(top, #3498db, #2980b9);
  background-image: linear-gradient(to bottom, #3498db, #2980b9);
  font-family: Arial;
  color: #ffffff;
  font-size: 32px;
  padding: 8px 13px 16px 13px;
  text-decoration: none;
}

.btn2:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}



    </style>
     <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body ng-app="myApp" class="ng-cloak">
  <%
    if (request.getSession().getAttribute("userid_apos") == null) {
  	  out.print("Un-Authorized Access Attempt! This attempt has sent an alert!");  
  	  return;
    }
      %>
      <div class="generic-container" ng-controller="ReportController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Dynamic Graphical Reports </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.Item.id" />

					
<div class="row">
  	
    	<div class="row">
    	 <div class="form-group col-md-12">
      		<div class="col-md-2">
        		<button type="button" ng-click="togglesales()" class="myButton">  Sales </button>
      		</div>
      		
      		</div>
    	</div>
    <p ng-show="myVar">
From Date: <input type=date ng-model="string"><br>
To Date&nbsp;&nbsp;  :   <input type=date ng-model="string"><br><br>
<a button ng-click="salesreport()" class="btn2" href="">30 Days</a>
<a button class="btn2" href="">60 Days</a>
<a button class="btn2" href="">90 Days</a></p>
    <div class="row">
    	 <div class="form-group col-md-12">
      		<div class="col-md-2">
      	
        		<button type="button"  class="myButton" >  Stock</button>
      		
      		</div>
      		</div>
    	</div> 
    	<div class="row">
    	  <div class="form-group col-md-12">
      		<div class=" col-md-2">
      			<button type="button" class="myButton1">Purchase</button>
        		
      		</div>
      		</div>
    	</div>
   <div class="row">
    	 <div class="form-group col-md-12">
      		<div class="col-md-2">
      	
        		<button type="button" class="myButton">   Credit   </button>
      		</div>
      		
      		</div>
    	</div>
   <div class="row">
    	 <div class="form-group col-md-12">
      		<div class="col-md-2">
        		<button type="button" ng-click="BankDetails()" class="myButton"> Banks  </button>
      		</div>
      	
      		</div>
    	</div>
  
  
 
  </div>
</div>
       
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/report_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/report_controller.js' />"></script>
  </body>
</html>