package com.dy.dao;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.dy.model.OrderItems;
import com.dy.model.Orders;
import com.dy.model.Page;
import com.dy.model.User;

public interface OrderDao {

	// 将Orders的信息添加到数据库
	public int saveOrders(Orders order);

	// 将OrderItems购物项的信息添加到表中
	public void insertOrderItems(@Param("orderItems") Set<OrderItems> orderItems);

	//通过user.Id找到订单的总计录数
	public int findOrderNum(User user);
	
	//返回一个OrderList列表
	public List<Orders> showOrderList(Page<Orders> page);

}
