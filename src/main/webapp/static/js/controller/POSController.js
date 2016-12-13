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
 */
'use strict';
// var myaws = 'http://localhost'; // Declare a global variable
 var myaws = 'http://ec2-52-25-144-174.us-west-2.compute.amazonaws.com';

App
		.controller(
				'POSController',
				function($scope, $http, $q, $window) {
					$scope.getDatetime = new Date();
					$scope.food = function() {

						return $http.get(myaws + ':8080/restpos/saleitems/')

						.then(function successCallback(response) {
							$scope.food = response.data;
							return response.data;

						}, function errorCallback(response) {
							console.error('Error happened');
							alert(JSON.stringify(response.data));
							return $q.reject(response);
						});

					}
					$scope.FulltotDiscount =0; 
					$scope.totDiscount = 0;
					$scope.item4print = [ {} ]; // added now
					$scope.itemsCnt = 1;
					$scope.order = [];
					$scope.units = [];
					$scope.tot = 0;
					$scope.totalUnitsPrice = 0;
					$scope.finalOrder = [];
					$scope.compose = "";

					$scope.getChange = function(index) {
						if (index > 0) {
							$scope.order[$scope.order.length - 1].qty = parseInt(index);

							$scope.totalUnitsPrice = (parseFloat($scope.order[$scope.order.length - 1].item.price) * parseInt(index));

							$scope.tot = $scope.getSum() + $scope.getTax()
									- $scope.totDiscount;
							$scope.finalOrder[$scope.finalOrder.length - 1].qty = parseFloat(index);
						} else {

						}
					}

					$scope.add = function(item, itemqty, discount) {
						document.getElementById('disc').value=0;
						var foodItem = {
							id : $scope.itemsCnt,
							item : item,
							qty : itemqty,
							discount : discount
						};
						$scope.order.push(foodItem);
						$scope.itemsCnt = $scope.order.length;
						$scope.tot = $scope.getSum() + $scope.getTax()
								;
						$scope.compose = '{"itemid":' + item.id + ',"qty":'
								+ itemqty + ',"price":' + item.price + ',"discount":' + item.discount + '}';
						$scope.compose = JSON.parse($scope.compose);
						$scope.finalOrder.push($scope.compose);
						$scope.item4print = $scope.order; // added now
					};

					$scope.getSum = function() {
						var i = 0, sum = 0;
						for (; i < $scope.order.length; i++) {
							sum += parseFloat(($scope.order[i].item.price)
									* parseFloat($scope.order[i].qty))-($scope.order[i].discount) ;
							// $scope.order[i].qty);
						}
						return sum;
					};

					// Discount calculation
					$scope.doDiscount = function(index) {
						console.log(index);
						if (index >= 0) {
							var sum = 0;
							var discount = parseFloat(index);
							$scope.tot = (($scope.getSum() + $scope.getTax()) - parseFloat(discount));
						    $scope.FulltotDiscount = $scope.FulltotDiscount+ discount;  //malathys code from here
							$scope.order[$scope.order.length -1].discount = parseInt(index);
							
						} else {
							$scope.totDiscount = 0;
							$scope.order[$scope.order.length -1].discount = 0;
							$scope.tot = $scope.getSum() + $scope.getTax();
						}
					};

					$scope.getTax = function() {
						var i = 0, sum = 0;
						for (; i < $scope.order.length; i++) {
							sum += parseFloat($scope.order[i].item.tax, 10);
						}
						return sum;
					};

					$scope.deleteItem = function(index) {
						var element = parseInt(parseInt(index));
						$scope.tot = parseFloat($scope.tot)
								- (parseFloat($scope.order[parseInt(element)].item.price
										* $scope.order[parseInt(element)].qty))
								- $scope.order[parseInt(element)].item.tax;
						$scope.tot = parseFloat($scope.tot)+parseFloat($scope.order[parseInt(element)].discount);
						$scope.FulltotDiscount = $scope.FulltotDiscount- parseFloat($scope.order[parseInt(element)].discount);
						$scope.order.splice(index, 1);
						$scope.finalOrder.splice(index, 1);
						
					};

					$scope.checkout = function(index) {
						var so = '{"totDis":' + $scope.totDiscount + ',"tax":'
								+ $scope.getTax() + ',"id":' + 10
								+ ',"orderDetails":'
								+ JSON.stringify($scope.finalOrder)
								+ ',"orderNumber":' + '"122NEW19"}';
						so = JSON.parse(so);
						console.log(JSON.stringify(so));
						console.log(JSON.stringify($scope.item4prnt));
						// window.localStorage.clear();
						if (typeof (Storage) !== "undefined") {
							// localStorage.removeItem("item4print");
							localStorage.setItem("item4print", JSON
									.stringify($scope.item4print));
							// localStorage.removeItem("OrderDetails");
							localStorage.setItem("OrderDetails", JSON
									.stringify(so));
							localStorage.setItem("TotalAmount", $scope.getSum()
									+ $scope.getTax() - $scope.totDiscount);
							localStorage.setItem("TotalTax", $scope.getTax());
							
						} else {
							alert("LS not set");
						}
						var retVal = confirm("Has the customer finished purchases ?");
						if (retVal == true) {
							// do nothing . just save
						} else {
							alert("Hit ok to return back to screen");
							return false;
						}

						var res = $http.post(myaws
								+ ':8080/restpos/SalesOrder/', JSON
								.stringify(so));
						res.success(function(data, status, headers, config) {
							$scope.message = data;
						});
						res.error(function(data, status, headers, config) {

						});
						var retVal = confirm("Are you sure - PRINT RECEIPT?");
						if (retVal == true) {
							$window.location.href = '/viewpos/Print';
						} else {
							alert("You didn't choose toprint");
							return false;
						}
					};

					$scope.clearOrder = function() {
						$scope.totAmt = 0;
						$scope.tax = 0;
						$scope.totDiscount = 0;
						$scope.order = [];
						$scope.tot = 0;
					};

					$scope.NotebookListCtrl = function() {
						$scope.notebooks = [ {
							"name" : "RiverLog",
							"procesor" : "keypeople i5",
							"age" : 2011
						}, {
							"name" : "BigLeaf",
							"procesor" : "keypeople i7",
							"age" : 2010
						}, {
							"name" : "BigLeaf",
							"procesor" : "keypeople core 2 duo",
							"age" : 2008
						}, {
							"name" : "Soatools",
							"procesor" : "keypeople core 2 duo",
							"age" : 2012
						}, {
							"name" : "Paragon",
							"procesor" : "Soadevelopers",
							"age" : 2006
						}, {
							"name" : "RiverLog",
							"procesor" : "keypeople i5",
							"age" : 2009
						}, {
							"name" : "BigLeaf",
							"procesor" : "keypeople i7",
							"age" : 2008
						}, {
							"name" : "RiverLog",
							"procesor" : "keypeople i5",
							"age" : 2011
						}, {
							"name" : "BigLeaf",
							"procesor" : "keypeople i7",
							"age" : 2010
						}, {
							"name" : "BigLeaf",
							"procesor" : "keypeople core 2 duo",
							"age" : 2008
						}, {
							"name" : "Soatools",
							"procesor" : "keypeople core 2 duo",
							"age" : 2012
						}, {
							"name" : "Paragon",
							"procesor" : "Soadevelopers",
							"age" : 2006
						}, {
							"name" : "RiverLog",
							"procesor" : "keypeople i5",
							"age" : 2009
						}, {
							"name" : "BigLeaf",
							"procesor" : "keypeople i7",
							"age" : 2008
						}, {
							"name" : "RiverLog",
							"procesor" : "keypeople i5",
							"age" : 2011
						}, {
							"name" : "BigLeaf",
							"procesor" : "keypeople i7",
							"age" : 2010
						}, {
							"name" : "BigLeaf",
							"procesor" : "keypeople core 2 duo",
							"age" : 2008
						}, {
							"name" : "Soatools",
							"procesor" : "keypeople core 2 duo",
							"age" : 2012
						}, {
							"name" : "Paragon",
							"procesor" : "Soadevelopers",
							"age" : 2006
						}, {
							"name" : "RiverLog",
							"procesor" : "keypeople i5",
							"age" : 2009
						}, {
							"name" : "BigLeaf",
							"procesor" : "keypeople i7",
							"age" : 2008
						} ];
						$scope.orderList = "name";
					};

				});
