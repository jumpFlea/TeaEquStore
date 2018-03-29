package com.dy.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Orders {
	private int oid;
	private double total;
	private Date orderTime;
	private Integer orderState;
	private String name;
	private String address;
	private String phone;
	private String trade_no;
	
	
	private User user;
	
	private Set<OrderItems> orderItems=new HashSet<OrderItems>();

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getOrderState() {
		return orderState;
	}

	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<OrderItems> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItems> orderItems) {
		this.orderItems = orderItems;
	}
	
	public String getTrade_no() {
		return trade_no;
	}

	public void setTrade_no(String trade_no) {
		this.trade_no = trade_no;
	}

	
	public String toString(){
		return "oid;"+oid+"total;"+total+"orderTime;"+orderTime+"orderState;"+orderState+
				"name;"+name+"address;"+address+"phone;"+phone+"trade_no"+trade_no;
	}
	
}
