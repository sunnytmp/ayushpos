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
 
App.factory('POService', ['$http', '$q', function($http, $q){
 
    return {
         
    	fetchAllPOS: function() {
                    return $http.get('http://ec2-52-25-144-174.us-west-2.compute.amazonaws.com:8080/restpos/PurchaseOrder/')
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching users');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
             
            createPO: function(po){
                    return $http.post('http://ec2-52-25-144-174.us-west-2.compute.amazonaws.com:8080/restpos/PurchaseOrder/', user)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while creating user');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
            
				
            updatePO: function(po, id){
                    return $http.put('http://ec2-52-25-144-174.us-west-2.compute.amazonaws.com:8080/PurchaseOrder/'+id, po)

                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while updating user');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
          
            deletePO: function(id){
                return $http.delete('http://ec2-52-25-144-174.us-west-2.compute.amazonaws.com:8080/restpos/PurchaseOrder/'+id)
                        .then(
                                function(response){
                                    return response.data;
                                }, 
                                function(errResponse){
                                    console.error('Error while deleting user');
                                    return $q.reject(errResponse);
                                }
                        );
        }
     
};

}]);