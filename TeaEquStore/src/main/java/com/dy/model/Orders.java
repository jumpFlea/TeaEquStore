package com.dy.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Orders {
	private int oid;//订单号
	private double total;//总计
	private Date orderTime;//订单时间 
	private Integer orderState;//订单状态
	private String name;//收货人姓名
	private String address;//收获地址
	private String phone;//收货人电话
	private String trade_no;//支付宝交易号
	private String changTime;//订单时间
	
	
	public String getChangTime() {
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 changTime = format.format(this.orderTime);
		 return changTime;
	}

	public void setChangTime(String changTime) {
		this.changTime = changTime;
	}


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
