package com.demo.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.demo.entity.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;

	}	
	public boolean saveProduct(Product product) {
		boolean f = false;
		try {
		  Session session=	this.factory.openSession();
		  Transaction tx = session.beginTransaction();
		  session.save(product);
		  tx.commit();
		  session.close();
		  f= true;
		  
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
	}
	
	//get all products
	
	public List<Product> getAllProducts(){
		Session ss =this.factory.openSession();
	   Query q= ss.createQuery("from Product",Product.class);
		List<Product> list=q.list();
		return list;
	}
	
	//get all products of given category
	
		public List<Product> getAllProductsById(int cid){
			Session ss =this.factory.openSession();
		   Query q= ss.createQuery("from Product as p where p.category.categoryID =: id ");
		   q.setParameter("id",cid);
		   List<Product> list=q.list();
			return list;
		}
}
