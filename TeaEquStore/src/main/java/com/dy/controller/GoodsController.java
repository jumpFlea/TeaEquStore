package com.dy.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dy.model.Category;
import com.dy.model.Goods;
import com.dy.model.Page;
import com.dy.service.GoodsService;

/**
 * @author DY
 *
 *         USER:Deng DATE:2018年2月28日 TIME:上午11:13:54
 *
 */

@Controller
public class GoodsController {

	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);

	@Resource
	private GoodsService goodsService;

	/* 首页商品展示 */
	@RequestMapping("/goodsShow")
	public String goodsShow(@RequestParam(value = "needPage") Integer needPage,@RequestParam(value = "mainPage") Integer mainPage,
			@RequestParam(value = "cateName") String cateName, @RequestParam(value = "cateSecName") String cateSecName,HttpServletRequest request) {

		/* System.out.println(needPage); */
		
		/*分页查询时的所有商品返回值*/
		Page<Goods> showAllGoods = goodsService.selectAllGoods(mainPage, cateName, cateSecName);
		
		/* 接受分页查出的热门商品返回值 */
		Page<Goods> showGoods = goodsService.indexShow(needPage, null, null);

		List<Category> cate = goodsService.findAllCate();

		/* System.out.println(user.getUserName()); */
		if (showGoods != null && cate != null) {
			request.setAttribute("cateName", cateName);
			request.setAttribute("cateSecName", cateSecName);
			request.setAttribute("showGoodsAllList", showAllGoods);
			request.setAttribute("showGoodsList", showGoods);
			request.getSession().setAttribute("cate", cate);
			/* System.out.println(showGoods); */
			return "index";
		}
		return "error";
	}

	/* 商品详情 */
	@RequestMapping(value = "/goodsDetails")
	public String goodsDetails(@RequestParam(value = "goodsId") Integer goodsId, HttpServletRequest request) {
		Goods goods = new Goods();
		goods = goodsService.findByGoodsId(goodsId);
		request.setAttribute("goods", goods);
		return "goods_details";
	}

}