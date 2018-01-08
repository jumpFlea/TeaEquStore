package com.dy.dao;

import com.dy.model.User;

public interface UserDao {
	
	public User userProve(String userName, String passWord);
	
	public Integer  selectByUserName(String userName);
	
	public String userRegist(User user);
	
}
