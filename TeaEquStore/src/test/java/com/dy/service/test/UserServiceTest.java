package com.dy.service.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.dy.base.test.SpringTestCase;
import com.dy.model.Goods;
import com.dy.model.Page;
import com.dy.service.GoodsService;
import com.dy.service.UserService;

public class UserServiceTest extends SpringTestCase {

	@Autowired
	private UserService userService;
	@Autowired
	private GoodsService goodsService;

	@Test
	public void selectUserByIdTest() {
		/*User user = userService.(1);
		System.out.println(user.getUserName() + ":" + user.getUserPassWord());*/
		/*userService.selectByUserName("12");*/
		
		Page<Goods> good = goodsService.selectAllGoods(1, "标本", null,null);
		System.out.println(good.getList().get(0));
		System.out.println(good.getList().size());
		
	}
}
