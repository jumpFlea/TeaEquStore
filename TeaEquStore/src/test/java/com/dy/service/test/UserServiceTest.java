package com.dy.service.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.dy.base.test.SpringTestCase;
import com.dy.model.User;
import com.dy.service.UserService;

public class UserServiceTest extends SpringTestCase {

	@Autowired
	private UserService userService;

	@Test
	public void selectUserByIdTest() {
		/*User user = userService.(1);
		System.out.println(user.getUserName() + ":" + user.getUserPassWord());*/
		userService.selectByUserName("12");
	}
}
