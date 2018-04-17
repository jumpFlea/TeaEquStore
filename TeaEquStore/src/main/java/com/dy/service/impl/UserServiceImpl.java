package com.dy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.dao.UserDao;
import com.dy.model.Goods;
import com.dy.model.User;
import com.dy.service.UserService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

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
	public void userRegist(User user) {
		// TODO Auto-generated method stub
		userDao.userRegist(user);
		
	}

	@Override
	public List<User> selectAllUser(String keyWord,PageBounds page) {
		// TODO Auto-generated method stub
		return userDao.selectAllUser(keyWord,page);
	}
	
	@Override 
	public void updateStatus(int id, int status) {
		// TODO Auto-generated method stub
		userDao.updateStatus(id,status);
	}

	@Override
	public void deleteAccount(int id) {
		// TODO Auto-generated method stub
		userDao.deleteAccount(id);
	}
	
	@Override
	public void deleteMoreAccount(String id){
		// TODO Auto-generated method stub
		userDao.deleteMoreAccount(id);
	}

	@Transactional
	public void updateAccount(User user) {
		// TODO Auto-generated method stub
		userDao.updateAccount(user);
	}

	@Transactional
	public void addAccount(User user) {
		// TODO Auto-generated method stub
		userDao.addAccount(user);
	}

	@Override
	public List<Goods> selectUserReleaseGoods(String releaseTime) {
		// TODO Auto-generated method stub
		return userDao.selectUserReleaseGoods(releaseTime);
	}

}
