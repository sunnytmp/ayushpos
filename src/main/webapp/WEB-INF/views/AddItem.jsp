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
      <div class="generic-container" ng-controller="ItemController as ctrl" ng-init="ctrl.createCategory()">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Item Addition </span></div>
              <div class="formcontainer">
			    
                  <form ng-submit="ctrl.submit_poitem()" name="myForm" class="form-horizontal">
                
                <div class="row">
                  <div class="form-group col-md-12">
                 <input type="hidden" ng-model="ctrl.pos.id"/>
                 <input type="hidden" ng-model="ctrl.pos.ordernumber" value="10" ng-init="ctrl.pos.ordernumber='<%= request.getParameter("ordernumber") %>'"/>
                 <input type="hidden" ng-model="ctrl.pos.orderDt" value="10/10/2016"ng-init="ctrl.pos.orderDt='<%= request.getParameter("orderdt") %>'"/> />	
                 <input type="hidden" ng-model="ctrl.pos.deliveryDt" value="10/10/2016" ng-init="ctrl.pos.deliveryDt='<%= request.getParameter("ddate") %>'"/>/>
                 <input type="hidden" ng-model="ctrl.pos.notes" value="Notesbaba" ng-init="ctrl.pos.notes='<%= request.getParameter("notes") %>'"/>/>
                  <input type="hidden" ng-model="ctrl.pos.sup" value="sup" ng-init="ctrl.pos.sup='<%= request.getParameter("supname") %>'"/>/>
      			</div>
      </div>
                      <input type="hidden" ng-model="ctrl.pos.Item.id" />

					  <input type="hidden" ng-model="ctrl.pos.val" value={{ctrl.val}}/>
						

 						<div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Bar Code</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.pos.Item.code" name="icode" class="code form-control input-sm" placeholder="Enter Bar Code" required ng-minlength="12"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.code.$error.required">This is a required field</span>
                                      <span ng-show="myForm.code.$error.minlength">Minimum length required is 10</span>
                                      <span ng-show="myForm.code.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Item Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.pos.Item.name" name="iname" class="itemname form-control input-sm" placeholder="Enter the Item name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.name.$error.required">This is a required field</span>
                                      <span ng-show="myForm.name.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.name.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
						 
				 <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Category</label>
                              <div class="col-md-7">
				
					 <select ng-model="categories" ng-change="updateCatId()">
				<option ng-repeat="categories in ctrl.Categories" ng-selected="ctrl.pos.Item.category.name == categories.name" value={{categories}}>{{categories.name}}</option>
				 
				</select>
		
				
								  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.name.$error.required">This is a required field</span>
                                    
                                      <span ng-show="myForm.name.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>		 
						 
						 
						 
						 
                       <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Price</label>
                              <div class="col-md-7">
                                  <input type="number" ng-model="ctrl.pos.Item.price" name="price" class="price form-control input-sm" placeholder="Enter the price" ng-pattern="/^[0-9]+(\.[0-9]{1,2})?$/" step="0.01" required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.price.$error.required">This is a required field</span>
                                      <span ng-show="myForm.price.$error.minlength">Minimum length required is 2</span>
                                      <span ng-show="myForm.price.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
					  
					  <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Tax</label>
                              <div class="col-md-7">
                                  <input type="number" ng-model="ctrl.pos.Item.tax" name="tax" class="price form-control input-sm" placeholder="Enter the tax" required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.tax.$error.required">This is a required field</span>
                                      <span ng-show="myForm.tax.$error.minlength">Minimum length required is 2</span>
                                      <span ng-show="myForm.tax.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
					  
					  <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Quantity</label>
                              <div class="col-md-7">
                                  <input type="number" ng-model="ctrl.pos.Item.qty" name="qty" class="qty form-control input-sm" placeholder="Enter the Quantity" required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.qyt.$error.required">This is a required field</span>
                                      <span ng-show="myForm.qty.$error.minlength">Minimum length required is 1</span>
                                      <span ng-show="myForm.qty.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
					  
                     
						      </div>
                          </div>
                      </div>
                
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.pos.Item.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
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
                              <th>Item </th>
                              <th>Category</th>
                              <th>Price</th>
                              
                              <th>Stock</th>
                             
                              <th width="10%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.pos.Items">
                           
                              <td><span ng-bind="u.name"></span></td>
                              <td><span ng-bind="u.category.name"></span></td>
                              <td><span ng-bind="u.price"></span></td>
                              <td><span ng-bind="u.brandname"></span></td>
                              <td><span ng-bind="u.stock"></span></td>
                              <td><span ng-bind="u.companyname"></span></td>
                              <td><span ng-bind="u.discount"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
		    	 
      </div>
     
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/item_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/item_controller.js' />"></script>
	   
  </body>
</html>