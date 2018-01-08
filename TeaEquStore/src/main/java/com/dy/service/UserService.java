package com.dy.service;

import com.dy.model.User;

public interface UserService {
	
	/*用户验证*/
	User userProve(String userName,String passWord);
	
	/*根据用户名查找*/
	Integer selectByUserName(String userName);
	
	/*用户注册*/
	User userRegist(User user);
	
}
