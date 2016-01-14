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
package com.riverlog.viewpos.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
 
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.riverlog.viewpos.model.User;
import com.riverlog.viewpos.model.ModelTester; 

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
     
    private static final AtomicLong counter = new AtomicLong();
     
    private static List<User> users;
     
    static{
        users= populateDummyUsers();
    }
 
    public List<User> findAllUsers() {
        return users;
    }
     
    public User findById(long id) {
        for(User user : users){
            if(user.getId() == id){
                return user;
            }
        }
        return null;
    }
     
    public User findByName(String name) {
        for(User user : users){
            if(user.getUsername().equalsIgnoreCase(name)){
                return user;
            }
        }
        return null;
    }
     
    
    public void saveUser(User user) {
        user.setId(counter.incrementAndGet());
        users.add(user);
    }
 
    public void updateUser(User user) {
        int index = users.indexOf(user);
        users.set(index, user);
    }
 
    public void deleteUserById(long id) {
         
        for (Iterator<User> iterator = users.iterator(); iterator.hasNext(); ) {
            User user = iterator.next();
            if (user.getId() == id) {
                iterator.remove();
            }
        }
    }
 
    public boolean isUserExist(User user) {
        return findByName(user.getUsername())!=null;
    }
     
    public void deleteAllUsers(){
        users.clear();
    }
 
    private static List<User> populateDummyUsers(){
    	
       List<User> users = new ArrayList<User>();
       users.add(new User(counter.incrementAndGet(),"Deb B", "NY", "sam@abc.com",35,434223,"415-241-2404","415-241-2404"));
        users.add(new User(counter.incrementAndGet(),"Udhay", "ALBAMA", "tomy@abc.com",26,34324234,"415-241-2404","415-241-2404"));
       users.add(new User(counter.incrementAndGet(),"Kelly", "Bay Area", "kelly@abc.com",28,23423423,"415-241-2404","415-241-2404"));
        
        return users;
    }
 
}