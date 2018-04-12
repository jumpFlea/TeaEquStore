package com.dy.service;

import java.util.Set;

import com.dy.model.OrderItems;
import com.dy.model.Orders;
import com.dy.model.Page;
import com.dy.model.User;


public interface OrderService {
	
	public int saveOrders(Orders order);
	
	public void insertOrderItems(Set<OrderItems> orderItems);
	
	public int findOrderNum(User user);
	
	public Page<Orders> showOrderList(Integer page,Integer uid,Integer id);
	
	public Orders findByOrderId(Integer id);
	
	public void updateReceiptInformation(Orders orders);
	
	public void payforOrder(Orders order); 
	
	
}
