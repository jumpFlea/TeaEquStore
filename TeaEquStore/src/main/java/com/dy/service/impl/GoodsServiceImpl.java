package com.dy.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dy.dao.GoodsDao;
import com.dy.model.Category;
import com.dy.model.Categorysecond;
import com.dy.model.Goods;
import com.dy.model.Page;
import com.dy.model.User;
import com.dy.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDao goodsDao;


	
	@Override
	public Page<Goods> selectAllGoods(int currentPage, String type,String gname) {
		// TODO Auto-generated method stub
		Page<Goods> p = new Page<Goods>();
		// 将当前的页面设置到page中
		p.setCurrentPage(currentPage);
		// 设置每页显示的条数
		int limit = 6;
		p.setLimitPage(limit);
		// 获取当前的总记录数，并设置到page里面对应的属性,设置总页数
		int count = goodsDao.findAllNum();
		if (count%limit == 0) {
			count = count / limit;
			p.setCountPage(count);
		} else {
			count = (count / limit) + 1;
			p.setCountPage(count);
		}
		// 设置开始显示记录的第一条的值
		int begin = (currentPage - 1) * limit;
		p.setBegin(begin);
		p.setAttribute(type);
		p.setGname(gname);
		// 获取图片的信息，存于page中
		List<Goods> imageList = goodsDao.indexShow(p);
		p.setList(imageList);
		return p;
	}


	@Override
	public Page<Goods> indexShow(int currentPage, String type,String gname) {
		// TODO Auto-generated method stub
			Page<Goods> p = new Page<Goods>();
			// 将当前的页面设置到page中
			p.setCurrentPage(currentPage);
			// 设置每页显示的条数
			int limit = 3;
			p.setLimitPage(limit);
			// 获取当前的总记录数，并设置到page里面对应的属性,设置总页数
			int count = goodsDao.findHotNum();
			if (count%limit == 0) {
				count = count / limit;
				p.setCountPage(count);
			} else {
				count = (count / limit) + 1;
				p.setCountPage(count);
			}
			// 设置开始显示记录的第一条的值
			int begin = (currentPage - 1) * limit;
			p.setBegin(begin);
			p.setAttribute(type);
			p.setGname(gname);
			// 获取图片的信息，存于page中
			List<Goods> imageList = new ArrayList<Goods>();
			imageList = goodsDao.indexShow(p);
			p.setList(imageList);
			return p;
	}


	@Override
	public List<Category> findAllCate() {
		// TODO Auto-generated method stub		
		return goodsDao.findAllCate();
	}


	@Override
	public List<Categorysecond> findAllCateSec() {
		// TODO Auto-generated method stub
		return goodsDao.findAllCateSec();
	}


	@Override
	public Goods findByGoodsId(int goodsId) {
		// TODO Auto-generated method stub
		return goodsDao.findByGoodsId(goodsId);
	}
	
	

}
