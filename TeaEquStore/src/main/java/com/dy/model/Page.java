package com.dy.model;

import java.util.List;


//分页
public class Page<T> {


	// 当前页数
	private int currentPage;
	// 总页数
	private int countPage;
	// 每页限制的条数
	private int limitPage;
	//从那条数据开始
	private int  begin;
	//设置类型
	private String attribute;
	//设置名字
	private String gname;
	//为了方便，添增一个int属性
	private int id;

	private List<T> list;






	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}


	public int getCountPage() {
		return countPage;
	}

	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getLimitPage() {
		return limitPage;
	}

	public void setLimitPage(int limitPage) {
		this.limitPage = limitPage;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


}
