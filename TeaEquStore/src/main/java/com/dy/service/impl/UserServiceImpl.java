package com.dy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dy.dao.UserDao;
import com.dy.model.User;
import com.dy.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public User userProve(String userName, String passWord) {
		// TODO Auto-generated method stub

		return userDao.userProve(userName, passWord);
	}

	@Override
	public Integer selectByUserName(String userName) {
		// TODO Auto-generated method stub
		if (userDao.selectByUserName(userName) == null) {
			return 0;
		} else
			return 1;
	}

	@Override
	public User userRegist(User user) {
		// TODO Auto-generated method stub
		userDao.userRegist(user);
		return null;
	}

}
