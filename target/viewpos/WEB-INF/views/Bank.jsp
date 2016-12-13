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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>  
    <title>Code Named Ayush POS</title>  
    <style>
      .bankname.ng-valid {
          background-color: lightgreen;
      }
      .bankname.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .bankname.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .branch.ng-valid {
          background-color: lightgreen;
      }
      .branch.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .branch.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
      
       .accno.ng-valid {
          background-color: lightgreen;
      }
      .accno.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .accno.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
       .ifsc.ng-valid {
          background-color: lightgreen;
      }
      .ifsc.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .ifsc.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
  </style>
     <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body ng-app="myApp" class="ng-cloak" >
  <%
    if (request.getSession().getAttribute("userid_apos") == null) {
  	  out.print("Un-Authorized Access Attempt! This attempt has sent an alert!");  
  	  return;
    }
      %>
  <form method="POST" action="/viewpos/bankdb">
      <div class="generic-container">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Add Bank </span></div>
              <div class="formcontainer">
                 
                      <input type="hidden" ng-model="ctrl.user.id" />

                      <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Bank Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.bankname" name="bankname" class="bankname form-control input-sm" placeholder="Enter bank name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.bankname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.bankname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.bankname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Branch</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.branch.phone" name="branch" class="branch form-control input-sm" placeholder="Enter the branch" required ng-minlength="10"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.branch.$error.required">This is a required field</span>
                                      <span ng-show="myForm.branch.$error.minlength">Minimum length required is 10</span>
                                      <span ng-show="myForm.branch.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      
                      <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Account number</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.accno.job" name="accno" class="accno form-control input-sm" placeholder="Enter Account Number" ng-minlength="5"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.accno.$error.required">This is a required field</span>
                                      <span ng-show="myForm.accno.$error.minlength">Minimum length required is 5</span>
                                      <span ng-show="myForm.accno.$invalid">Professional field is required </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      
                       
                      <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">IFSC code</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.ifsc.customertype" name="ifsc" class="ifsc form-control input-sm" placeholder="Enter IFSC code" required ng-minlength="8"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.ifsc.$error.required">This is a required field</span>
                                      <span ng-show="myForm.ifsc.$error.minlength">Minimum length required is 5</span>
                                      <span ng-show="myForm.ifsc.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      
                   
                     
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit" value="Save" class="btn btn-default btn-success btn-block"/>
                              
                          </div>
                      </div>
                
              </div>
          </div>
        
      </div>
       
      </form>
        
  </body>
</html>