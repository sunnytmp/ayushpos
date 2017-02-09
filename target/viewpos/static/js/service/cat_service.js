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
 var myaws = 'http://localhost:8080'; // Declare a global variable
// var myaws = 'http://ec2-52-25-144-174.us-west-2.compute.amazonaws.com:8080';

App.factory('CatService', ['$http', '$q', function($http, $q){
 
    return {
         
            fetchAllCats: function() {
                    return $http.get(myaws+':8080/restpos/cat/')
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching categories');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
             
            createCat: function(cat){
                    return $http.post(myaws+':8080/restpos/cat/', cat)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while creating category');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
            
				
            updateCat: function(cat, id){
                    return $http.put(myaws+':8080/restpos/cat/'+id, cat)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while updating category');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
          
            deleteCat: function(id){
	            return $http.delete(myaws+':8080/restpos/cat/'+id)
				        .then(
                                function(response){
                                    return response.data;
                                }, 
                                function(errResponse){
                                    console.error('Error while deleting category');
                                    return $q.reject(errResponse);
                                }
                        );
        }
     
};

}]);