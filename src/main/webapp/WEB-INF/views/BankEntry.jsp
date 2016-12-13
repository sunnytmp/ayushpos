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
     .entrydate.ng-valid {
          background-color: lightgreen;
      }
      .entrydate.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .entrydate.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
      .chequeno.ng-valid {
          background-color: lightgreen;
      }
      .chequeno.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .chequeno.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .debit.ng-valid {
          background-color: lightgreen;
      }
      .debit.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .debit.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
       .credit.ng-valid {
          background-color: lightgreen;
      }
      .credit.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .credit.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
        .balance.ng-valid {
          background-color: lightgreen;
      }
      .balance.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .balance.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
 
    </style>
     <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
  
  </head>
  <body ng-app="myApp" class="ng-cloak" style="background-color:wheat;">
  <%
    if (request.getSession().getAttribute("userid_apos") == null) {
  	  out.print("Un-Authorized Access Attempt! This attempt has sent an alert!");  
  	  return;
    }
      %>
  <form method="POST" action="/viewpos/bankentrydb">
      <div class="generic-container">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Bank Entry </span></div>
              <div class="formcontainer">
                
                      <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Date</label>
                              <div class="col-md-7">
                                  <input type="date" name="entrydate" class="entrydate form-control input-sm" placeholder="Enter transaction date" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.entrydate.$error.required">This is a required field</span>
                                      <span ng-show="myForm.entrydate.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.entrydate.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Particulars</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.branch.phone" name="particulars" class="particulars form-control input-sm" placeholder="Enter the branch" required ng-minlength="10"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.particulars.$error.required">This is a required field</span>
                                      <span ng-show="myForm.particulars.$error.minlength">Minimum length required is 10</span>
                                      <span ng-show="myForm.particulars.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      
                      <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Cheque No: </label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.accno.job" name="chequeno" class="chequeno form-control input-sm" placeholder="Enter Account Number" ng-minlength="5"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.chequeno.$error.required">This is a required field</span>
                                      <span ng-show="myForm.chequeno.$error.minlength">Minimum length required is 5</span>
                                      <span ng-show="myForm.chequeno.$invalid">Professional field is required </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      
                       
                      <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Debit</label>
                              <div class="col-md-7">
                                  <input type="text" name="debit" class="debit form-control input-sm" placeholder="Enter debit" required ng-minlength="8"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.debit.$error.required">This is a required field</span>
                                      <span ng-show="myForm.debit.$error.minlength">Minimum length required is 5</span>
                                      <span ng-show="myForm.debit.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                      
                      
                       <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Credit</label>
                              <div class="col-md-7">
                                  <input type="text"  name="credit" class="credit form-control input-sm" placeholder="Enter credit" required ng-minlength="8"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.credit.$error.required">This is a required field</span>
                                      <span ng-show="myForm.credit.$error.minlength">Minimum length required is 5</span>
                                      <span ng-show="myForm.credit.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                   
                   
                    <div class="row">
                     
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Balance</label>
                              <div class="col-md-7">
                                  <input type="text" name="balance" class="balance form-control input-sm" placeholder="Enter Balance" required ng-minlength="8"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.balance.$error.required">This is a required field</span>
                                      <span ng-show="myForm.balance.$error.minlength">Minimum length required is 5</span>
                                      <span ng-show="myForm.balance.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div> 
                     
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              
                          </div>
                      </div>
                 
              </div>
          </div>
        
      </div>
       </form>
  </body>
</html>