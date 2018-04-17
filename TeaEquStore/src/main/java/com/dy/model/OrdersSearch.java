package com.dy.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.dy.utils.DateChangeString;
 public class OrdersSearch {
	private String oid;//订单号
	private String eid;//商品id;
	
	private String equName;//商品名字
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date orderStart;//订单开始时间 
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date orderEnd;//订单结束时间
	private Integer orderState;//订单状态
	private String name;//收货人姓名	
	private String address;//收获地址
	private String phone;//收货人电话
	private String orderStartTime;
	private String orderEndTime;
	
	
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	
	public String getEquName() {
		return equName;
	}
	public void setEquName(String equName) {
		this.equName = equName;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
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
	public String getOrderEndTime(Date dateTime) {
		
		 return DateChangeString.daToStr(dateTime);
	}
	

	
	public String getOrderStartTime(Date dateTime) {
		 return DateChangeString.daToStr(dateTime);
	}
	public Date getOrderStart() {
		return orderStart;
	}
	public void setOrderStart(Date orderStart) {
		this.orderStart = orderStart;
	}
	
	public void setOrderStartTime(String orderStartTime) {
		this.orderStartTime = orderStartTime;
	}
	public void setOrderEnd(Date orderEnd) {
		this.orderEnd = orderEnd;
	}
	public Date getOrderEnd() {
		return orderEnd;
	}
	public void setEndStartTime(String endStartTime) {
		this.orderEndTime = endStartTime;
	}
	
	
	

}
