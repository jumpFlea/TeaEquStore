package com.dy.model;

public class Categorysecond {
	
	/*private int cateId;*/
	private int cateSecId;
	private String cateSecName;
	private Category category;
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}


	public int getCateSecId() {
		return cateSecId;
	}

	public void setCateSecId(int cateSecId) {
		this.cateSecId = cateSecId;
	}

	public String getCateSecName() {
		return cateSecName;
	}


	public void setCateSecName(String cateSecName) {
		this.cateSecName = cateSecName;
	}


	public String toString(){
		return "{二级分类ID:"+cateSecId+"二级分类名字:"+cateSecName+"}";
	}
	

}
