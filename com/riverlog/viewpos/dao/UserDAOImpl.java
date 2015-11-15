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
package com.riverlog.viewpos.dao;

import java.sql.SQLException;
import java.util.List;

import com.riverlog.viewpos.model.User;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.springframework.transaction.annotation.Transactional;

public class UserDAOImpl implements UserDAO {
	private SessionFactory sessionFactory;

	public UserDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	@Transactional
	public List<User> list() {
		@SuppressWarnings("unchecked")
		List<User> listUser = (List<User>) sessionFactory.getCurrentSession()
				.createCriteria(User.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listUser;
	}
	
    
	public List<User> getUser(int id){
		//call test.GetUserByID(1) in toad
		
		Query query = sessionFactory.getCurrentSession().createSQLQuery(
				//"CALL GetStocks(:stockCode)")
				"call GetUserByName(:id)")
				.addEntity(User.class)
				//.setParameter("stockCode", "7277");
				.setParameter("userid", id);
						
			List result = query.list();
			for(int i=0; i<result.size(); i++){
				User user = (User)result.get(i);
				System.out.println(user.getUsername());
			}
		return result;
		
	}
	
}
