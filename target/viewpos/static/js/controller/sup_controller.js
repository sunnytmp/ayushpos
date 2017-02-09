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
App.controller('SupplierController', ['$scope', 'SupplierService', '$window' , '$location',  function( $scope, SupplierService, $window, $location) {
		 
		  var categoridi = {id:null,name:'',description:''};
		 
          var self = this;
          self.Supplier={id:null,name:'',descp:''};
          self.Suppliers=[];
           self.val = "";  
           
        //  self.Categories=[];
		  //  with item included 
		//   self.pos={"id":null,"OrderNumber":null,"rate":null,"orderDt":null,"deliveryDt":null,"qty":0,"itemId":0,"sup":null,"totAmt":0,"notes":null,"Item":{}};
		//Without item included.
		self.Suppliers={"name":null,"descp":null,"phone":null,"phone2":null,"address1":null,"address2":null,"address":3};
        self.Suppliers = [];
		   
	
          self.fetchAllItems = function(){
              SupplierService.fetchAllItems()
                  .then(
                               function(d) {
                                    self.Suppliers = d;
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
			 self.createSupplier = function(Suppliers){ 
	         SupplierService.createSupplier(Suppliers) 
					 .then(
					 function(d) {
                                    self.Categories = d.slice();
									
                               },
                                function(errResponse){
                                    console.error('Error while fetching Suppliers');
                                }						  
                  );
		  };		
		      self.createSupplier = function(Supplier){
		        	 
              SupplierService.createSupplier(Supplier)
                      .then(
                      self.fetchAllItems, 
                              function(errResponse){
                                   console.error('Error while creating Supplier.');
                              } 
                  );
          };
          
          
         self.updateSupplier = function(Supplier, id,$scope){
        	
        	 console.log(JSON.stringify(Supplier)) ;
        	
        	  SupplierService.updateSupplier(Supplier, id)
                      .then(
                              self.fetchAllItems, 
                              function(errResponse){
                                   console.error('Error while updating Supplier.');
                              } 
                  );
				 
          };
   
	    
		 
         self.deleteSupplier = function(id){
              SupplierService.deleteSupplier(id)
                      .then(
                              self.fetchAllItems, 
                              function(errResponse){
                                   console.error('Error while deleting Item.');
                              } 
                  );
          };
 
          self.fetchAllItems();
 
          self.submit = function() {
              if(self.Supplier.id==null){
                  console.log('Saving New Supplier', self.Supplier);    
                  self.createSupplier(self.Supplier);
              }else{
                  self.updateSupplier(self.Supplier, self.Supplier.id);
                  console.log('Supplier updated with id ', self.Supplier.id);
              }
              self.reset();
          };
               
          self.edit = function(id,$scope){
              console.log('id to be edited', id);
			  
              for(var i = 0; i < self.Suppliers.length; i++){
                  if(self.Suppliers[i].id == id) {
                     self.Supplier = angular.copy(self.Suppliers[i]);
                     break;
                  }
              }
			  
          };
               
          self.remove = function(id){
              console.log('id to be deleted', id);
              for(var i = 0; i < self.Suppliers.length; i++){//clean form if the Item to be deleted is shown there.
                  if(self.Suppliers[i].id == id) {
                     self.reset();
                     break;
                  }
              }
              self.deleteSupplier(id);
          };
 
           
          self.reset = function(){
              self.Supplier={id:null,name:'',name:'',phone:'',phone2:'',address1:'',address2:'', address3:''};
              $scope.myForm.$setPristine(); //reset Form
          };
 
		self.setIndex = function(ob){
			ob.SelectedIndex ="1";
	     	alert("Done");
		};
 
       
         
      }]);