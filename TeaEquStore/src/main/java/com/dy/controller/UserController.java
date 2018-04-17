package com.dy.controller; 	
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
			return "redirect:/goodsShow?needPage=1&mainPage=1&cateName=&cateSecName=&search=";
		}
		/*logger.info("now {}" , user);*/
		return "login";
	}
	
	/*用户注册时用户名判断*/
	@RequestMapping("/regist")
	@ResponseBody
	public Object  userRegist(String userName){
		
		Integer i = userService.selectByUserName(userName); 
		if(i==0){
			return true;
		}else
			return false;
	}
	
	/*用户注册*/
	@RequestMapping("/userRegist")
	public   String userRegist(User user){
		userService.userRegist(user);
		return "login";
		
	}
}
