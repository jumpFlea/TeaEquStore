package com.dy.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dy.model.User;
import com.dy.service.UserService;







/**
 * @author DY
 *
 * USER:Deng
 * DATE:2017年12月24日
 * TIME:上午10:57:15
 *
 */


@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Resource
	private UserService userService;
	
	
	/*验证用户名和密码*/
	@RequestMapping("/userProve")
	public String userProve(String userName,String userPassWord,HttpServletRequest request) {	
		User user = userService.userProve(userName,userPassWord);
		/*System.out.println(user.getUserName());*/
		if(user!=null){
			request.getSession().setAttribute("user", user);
			return "index";
		}
		/*logger.info("now {}" , user);*/
		return "login";
	}
	
	
	/*用户注册*/
	@RequestMapping("/userRegist")
	public String  userRegist(User user){
		
		System.out.println();
		System.out.println();
		System.out.println();
		/*int i = userService.selectByUserName(user.getUserName()); */
		System.out.println(user.getUserName());
		
		
		return "login";
		
	}
	
}
