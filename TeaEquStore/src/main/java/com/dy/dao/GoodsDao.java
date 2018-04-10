package com.dy.dao;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.dy.model.Category;
import com.dy.model.Categorysecond;
import com.dy.model.Goods;
import com.dy.model.OrderItems;
import com.dy.model.Page;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

public interface GoodsDao {

	/* 获取全部商品信息 */
	List<Goods> selectAllGoods(Page<Goods> page);

	/* 查找一级分类或二级分类或所有商品的数量 */
	int findAllNum(@Param(value = "cateType") String cateType, @Param(value = "cateSecName") String cateSecName, @Param(value = "search") String search);

	/*
	 * 查找一级对应二级分类下的所有商品数量 int findAllSecNum(@Param(value="cateSecName") String
	 * cateSecName);
	 */

	/* 分页显示商品信息 */
	List<Goods> indexShow(Page<Goods> page);

	/* 查找最热的商品数量 */
	int findHotNum();

	/* 获取一级分类 */
	List<Category> findAllCate();

	/* 获取二级分类 */
	List<Categorysecond> findAllCateSec();

	/* 根据商品id查询到商品的详情 */
	Goods findByGoodsId(int goodsId);

	/* 更改商品数量*/
	void updateGoodsNum(List<OrderItems> orderItems);
	
	
	
	/*后台操作部分*/
	/*查询所有商品*/
	List<Goods> backSelectAllGoods(String keyWord, PageBounds page);
	
	

}
