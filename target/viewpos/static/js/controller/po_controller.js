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
App.controller('POController', ['$scope', 'POService', '$window' , '$location',  function($scope, POService, $window, $location) {
          var self = this;
          self.user={id:null,username:'',address:'',email:'',age:0,accountid:0};
          self.users=[];
               
          self.fetchAllPOS = function(){
              POService.fetchAllPOS()
                  .then(
                               function(d) {
                                    self.pos = d;
                               },
                                function(errResponse){
                                    console.error('Error while fetching Currencies');
                                }
                       );
          };
          


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
		      self.createPO = function(user){
              UserService.createPO(user)
                      .then(
                      self.fetchAllUsers, 
                              function(errResponse){
                                   console.error('Error while creating User.');
                              } 
                  );
          };
 
         self.updatePO = function(po, id){
              UserService.updateUser(po, id)
                      .then(
                              self.fetchAllPOS, 
                              function(errResponse){
                                   console.error('Error while updating User.');
                              } 
                  );
          };
 
         self.deletePO = function(id){
              POService.deletePO(id)
                      .then(
                              self.fetchAllPOS, 
                              function(errResponse){
                                   console.error('Error while deleting User.');
                              } 
                  );
          };

 
          self.fetchAllPOS();
 
          self.submit = function() {
              if(self.user.id==null){
                  console.log('Saving New User', self.po);    
                  self.createPO(self.po);
              }else{
                  self.updateUser(self.po, self.po.id);
                  console.log('User updated with id ', self.po.id);
              }
              self.reset();
          };
               
          self.edit = function(id){
              console.log('id to be edited', id);
              for(var i = 0; i < self.users.length; i++){
                  if(self.pos[i].id == id) {
                     self.po = angular.copy(self.pos[i]);
                     break;
                  }
              }
          };
               
          self.remove = function(id){
              console.log('id to be deleted', id);
              for(var i = 0; i < self.pos.length; i++){//clean form if the user to be deleted is shown there.
                  if(self.pos[i].id == id) {
                     self.reset();
                     break;
                  }
              }
              self.deletePO(id);
          };
 
           
          self.reset = function(){
              self.user={id:null,username:'',address:'',email:'',accountid:'', phone:'',job:'',customertype:'', fax:''};
              $scope.myForm.$setPristine(); //reset Form
          };
 
      }]);



	