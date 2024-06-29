package com.demo.dao;

import java.util.List;

import javax.servlet.http.Part;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.demo.entity.Category;

public class Categorydao {
	private SessionFactory factory;

	public Categorydao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	public int saveCategory(Category cat)
	{
		Session session = this.factory.openSession();
		Transaction tx=session.beginTransaction();
		 int catId=(int)session.save(cat);
		tx.commit();
		session.close();
		return catId;
	}
	
	public List<Category> getCategory(){
		
		Session s = this.factory.openSession();
		Query q = s.createQuery("from Category");
		List<Category> list= q.list();
		return list;
		
	}
	
	public Category getCategoryById(int cId) {
		Category cat = null;
		try {
			Session session= this.factory.openSession();
			cat=session.get(Category.class, cId);
			return cat;		
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return cat;
	}
	
	
	
	

}
