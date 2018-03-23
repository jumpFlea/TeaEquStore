package com.dy.service;

import java.util.List;
import java.util.Set;

import com.dy.model.Category;
import com.dy.model.Categorysecond;
import com.dy.model.Goods;
import com.dy.model.Page;

public interface GoodsService {
	
	/*获取全部商品信息*/
	Page<Goods> selectAllGoods(int currentPage, String cateName,String cateSecName);
	
	/*分页显示热火商品信息*/
	Page<Goods> indexShow(int currentPage, String type,String gname);
		
	/*获取一级分类*/
	List<Category> findAllCate();
	
	/*获取二级分类*/
	List<Categorysecond> findAllCateSec();
	
	/*根据商品id查询到商品的详情*/
	Goods findByGoodsId(int goodsId);
}
