package com.dy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dy.model.User;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

public interface UserDao {
	
	public User userProve(String userName, String passWord);
	
	public Integer  selectByUserName(String userName);
	
	public String userRegist(User user);
	
	public List<User> selectAllUser(@Param(value="keyWord")String keyWord,PageBounds page);
	
	void updateStatus(int id,int status);
	
	void deleteAccount(int id);
	
	void deleteMoreAccount(String id);
	
}
