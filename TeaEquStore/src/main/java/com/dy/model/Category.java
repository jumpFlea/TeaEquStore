package com.dy.model;

import java.util.List;

public class Category {
	private int cateId;
	private String cateName;
	private List<Categorysecond> categorysecond;
		

	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	
	public List<Categorysecond> getCategorysecond() {
		return categorysecond;
	}
	public void setCategorysecond(List<Categorysecond> categorysecond) {
		this.categorysecond = categorysecond;
	}
	
	
	public String toString(){
		return "{一级分类id:"+cateId+"一级分类名字:"+cateName+"}";
	}
	

}
