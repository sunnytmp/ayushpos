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
App.controller('CatController', ['$scope', 'CatService', '$window' , '$location',  function($scope, CatService, $window, $location) {
          var self = this;
          self.cat={id:null,name:'',descp:''};
          self.cats=[];
               
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
  $scope.tabs = [{
            title: 'Customer',
            url: 'Customer.html'
        }, {
            title: 'Inventory',
            url: '/viewpos'        //Switched the screens for the Kerala developers to step through and learn. Tier1 Group
        }, {
            title: 'Sales',
            url: 'sales.html'
    }];

    $scope.currentTab = 'Customer.html';

    $scope.onClickTab = function (tab) {
        $scope.currentTab = tab.url;
    }
    
    $scope.isActiveTab = function(tabUrl) {
        return tabUrl == $scope.currentTab;
    }
;

	self.noHrefTest = function () { 
		      var con = document.getElementById('content')
			   ,   xhr = new XMLHttpRequest();

			   xhr.onreadystatechange = function (e) { 
				if (xhr.readyState == 4 && xhr.status == 200) {
				 con.innerHTML = xhr.responseText;
				}
			   }
			 xhr.open("GET", "/viewpos", true);
			 xhr.setRequestHeader('Content-type', 'text/html');
			 xhr.send();
			 con.innerHTML = xhr.responseText;			
			 
          };	 
			
		      self.createCat = function(cat){
              CatService.createCat(cat)
                      .then(
                      self.fetchAllCats, 
                              function(errResponse){
                                   console.error('Error while creating Category.');
                              } 
                  );
          };
 
         self.updateCat = function(cat, id){
              CatService.updateCat(cat, id)
                      .then(
                              self.fetchAllCats, 
                              function(errResponse){
                                   console.error('Error while updating Category.');
                              } 
                  );
          };
 
         self.deleteCat = function(id){
              CatService.deleteCat(id)
                      .then(
                              self.fetchAllCats, 
                              function(errResponse){
                                   console.error('Error while deleting Category.');
                              } 
                  );
          };
 
          self.fetchAllCats();
 
          self.submit = function() {
              if(self.cat.id==null){
                  console.log('Saving New Categiry', self.cat);    
                  self.createCat(self.cat);
              }else{
                  self.updateCat(self.cat, self.cat.id);
                  console.log('Category updated with id ', self.cat.id);
              }
              self.reset();
          };
               
          self.edit = function(id){
              console.log('id to be edited', id);
              for(var i = 0; i < self.cats.length; i++){
                  if(self.cats[i].id == id) {
                     self.cat = angular.copy(self.cats[i]);
                     break;
                  }
              }
          };
               
          self.remove = function(id){
              console.log('id to be deleted', id);
              for(var i = 0; i < self.cats.length; i++){//clean form if the category to be deleted is shown there.
                  if(self.cats[i].id == id) {
                     self.reset();
                     break;
                  }
              }
              self.deleteCat(id);
          };
 
           
          self.reset = function(){
              self.cat={id:null,categoryname:'',categorydescp:''};
              $scope.myForm.$setPristine(); //reset Form
          };
 
      }]);