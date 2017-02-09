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
    
     <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.9.0.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/po_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/po_controller.js' />"></script>
  </head>
  <body ng-app="myApp" class="ng-cloak" , style="background-color:wheat;">
      <%
    if (request.getSession().getAttribute("userid_apos") == null) {
  	  out.print("Un-Authorized Access Attempt! This attempt has sent an alert!");  
  	  return;
    }
      %>
      
      <div class="generic-container" ng-controller="POController as ctrl" ng-init="ctrl.createPOS()">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Purchase </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.pos.id" />
                      
                      <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file"></label>
                              <div class="col-md-7">
                                  <input type="hidden" ng-model="ctrl.po.id" name="orderid" class="orderid form-control input-sm" placeholder="Order ID Autogenerated"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.orderid.$error.required">This is a required field</span>
                                      <span ng-show="myForm.orderid.$error.minlength">Minimum length required is 5</span>
                                      <span ng-show="myForm.orderid.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      
                       <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Order Number</label>
                               <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.po.orderNumber" name="orderno" class="orderno form-control input-sm" placeholder="Order Number" required ng-minlength="15"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.orderno.$error.required">This is a required field</span>
                                      <span ng-show="myForm.orderno.$error.minlength">Minimum length required is 5</span>
                                      <span ng-show="myForm.orderno.$invalid">This field is invalid </span>
                                  </div>
                              </div>
   
                          </div>
                      </div> 
                      
                      
                       <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Supplier Name</label>
                              <div class="col-md-7">
                    
					 <select ng-model="suppliername" ng-change="updateCatId(supplier)">
				<option ng-repeat="supplier in ctrl.sup" ng-selected="ctrl.po.sup.name == supplier.name" value="{{supplier.id}}">{{supplier.name}}</option>
				</select>
                  
                                   <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.suppliername.$error.required">This is a required field</span>
                                      <span ng-show="myForm.suppliername.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.suppliername.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>

 					                      
                          <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Order Date</label> <!--   get date from system -->
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.po.orderDt" name="orderdate" class="orderdate form-control input-sm" placeholder="Order date" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.orderdate.$error.required">This is a required field</span>
                                    
                                      <span ng-show="myForm.orderdate.$invalid">Professional field is required </span>
                                  </div>
                              </div>
                          </div>
                      </div> 

                      <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Delivery Date</label> 
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.po.deliveryDt" name="deliverydate" class="deliverydate form-control input-sm" placeholder="Confirmed delivery date" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.deliverydate.$error.required">This is a required field</span>
                                    
                                      <span ng-show="myForm.deliverydate.$invalid">Professional field is required </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      
                      <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Total Purchase Amount</label> 
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.po.totAmt" name="totalamt" class="totalamt form-control input-sm" placeholder="Confirmed Purchase Amount" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.deliverydate.$error.required">This is a required field</span>
                                    
                                      <span ng-show="myForm.deliverydate.$invalid">Purchase Amount field is required </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      
                      
                      
                       <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Notes</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.po.notes" class="form-control input-sm" placeholder="Enter Notes if required"/>
                              </div>
                          </div>
                      </div>
                     
                     <button type="button" ng-click='ctrl.sendPoId(ctrl.po.orderNumber,suppliername,ctrl.po.orderDt,ctrl.po.deliveryDt,ctrl.po.notes)'>Add Stock Items</button>
                     
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.po.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
         
          
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">Order List </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                  <thead>
                          <tr>
                              <th>Order Number</th>
                              <th>Order Date</th>
                               <th>Delivered On</th>
                               <th>Total Amount</th>
                              <th>Notes</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.pos">
                             
                              <td><span ng-bind="u.orderNumber"></span></td>
                              <td><span ng-bind="u.sup.name"></span></td>
                                 <td><span ng-bind="u.orderDt"></span></td>
                                 <td><span ng-bind="u.deliveryDt"></span></td>
                                 <td><span ng-bind="u.totAmt"></span></td>
                              <td><span ng-bind="u.notes"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
       </div>
      
  </body>
</html>