package com.dy.service;

import java.util.List;

import com.dy.model.Category;
import com.dy.model.Categorysecond;
import com.dy.model.Goods;
import com.dy.model.OrderItems;
import com.dy.model.Page;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

public interface GoodsService {

	/* 获取全部商品信息 */
	Page<Goods> selectAllGoods(int currentPage, String cateName, String cateSecName, String search);

	/* 分页显示热火商品信息 */
	Page<Goods> indexShow(int currentPage, String type, String gname);

	/* 获取一级分类 */
	List<Category> findAllCate();

	/* 获取二级分类 */
	List<Categorysecond> findAllCateSec();

	/* 根据商品id查询到商品的详情 */
	Goods findByGoodsId(int goodsId);

	/* 提交订单时更改商品数量 */
	void updateGoodsNum(List<OrderItems> orderItems);

	/* 后台操作 */
	/*查找所有用户*/
	List<Goods> backSelectAllGoods(String keyWord,PageBounds page);
}
