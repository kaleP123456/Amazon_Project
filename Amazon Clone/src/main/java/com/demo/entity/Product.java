package com.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Product_Table")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pID;
	private String pName;

	@Column(length = 3000)
	private String pDes;
	private String pPhoto;
	private int pPrice;
	private int PDiscount;
	private int pQuantity;
	
	

	@ManyToOne
	private Category category;
	
	
	public Product(Category category) {
		super();
		this.category = category;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	
	public int getpID() {
		return pID;
	}

	public void setpID(int pID) {
		this.pID = pID;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpDes() {
		return pDes;
	}

	public void setpDes(String pDes) {
		this.pDes = pDes;
	}

	public String getpPhoto() {
		return pPhoto;
	}

	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getPDiscount() {
		return PDiscount;
	}

	public void setPDiscount(int pDiscount) {
		PDiscount = pDiscount;
	}

	public int getpQuantity() {
		return pQuantity;
	}

	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
		
		
	}

	public Product( String pName, String pDes, String pPhoto, int pPrice, int pDiscount, int pQuantity) {
		super();
		this.pName = pName;
		this.pDes = pDes;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		PDiscount = pDiscount;
		this.pQuantity = pQuantity;
	}

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Product [pID=" + pID + ", pName=" + pName + ", pDes=" + pDes + ", pPhoto=" + pPhoto + ", pPrice="
				+ pPrice + ", PDiscount=" + PDiscount + ", pQuantity=" + pQuantity + ", category=" + category + "]";
	}
	
	//calculate   price after discount
	
	public int  getPriceAfterDiscount() {
		
		int d=(int)((this.getPDiscount()/100.0)*this.getpPrice());
		
		
		return this.getpPrice()-d;
		
	}
	


}
