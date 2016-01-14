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
    
      <div class="generic-container" ng-controller="ItemController as ctrl" ng-init="ctrl.createCategory()">

          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Item Addition </span></div>
              <div class="formcontainer">
			
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
				 
                      <input type="hidden" ng-model="ctrl.Item.id" />

 							<div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Bar Code</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.Item.code" name="icode" class="username form-control input-sm" placeholder="Bar code" required ng-minlength="3"/>
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
                                  <input type="text" ng-model="ctrl.Item.name" name="iname" class="itemname form-control input-sm" placeholder="Enter the Item name" required ng-minlength="3"/>
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
				
						{{ctrl.Item.category.name}}

					 <select ng-model="categories" ng-change="updateCatId(categories)">
				<option ng-repeat="categories in ctrl.Categories" ng-selected="selectedItem == categories.id" value="{{categories.id}}">{{categories.name}}</option>
				 
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
                                  <input type="number" ng-model="ctrl.Item.price" name="price" class="price form-control input-sm" placeholder="Enter the price" required ng-minlength="1"/>
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
                                  <input type="number" ng-model="ctrl.Item.tax" name="tax" class="price form-control input-sm" placeholder="Enter the price" required ng-minlength="1"/>
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
                              <label class="col-md-2 control-lable" for="file">Stock In Hand</label>
                              <div class="col-md-7">
                                  <input type="number" ng-model="ctrl.Item.stock" name="stock" class="stock form-control input-sm" placeholder="Enter stock" required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.stock.$error.required">This is a required field</span>
                                      <span ng-show="myForm.stock.$error.minlength">Minimum length required . Enter 0 for none</span>
                                      <span ng-show="myForm.stock.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      
            <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Brand Name</label>
                              <div class="col-md-7">
                                  <input type="age" ng-model="ctrl.Item.brandname" name="brandname" class="age form-control input-sm" placeholder="Enter the Brand Name " required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.brandname.$error.required">This is a required field give NA if no brand name</span>
                                      <span ng-show="myForm.brandname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>         
 
                    
 
 <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Discount</label>
                              <div class="col-md-7">
                                  <input type="number" ng-model="ctrl.Item.discount" name="brandname" class="age form-control input-sm" placeholder="Enter the discount to be given for this item" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.discount.$error.required">This is a required field give zero if no discount</span>
                                      <span ng-show="myForm.discount.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
  <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Company Name</label>
                              <div class="col-md-7">
                                  <input type="age" ng-model="ctrl.Item.companyname" name="companyname" class="age form-control input-sm" placeholder="Enter Item Manufactured by" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.companyname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.companyname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
  <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Catalogue</label>
                              <div class="col-md-7">
                                  <input type="age" ng-model="ctrl.Item.catalogue" name="catalogue" class="age form-control input-sm" placeholder="Enter your Catalogue Info. Some thing more about this item if any" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.catalogue.$error.required">This is a required field</span>
                                      <span ng-show="myForm.catalogue.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
   <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Remarks</label>
                              <div class="col-md-7">
                                  <input type="age" ng-model="ctrl.Item.remarks" name="remarks" class="remarks form-control input-sm" placeholder="Enter your remarks" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.remarks.$error.required">This is a required field</span>
                                      <span ng-show="myForm.remarks.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
    <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Discontinued</label>
												  <div class="col-md-7">
	
	{{ctrl.Item.discontinued}}

 <select ng-model="ctrl.Item.discontinued"> 

        <option value="true">true</option><option value="false">false</option> 
		
    </select>
						 <div class="has-error" ng-show="myForm.$dirty">
                                      
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      
                         <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Reason Discontinued</label>
                              <div class="col-md-7">
                                  <input type="age" ng-model="ctrl.Item.reasondiscont" name="reasondicont" class="remarks form-control input-sm" placeholder="Enter Some reason for discontinued. Type NA if nothing. " required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.reasondiscont.$error.required">This is a required field</span>
                                      <span ng-show="myForm.reasondiscont.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.Item.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
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
                              <th>Price</th>
                               <th>Brand Name</th>
                              <th>Stock</th>
                              <th>Company</th>
                              <th>Discount</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.Items">
                           
                              <td><span ng-bind="u.name"></span></td>
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