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
App.controller('POController', ['$rootScope','$scope', 'POService', '$window' , '$location',  function($rootScope,$scope, POService, $window, $location) {
	
	      var self = this;
          self.user={id:null,orderNumber:'',orderDt :'',deliveryDt:'',totAmt:'', notes:'',suppliername:''};
          self.users=[];
          self.CreatePOS={id:null,name:'',descp:'',phone:'',phone2:'',address1:'',address2:'',address3:''};
      //    $scope.ctrl=0;
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
          
          
         
  self.sendPoId = function(ordernumber,suppliername,orderdata,deleverydate,notes){
	  
	  POService.sendPoId(ordernumber,suppliername,orderdata,deleverydate,notes);
	
     
};
  
          self.createPOS = function(PurchaseOrder){ 
 	         POService.createPOS(PurchaseOrder) 
 					 .then(
 					 function(d) {
                                     self.sup = d.slice();
 									
                                },
                                 function(errResponse){
                                     console.error('Error while fetching Suppliers');
                                 }						  
                   );
 		  };	      
          
//--------------------------------------------------------------------------------------------------------------------//			
		      self.createPO = function(PurchaseOrder){
		    	  POService.createPO(PurchaseOrder)
                      .then(
                      self.fetchAllPOS, 
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
              if(self.po.id==null){
                  console.log('Saving New PO', self.po);    
                  self.createPO(self.po);
              }else{
                  self.updatePo(self.po, self.po.id);
                  console.log('PO updated with id ', self.po.id);
              }
              self.reset();
          };
               
          self.edit = function(id){
              console.log('id to be edited', id);
             
              for(var i = 0; i < self.pos.length; i++){
                  if(self.pos[i].id == id) {
                	  console.log("Posid from array" ,self.pos[i].id);
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
              self.po={id:null,orderNumber:'',orderDt :'',deliveryDt:'',totAmt:'', notes:'',suppliername:''};
              $scope.myForm.$setPristine(); //reset Form
          };
 
      }]);



	