package com.dy.dao;

import java.util.List;
import java.util.Set;

import com.dy.model.Category;
import com.dy.model.Categorysecond;
import com.dy.model.Goods;
import com.dy.model.Page;

public interface GoodsDao {
	
	/*获取全部商品信息*/
	List<Goods> selectAllGoods(Page<Goods> page);
	
	/*查找所有商品的数量*/
	int findAllNum();
	
	/*分页显示商品信息*/
	List<Goods> indexShow(Page<Goods> page);
	
	/*查找最热的商品数量*/
	int findHotNum(); 
	
	/*获取一级分类*/
	List<Category> findAllCate();
	
	/*获取二级分类*/
	List<Categorysecond> findAllCateSec();
	
	/*根据商品id查询到商品的详情*/
	Goods findByGoodsId(int goodsId);
	
	
}
