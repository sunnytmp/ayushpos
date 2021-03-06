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
App.controller('UserController', ['$scope', 'UserService', '$window' , '$location',  function($scope, UserService, $window, $location) {
          var self = this;
          self.user={id:null,accountid:0,username:'',phone:'',fax:'',address:'',email:'',age:0,job:'',customerType:''};
          self.users=[];
               
          self.fetchAllUsers = function(){
              UserService.fetchAllUsers()
                  .then(
                               function(d) {
                                    self.users = d;
                               },
                                function(errResponse){
                                    console.error('Error while fetching Currencies');
                                }
                       );
          };
          
          
  $scope.tabs= [{
            title: 'Customer',
            url: '/viewpos'
        }, {
            title: 'Category',
            url: 'category'       
        }, {
            title: 'Sales',
            url: 'sales'
        },  {
        	title: 'Item',
        	url: 'Item?val=0'
        },{
        	title: 'Supplier',
        	url: 'supplier'
        }, {
        	title: 'Purchase',
        	url: 'purchase'
        }, {
        	title: 'Bank',
        	url: 'addbank'
        },{
        	title: 'Bank Entry',
        	url: 'bankentry'
        },{
        	title: 'Reports',
        	url: 'report'
       },{
    	   title: 'Logout',
    	   url: 'logout'
}
       
       ];

    $scope.currentTab = '';  

    $scope.onClickTab = function (tab) {
    	if (tab.url === "sales"){
    		location.href = "sales";
    	}
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
          
         
          
//--------------------------------------------------------------------------------------------------------------------//			
		      self.createUser = function(user){
              UserService.createUser(user)
                      .then(
                      self.fetchAllUsers, 
                              function(errResponse){
                                   console.error('Error while creating User.');
                              } 
                  );
          };
 
         self.updateUser = function(user, id){
              UserService.updateUser(user, id)
                      .then(
                              self.fetchAllUsers, 
                              function(errResponse){
                                   console.error('Error while updating User.');
                              } 
                  );
          };
 
         self.deleteUser = function(id){
              UserService.deleteUser(id)
                      .then(
                              self.fetchAllUsers, 
                              function(errResponse){
                                   console.error('Error while deleting User.');
                              } 
                  );
          };

 
          self.fetchAllUsers();
 
          self.submit = function() {
              if(self.user.id==null){
                  console.log('Saving New User', self.user);    
                  self.createUser(self.user);
              }else{
                  self.updateUser(self.user, self.user.id);
                  console.log('User updated with id ', self.user.id);
              }
              self.reset();
          };
               
          self.edit = function(id){
              console.log('id to be edited', id);
              for(var i = 0; i < self.users.length; i++){
                  if(self.users[i].id == id) {
                     self.user = angular.copy(self.users[i]);
                     break;
                  }
              }
          };
               
          self.remove = function(id){
              console.log('id to be deleted', id);
              for(var i = 0; i < self.users.length; i++){//clean form if the user to be deleted is shown there.
                  if(self.users[i].id == id) {
                     self.reset();
                     break;
                  }
              }
              self.deleteUser(id);
          };
 
           
          self.reset = function(){
              self.user={id:null,username:'',address:'',email:'',age:0,accountid:'', phone:'',job:'',customerType:'', fax:''};
              $scope.myForm.$setPristine(); //reset Form
          };
 
      }]);



	