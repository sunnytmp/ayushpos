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
// var myaws = 'http://localhost'; // Declare a global variable
  var myaws = 'http://ec2-52-25-144-174.us-west-2.compute.amazonaws.com';

App.factory('SupplierService', ['$http', '$q', function($http, $q){
 
    return {
		createSupplier: function() {
		            return $http.get(myaws+':8080/restpos/sup/')
                            .then(
						            function(response){
									//	alert(JSON.stringify(response.data));
								        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching Supplier');
                                        return $q.reject(errResponse);
                                    }
                            );
            },       
            
            
            fetchAllItems: function() {
                    return $http.get(myaws+':8080/restpos/sup/')                   
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching Suppliers');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
             
            createSupplier: function(Supplier){
            	console.log(JSON.stringify(Supplier))	;
	                return $http.post(myaws+':8080/restpos/sup/', Supplier)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                    	alert(" A Supplier Named " + Supplier.name +" Already Exist. Did you give \n duplicate Name?")
                                        console.error('Error while creating Supplier');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
          
				
            updateSupplier: function(Supplier, id){
            	
				console.log(JSON.stringify(Supplier))	;
                    return $http.put(myaws+':8080/restpos/sup/'+id, Supplier)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while updating Supplier');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
          
            deleteSupplier: function(id){
                return $http.delete(myaws+':8080/restpos/sup/'+id)
                        .then(
                                function(response){
                                    return response.data;
                                }, 
                                function(errResponse){
                                    console.error('Error while deleting Supplier');
                                    return $q.reject(errResponse);
                                }
                        );
        }
     
};

}]);