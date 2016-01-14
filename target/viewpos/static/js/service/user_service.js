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
 
App.factory('UserService', ['$http', '$q', function($http, $q){
 
    return {
         
            fetchAllUsers: function() {
                    return $http.get('http://localhost:8080/restpos-1.0.0-BUILD-SNAPSHOT/user/')
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
             
            createUser: function(user){
                    return $http.post('http://localhost:8080/restpos-1.0.0-BUILD-SNAPSHOT/user/', user)
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
            
				
            updateUser: function(user, id){
                    return $http.put('http://localhost:8080/restpos-1.0.0-BUILD-SNAPSHOT/user/'+id, user)

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
          
            deleteUser: function(id){
                return $http.delete('http://localhost:8080/restpos-1.0.0-BUILD-SNAPSHOT/user/'+id)
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