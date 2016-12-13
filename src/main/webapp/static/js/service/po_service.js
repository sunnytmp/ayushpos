	/*******************************************************************************
 * 
 * RiverLog Software __________________
 * 
 * [2016] - [2017] RiverLog Software All Rights Reserved.
 * 
 * NOTICE: All information contained herein is, and remains the property of
 * RiverLog Software and its suppliers, if any. The intellectual and technical
 * concepts contained herein are proprietary to RiverLog Software and its
 * suppliers and may be covered by U.S. and Foreign Patents, patents in process,
 * and are protected by trade secret or copyright law. Dissemination of this
 * information or reproduction of this material is strictly forbidden unless
 * prior written permission is obtained from RiverLog Software.
 */'use strict';
// var myaws = 'http://localhost'; // Declare a global variable
 var myaws = 'http://ec2-52-25-144-174.us-west-2.compute.amazonaws.com';
 App.factory('POService',['$http','$q','$location','$window',function($http,$q,$location,$window){return{createPOS:function(){return $http.get(myaws+':8080/restpos/sup/').then(function(response){return response.data;},function(errResponse){console.error('Error while fetching Supplier');return $q.reject(errResponse);});},fetchAllPOS:function(){return $http.get(myaws+':8080/restpos/PurchaseOrder/').then(function(response){return response.data;},function(errResponse){console.error('Error while fetching users');return $q.reject(errResponse);});},sendPoId:function(ordernumber,suppliername,orderdate,deleverydate,notes){if(typeof name ==='undefined'){$window.location.href=":8080/viewpos/AddItem?supname="+suppliername+"&orderdt="+orderdate+"&ordernumber="+ordernumber+"&ddate="+deleverydate+"&notes="+notes;}else{$window.location.href="/viewpos/AddItem?supname="+suppliername+"&orderdt="+orderdate+"&ordernumber="+ordernumber+"&ddate="+deleverydate+"&notes="+notes;}},createPO:function(po){return $http.post(myaws+':8080/restpos/PurchaseOrder/',po).then(function(response){return response.data;},function(errResponse){console.error('Error while creating PO');return $q.reject(errResponse);});},updatePO:function(po,id){return $http.put(myaws+'/PurchaseOrder/'+id,po).then(function(response){return response.data;},function(errResponse){console.error('Error while updating user');return $q.reject(errResponse);});},deletePO:function(id){return $http.delete(myaws+ ':8080/restpos/PurchaseOrder/'+id).then(function(response){return response.data;},function(errResponse){console.error('Error while deleting user');return $q.reject(errResponse);});}};}]);