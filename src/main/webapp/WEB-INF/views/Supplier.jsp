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
      .uname.ng-valid {
          background-color: lightgreen;
      }
      .uname.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .uname.ng-dirty.ng-invalid-minlength {
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
 
    </style>
     <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body ng-app="myApp" class="ng-cloak" style="background-color:wheat;">
  
      <div class="generic-container" ng-controller="UserController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Supplier Registration </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.user.id" />

 					<div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">SuppilerID</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.accountid" name="accountid" class="accountid form-control input-sm" placeholder="Supplier Id Generated" required ng-minlength="0"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.accountid.$error.required">This is a required field</span>
                                      <span ng-show="myForm.accountid.$error.minlength">Minimum length required is 9</span>
                                      <span ng-show="myForm.accountid.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Supplier Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.username" name="username" class="username form-control input-sm" placeholder="Enter your name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.username.$error.required">This is a required field</span>
                                      <span ng-show="myForm.username.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.username.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                     
                       <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Phone</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.phone" name="phone" class="phone form-control input-sm" placeholder="Enter your phone" required ng-minlength="10"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.phone.$error.required">This is a required field</span>
                                      <span ng-show="myForm.phone.$error.minlength">Minimum length required is 10</span>
                                      <span ng-show="myForm.phone.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                     <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Secondary Phone</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.phone" name="phone" class="phone form-control input-sm" placeholder="Enter secondary phone" required ng-minlength="10"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.phone.$error.required">This is a required field</span>
                                      <span ng-show="myForm.phone.$error.minlength">Minimum length required is 10</span>
                                      <span ng-show="myForm.phone.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                    
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Supplier Address</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.address" class="form-control input-sm" placeholder="Enter your Address. [This field is validation free]"/>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
 
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/user_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
  </body>
</html>