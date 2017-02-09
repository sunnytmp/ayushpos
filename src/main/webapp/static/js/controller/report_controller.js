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
App.controller('ReportController', ['$scope', 'ReportService', '$window' , '$location',  function($scope, ReportService, $window, $location) {
          var self = this;
 /* All right side main buttons */
         // $scope.firstName = "John",
        //  $scope.lastName = "Doe"
          $scope.myVar = false;
          $scope.togglesales = function() {
              $scope.myVar = !$scope.myVar;
              $scope.report = "sales";
              alert($scope.report);
          };
          
          $scope.togglestock = function() {
              $scope.myVar = !$scope.myVar;
              $scope.report = "stock";
              alert($scope.report);
          };
          /* All 30 days 60 days, 90 days buttons */
          $scope.salesreport = function() {
              $scope.myVar = !$scope.myVar;
              if ($scope.report="sales"){
               $scope.report = "salesreport";
               alert($scope.report);
              }
              
          };
          
          self.fetchAllCats = function(){
              CatService.fetchAllCats()
                  .then(
                               function(d) {
                                    self.cats = d;
                               },
                                function(errResponse){
                                    console.error('Error while fetching Currencies');
                                }
                       );
          };
            
          self.reset = function(){
           //   self.cat={id:null,categoryname:'',categorydescp:''};
        	self.cat = null;
              $scope.myForm.$setPristine(); //reset Form
          };
 
      }]);