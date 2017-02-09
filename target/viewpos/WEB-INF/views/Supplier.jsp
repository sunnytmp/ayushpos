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
 <%
    if (request.getSession().getAttribute("userid_apos") == null) {
  	  out.print("Un-Authorized Access Attempt! This attempt has sent an alert!");  
  	  return;
    }
      %>
      <div class="generic-container" ng-controller="SupplierController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Supplier Registration </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.user.id" />

                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Supplier Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Supplier.name" name="name" class="name form-control input-sm" placeholder="Enter supplier name" required ng-minlength="5"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.name.$error.required">This is a required field</span>
                                      <span ng-show="myForm.name.$error.minlength">Minimum length required is 5</span>
                                      <span ng-show="myForm.name.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                     
                       <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Phone</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Supplier.phone" name="phone" class="phone form-control input-sm" placeholder="Enter your phone" required ng-minlength="10"/>
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
                                  <input type="text" ng-model="ctrl.Supplier.phone2" name="phone2" class="phone2 form-control input-sm" placeholder="Enter secondary phone" required ng-minlength="10"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.phone2.$error.required">This is a required field</span>
                                      <span ng-show="myForm.phone2.$error.minlength">Minimum length required is 10</span>
                                      <span ng-show="myForm.phone2.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                    
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Supplier Address</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Supplier.address1" class="form-control input-sm" placeholder="Enter your Address. [This field is validation free]"/>
                              </div>
                          </div>
                      </div>
 
 					<div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Supplier Address2</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Supplier.address2" class="form-control input-sm" placeholder="Enter your Address. [This field is validation free]"/>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Supplier Address3</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Supplier.address3" class="form-control input-sm" placeholder="Enter your Address. [This field is validation free]"/>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.Supplier.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
 <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Items </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>Name </th>
                              <th>Description</th>
                              <th>Phone</th>
                               <th>Phone2</th>
                              <th>Address1</th>
                              <th>Address2</th>
                              <th>Address3</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.Suppliers">
                           
                              <td><span ng-bind="u.name"></span></td>
                              <td><span ng-bind="u.descp"></span></td>
                              <td><span ng-bind="u.phone"></span></td>
                              <td><span ng-bind="u.phone2"></span></td>
                              <td><span ng-bind="u.address1"></span></td>
                              <td><span ng-bind="u.address2"></span></td>
                              <td><span ng-bind="u.address3"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/supplier_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/sup_controller.js' />"></script>
  </body>
</html>