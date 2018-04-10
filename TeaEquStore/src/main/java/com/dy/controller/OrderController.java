package com.dy.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dy.model.Cart;
import com.dy.model.CartItem;
import com.dy.model.OrderItems;
import com.dy.model.Orders;
import com.dy.model.Page;
import com.dy.model.User;
import com.dy.service.GoodsService;
import com.dy.service.OrderService;

@Controller
public class OrderController {

	private Orders order;

	@Resource
	private OrderService orderService;
	@Resource
	private GoodsService goodsService;

	//提交订单保存到数据库
	@RequestMapping("/submitOrder")
	public String submitOrder(Model model, HttpServletRequest request) {
		order = new Orders();
		order.setOrderTime(new Date());
		order.setOrderState(0);// 0 代表未付款 1代表已付款，未发货 2 代表已发货，未确认收获 3 代表收获
		// 获取购物车
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null) {
			request.setAttribute("error", "亲！您的购物车是空的");
			return "error";
		}
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			request.setAttribute("error", "亲！您还未登录");
			return "login";
		}
		order.setTotal(cart.getTotal());
		order.setUser(user);
		// 返回插入订单表的Id
		orderService.saveOrders(order);
		order.setOid(order.getOid());
		for (CartItem cartItems : cart.getCartItems()) {
			OrderItems orderItems = new OrderItems();
			orderItems.setGoodNum(cartItems.getGoodNum());
			orderItems.setGood(cartItems.getGoods());
			orderItems.setSubtotal(cartItems.getSubtotal());
			orderItems.setOrder(order);
			// 将购物项添加到订单里面
			order.getOrderItems().add(orderItems);
		}
		//保存数据库到订单
		orderService.insertOrderItems(order.getOrderItems());
		//更新数据库的数据
		List<OrderItems> orderItems = new ArrayList<>(order.getOrderItems());
		goodsService.updateGoodsNum(orderItems);
		model.addAttribute("order",order);
		return "order";
	}
	
	//显示用户订单列表的内容
	@RequestMapping("/showOrderList")
	public String showOrderList(Model model,HttpServletRequest request,Integer page){
		
		if(page==null){
			page=1;
		}
		User user = (User)request.getSession().getAttribute("user");
		if(user==null){
			model.addAttribute("error", "亲请先登录");
			return "login";
		}
		Integer id= orderService.findOrderNum(user);
		Page<Orders> orderList = orderService.showOrderList(page,user.getU_id(),id);
		model.addAttribute("orderList",orderList);
		return "showorder";
	}
	
	//根据订单id查询订单
	@RequestMapping("/findByOrderId")
	public String findByOrderId(Model model,Integer id){
		order = orderService.findByOrderId(id);
		model.addAttribute("order", order);
		return "order";
	}
	
	
	
	
	

}
