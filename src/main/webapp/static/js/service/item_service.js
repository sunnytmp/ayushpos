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
var myaws = 'http://localhost'; // Declare a global variable
// var myaws = 'http://ec2-52-25-144-174.us-west-2.compute.amazonaws.com';

App.factory('ItemService', ['$http', '$q', function($http, $q){
 
    return {
		createCategory: function() {
		            return $http.get(myaws+':8080/restpos/cat/')
                            .then(
						            function(response){
									//	alert(JSON.stringify(response.data));
								        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching category');
                                        return $q.reject(errResponse);
                                    }
                            );
            },       
            
            
            fetchAllItems: function() {
                    return $http.get(myaws+':8080/restpos/item/')                   
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching Items');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
             
            createItem: function(Item){
            	console.log(JSON.stringify(Item))	;
	                return $http.post(myaws+':8080/restpos/item/', Item)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while creating Item');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
            
				
            updateItem: function(Item, id){
            	
				console.log(JSON.stringify(Item))	;
                    return $http.put(myaws+':8080/restpos/item/'+id, Item)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while updating Item');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
          
            deleteItem: function(id){
                return $http.delete(myaws+':8080/restpos/item/'+id)
                        .then(
                                function(response){
                                    return response.data;
                                }, 
                                function(errResponse){
                                    console.error('Error while deleting Item');
                                    return $q.reject(errResponse);
                                }
                        );
        }
     
};

}]);