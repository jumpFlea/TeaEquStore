package com.dy.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dy.model.Cart;
import com.dy.model.CartItem;
import com.dy.model.Goods;
import com.dy.service.GoodsService;

/**
 * @author DY
 *
 *         USER:Deng DATE:2018年3月15日 TIME:上午10:48:48
 *
 */

@Controller
public class CartController {

	@Resource
	private GoodsService goodsService;

	/*添加到购物车*/
	@RequestMapping("/addToCart")
	public String addToCart(@RequestParam(value="e_id")int e_id, @RequestParam(value="goodNum")int goodNum,HttpServletRequest request) {
		/* 设置一个购物项 */
		CartItem cartItem = new CartItem();
		cartItem.setGoodNum(goodNum);
		/* 设置商品信息 */
		Goods goods = goodsService.findByGoodsId(e_id);
		cartItem.setGoods(goods);
		/*设置一个购物车，将购物项添加*/
		Cart cart = new Cart();
		cart = getCart(request);
		cart.addCart(cartItem);
		return "cart";
	}
	
	/*移除购物车中的一项*/
	@RequestMapping("/removeCart")
	public String removeCart(@RequestParam(value="gid") Integer gid,HttpServletRequest request){
		Cart cart = new Cart();
		cart = getCart(request);
		cart.removeCart(gid);
		return "cart";
		
	}
	
	
	/*我的购物车*/
	@RequestMapping("/myCart")
	public String myCart(){
		return "cart";
	}
	
	
	/*清空购物车*/
	@RequestMapping("/clearCart")
	public String clearCart(HttpServletRequest request){
		Cart cart = new Cart();
		cart = getCart(request);
		cart.clearCart();
		return "cart";
		
	}
	
	/*将购物项添加到cart里面*/
	private Cart getCart(HttpServletRequest request){
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);	
		}
		return cart;	
	}
	

}
