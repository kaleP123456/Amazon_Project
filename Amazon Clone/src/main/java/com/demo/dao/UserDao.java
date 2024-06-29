package com.demo.dao;






import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.demo.entity.User;


public class UserDao {
private SessionFactory factory;

public UserDao(SessionFactory factory) {
	super();
	this.factory = factory;
}
public User getUserByEmailAndPassword(String email,String password)
{
	User user=null;
	try {
	
		String query="from User where userEmail =: e and userPassword =:p";
		Session session = this.factory.openSession();
		Query  q = session.createQuery(query);
		q.setParameter("e",email);
		q.setParameter("p", password);
		user =(User) q.uniqueResult();
		session.close();
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
			
			return user;
	}
}
