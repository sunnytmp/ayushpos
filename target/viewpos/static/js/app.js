 /*************************************************************************
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
 */
'use strict';
 
var App = angular.module('myApp',[]);
App.controller('POSController', function ($scope,$http,$q) {

	   $scope.food= function(){
		
	                    return $http.get('http://ec2-52-25-144-174.us-west-2.compute.amazonaws.com:8080/restpos/item/')
	  
	                            .then(
	                                    function successCallback(response) {
										    alert(JSON.stringify(response.data));
	                                        return response.data;
											
	                                    }, 
	                                     function errorCallback(response){
	                                        console.error('Error happened');
											alert(JSON.stringify(response.data));
	                                        return $q.reject(response);
	                                    }
	                            );
							
								
	            }

	 	 
		$scope.itemsCnt = 1;
	    
	    $scope.order = [];
	    
	    $scope.add = function(item) {
	      var foodItem = {
	        id : $scope.itemsCnt,
	        item : item
			
	      };
	      $scope.order.push(foodItem);
	      $scope.itemsCnt = $scope.order.length;
		
	    };
	    
	    $scope.getSum = function() {
	      var i = 0,
	        sum = 0;
	      for(; i < $scope.order.length; i++) {
	        sum += parseInt($scope.order[i].item.price, 10);
			
	      }
	      return sum;
	    };
	    
		  $scope.getTax = function() {
	      var i = 0,
	        sum = 0;
	      for(; i < $scope.order.length; i++) {
	        sum += parseInt($scope.order[i].item.tax, 10);
	      }
		
	      return sum;
	    };
		
	    $scope.deleteItem = function(index) {
	      $scope.order.splice(index,1);
	    };
	    
	    $scope.checkout = function(index) {
	      //alert("Order total: $" + $scope.getSum() + "\n\nPayment received. Thanks.");
		  alert("order details = " + JSON.stringify($scope.order));
	    };
	    
	    $scope.clearOrder = function() {
	      $scope.order = [];
	    };
		
		$scope.NotebookListCtrl = function() {
	  $scope.notebooks = [
	    {"name": "Lenovo",
	     "procesor": "Intel i5",
	     "age": 2011},
	    {"name": "Toshiba",
	     "procesor": "Intel i7",
	     "age": 2010},
	    {"name": "Toshiba",
	     "procesor": "Intel core 2 duo",
	     "age": 2008},
	    {"name": "HP",
	     "procesor": "Intel core 2 duo",
	     "age": 2012},
	    {"name": "Acer",
	     "procesor": "AMD",
	     "age": 2006},
	    {"name": "Lenovo",
	     "procesor": "Intel i5",
	     "age": 2009},
	    {"name": "Toshiba",
	     "procesor": "Intel i7",
	     "age": 2008},
	    {"name": "Lenovo",
	     "procesor": "Intel i5",
	     "age": 2011},
	    {"name": "Toshiba",
	     "procesor": "Intel i7",
	     "age": 2010},
	    {"name": "Toshiba",
	     "procesor": "Intel core 2 duo",
	     "age": 2008},
	    {"name": "HP",
	     "procesor": "Intel core 2 duo",
	     "age": 2012},
	    {"name": "Acer",
	     "procesor": "AMD",
	     "age": 2006},
	    {"name": "Lenovo",
	     "procesor": "Intel i5",
	     "age": 2009},
	    {"name": "Toshiba",
	     "procesor": "Intel i7",
	     "age": 2008},
	    {"name": "Lenovo",
	     "procesor": "Intel i5",
	     "age": 2011},
	    {"name": "Toshiba",
	     "procesor": "Intel i7",
	     "age": 2010},
	    {"name": "Toshiba",
	     "procesor": "Intel core 2 duo",
	     "age": 2008},
	    {"name": "HP",
	     "procesor": "Intel core 2 duo",
	     "age": 2012},
	    {"name": "Acer",
	     "procesor": "AMD",
	     "age": 2006},
	    {"name": "Lenovo",
	     "procesor": "Intel i5",
	     "age": 2009},
	    {"name": "Toshiba",
	     "procesor": "Intel i7",
	     "age": 2008}
	  ];
	  $scope.orderList = "name";
	};
		
		
		
	});