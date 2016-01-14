package com.riverlog.viewpos.model;

import javax.persistence.*;

public class Category {
	private int id;
	private String name;
	private String descp;

	public Category(int pcatid,String pname,String pdescp) {
		this.id = pcatid;
		this.name = pname;
		this.descp = pdescp;
	}
	
	public Category(int catid) {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String catname) {
		this.name = catname;
	}

	public String getDescp() {
		return descp;
	}

	public void setDescp(String catdescp) {
		this.descp = catdescp;
	}
}