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
App.controller('ItemController', ['$scope', 'ItemService', '$window' , '$location',  function( $scope, ItemService, $window, $location) {
		 
		  var categoridi = {id:null,name:'',description:''};
		 
          var self = this;
          self.Items={id:null,name:'',descp:''};
          self.Items=[];
           self.val = "";  
           self.po = {"id":16};
		    self.Categories={id:null,name:'',description:''};
		//  self.Categories=[];
		  //  with item included 
		//   self.pos={"id":null,"OrderNumber":null,"rate":null,"orderDt":null,"deliveryDt":null,"qty":0,"itemId":0,"sup":null,"totAmt":0,"notes":null,"Item":{}};
		//Without item included.
		    self.pos={"orderNumber":null,"rate":null,"orderDt":null,"deliveryDt":null,"qty":0,"itemcd":0,"sup":0,"totAmt":0,"notes":null,"catid":0,"itemdesc":null,"Item":{},"branch":null};
    $scope.updateCatId = function() {
	categoridi = $scope.categories;
	console.log('categoryid ' , categoridi);
	$scope.branchstyle = {
			"color" : "white",
	        "background-color" : "blue",
	        
	}
	self.val = $window.location.href;
	if (self.val.indexOf('=') > -1 ){
	  self.val = self.val.substring(self.val.indexOf('=')+1);
	} else {
		self.val = 16;
		
	}
	
   };
		   $scope.updateCatId();
	
          self.fetchAllItems = function(){
              ItemService.fetchAllItems()
                  .then(
                               function(d) {
                                    self.Items = d;
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
			 self.createCategory = function(Categories){ 
	         ItemService.createCategory(Categories) 
					 .then(
					 function(d) {
                                    self.Categories = d.slice();
									
                               },
                                function(errResponse){
                                    console.error('Error while fetching Currencies');
                                }						  
                  );
		  };		
		      self.createItem = function(Item){
		        	 if (categoridi === null || typeof categoridi === "undefined"  || categoridi === "") {
		         	 	alert("Why Category is left blank ?");
		         	 	return;
		        	 }else{
		        		 Item.category = JSON.parse(categoridi);
		        		// alert(JSON.stringify(Item));
		        	 }
              ItemService.createItem(Item)
                      .then(
                      self.fetchAllItems, 
                              function(errResponse){
                                   console.error('Error while creating Item.');
                              } 
                  );
          };
 
          //POItem together
          self.createPOItem = function(POItem){
	        	 if (categoridi === null || typeof categoridi === "undefined"  || categoridi === "") {
	         	 	alert("Category is left blank. Please choose category");
	         	 	return;
	        	 }else{
	        		 POItem.category = JSON.parse(categoridi);
	        		 POItem.orderNumber = self.pos.ordernumber;
	        	//	 POItem.rate = self.pos.price;
	        	//	 POItem.orderDt=self.pos.orderDt;
	        	//	 POItem.deliveryDt=self.pos.deliveryDt;
	        		 POItem.qty=self.pos.Item.qty;
	        		 POItem.itemcd=self.pos.Item.code;
	        		 POItem.itemdesc=self.pos.Item.itemdesc;
	        		 POItem.catid=POItem.category.id;
	        		 POItem.totAmt=self.pos.Item.price;
	        		 POItem.notes=self.pos.notes;
	        		 POItem.supplierId=self.pos.Item.supplierId;
	        		 POItem.brnach=self.pos.Item.branch;
	        		 /* Deletes for later use */
	        		 delete POItem.sup;
	        		 delete POItem.rate;
	        		 delete POItem.orderDt;
	        		 delete POItem.deliveryDt;
	        		 delete POItem.itemId;
	        		 delete POItem.Item;
	        		 delete POItem.ordernumber;
	        		 delete POItem.category;
	        		 alert(JSON.stringify(POItem));
	        	 }
       ItemService.createPOItem(POItem)
               .then(
               self.fetchAllItems, 
                       function(errResponse){
                            console.error('Error while creating POItem.');
                       } 
           );
   };
          
          
         self.updateItem = function(Item, id,$scope){
        	
        	 console.log(JSON.stringify(Item)) ;
        	 if (categoridi === null || typeof categoridi === "undefined"  || categoridi === "") {
        	 	alert("Why Category is left blank ?");
        	 	return;
        	 }else {
			 Item.category = JSON.parse(categoridi);
        	 }
        	 Item.po = self.po;
			 Item.po.id = self.val;
		      ItemService.updateItem(Item, id)
                      .then(
                              self.fetchAllItems, 
                              function(errResponse){
                                   console.error('Error while updating Item.');
                              } 
                  );
				 
          };
   
	    
		 
         self.deleteItem = function(id){
              ItemService.deleteItem(id)
                      .then(
                              self.fetchAllItems, 
                              function(errResponse){
                                   console.error('Error while deleting Item.');
                              } 
                  );
          };
 
          self.fetchAllItems();
 
          self.submit = function() {
              if(self.Item.id==null){
                  console.log('Saving New Items', self.Item);    
                  self.createItem(self.Item);
              }else{
                  self.updateItem(self.Item, self.Item.id);
                  console.log('Item updated with id ', self.Item.id);
              }
              self.reset();
          };
               
          self.edit = function(id,$scope){
              console.log('id to be edited', id);
			  
              for(var i = 0; i < self.Items.length; i++){
                  if(self.Items[i].id == id) {
                     self.Item = angular.copy(self.Items[i]);
                     break;
                  }
              }
			  
          };
               
          self.remove = function(id){
              console.log('id to be deleted', id);
              for(var i = 0; i < self.Items.length; i++){//clean form if the Item to be deleted is shown there.
                  if(self.Items[i].id == id) {
                     self.reset();
                     break;
                  }
              }
              self.deleteItem(id);
          };
 
           
          self.reset = function(){
              self.Item={id:null,name:'',category:''};
              $scope.myForm.$setPristine(); //reset Form
          };
 
		self.setIndex = function(ob){
			ob.SelectedIndex ="1";
	     	alert("Done");
		};
 
        //  PART OF THE STOCK TAKING.
		self.submit_poitem = function() {
            if(self.pos.Item.id==null){
                console.log('Saving New Items - Part of Purchase Order', self.pos); 
                self.createPOItem(self.pos);
            }else{
                self.updateItem(self.pos.id, self.pos.id);
                console.log('PO ITEM together. Need to update poitem NOT Just ITEM ', self.Item.id);
            }
            self.reset();
        };
         
      }]);