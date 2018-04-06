package com.dy.service;

import java.util.List;

import com.dy.model.User;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

public interface UserService {
	
	/*用户验证*/
	User userProve(String userName,String passWord);
	
	/*根据用户名查找*/
	Integer selectByUserName(String userName);
	
	/*用户注册*/
	User userRegist(User user);
	
	
	/*查找所有用户*/
	List<User> selectAllUser(String keyWord,PageBounds page);
	
	/*更改用户状态*/
	void updateStatus(int id,int status);
	
	/*删除用户*/
	void deleteAccount(int id);
	
	
	
	
	
}
