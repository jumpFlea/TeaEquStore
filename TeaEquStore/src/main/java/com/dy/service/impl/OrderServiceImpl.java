package com.dy.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dy.dao.OrderDao;
import com.dy.model.OrderItems;
import com.dy.model.Orders;
import com.dy.model.OrdersSearch;
import com.dy.model.Page;
import com.dy.model.User;
import com.dy.service.OrderService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

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

	
	//找到根据订单id找到订单
	@Override
	public Orders findByOrderId(Integer id) {
		// TODO Auto-generated method stub
		
		return orderDao.findByOrderId(id);
	}
	
	//更改订单里面的收货人信息
	@Override
	public void updateReceiptInformation(Orders orders) {
		// TODO Auto-generated method stub
		orderDao.updateReceiptInformation(orders);
	}

	
	
	@Override
	public void payforOrder(Orders order) {
		// TODO Auto-generated method stub
		orderDao.payforOrder(order);
	}

	@Override
	public List<Orders> backShowOrderList(OrdersSearch ordersSearch,PageBounds pageBounds) {
		// TODO Auto-generated method stub
		return orderDao.backShowOrderList(ordersSearch,pageBounds);
	}

	

	
	
}
