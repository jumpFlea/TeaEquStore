package com.dy.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.dao.OrderDao;
import com.dy.model.OrderItems;
import com.dy.model.Orders;
import com.dy.model.Page;
import com.dy.model.User;
import com.dy.service.OrderService;

/**
 * @author DY
 *
 * USER:Deng
 * DATE:2018年3月22日
 * TIME:上午9:51:14
 *
 */

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDao orderDao;

	@Override
	public int saveOrders(Orders order) {
		// TODO Auto-generated method stub
		return orderDao.saveOrders(order);
	}

	@Override
	public void insertOrderItems(Set<OrderItems>  orderItems) {
		// TODO Auto-generated method stub
		orderDao.insertOrderItems(orderItems);
	}

	//寻找到个人用户订单的总记录数
	@Override
	public int findOrderNum(User user) {
		// TODO Auto-generated method stub
		return orderDao.findOrderNum(user);
	}
 
	@Override
	public Page<Orders> showOrderList(Integer page,Integer uid,Integer id) {
		// TODO Auto-generated method stub
		Page<Orders> pa = new Page<Orders>();
		int count =0;
		int limit =5;
		//设置用户id
		pa.setId(uid);
		//设置当前页数
		pa.setCurrentPage(page);
		//设置开始读的第一条记录数
		pa.setBegin((page-1)*limit);
		//设置每页显示的条数
		pa.setLimitPage(limit);
		//设置总页数
		if(id % limit==0){
			count =id/limit;
			pa.setCountPage(count);
		}else{
			count =id/5+1;
			pa.setCountPage(count);
		}
		List<Orders> ord = orderDao.showOrderList(pa);
		pa.setList(ord);
		return pa;
	}
	
	
}
