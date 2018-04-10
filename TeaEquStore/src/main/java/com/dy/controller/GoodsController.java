package com.dy.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dy.model.Category;
import com.dy.model.Categorysecond;
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
	public String goodsShow(@RequestParam(value = "needPage") Integer needPage, @RequestParam(value = "mainPage") Integer mainPage, @RequestParam(value = "cateName") String cateName, @RequestParam(value = "cateSecName") String cateSecName, String search, HttpServletRequest request) {

		/* 分页查询时的所有商品返回值 */
		Page<Goods> showAllGoods = goodsService.selectAllGoods(mainPage, cateName, cateSecName, search);

		/* 接受分页查出的热门商品返回值 */
		Page<Goods> showGoods = goodsService.indexShow(needPage, null, null);

		List<Category> cate = goodsService.findAllCate();

		/* System.out.println(user.getUserName()); */
		if (showGoods != null && cate != null) {
			request.setAttribute("cateName", cateName);
			request.setAttribute("cateSecName", cateSecName);
			request.setAttribute("search", search);
			request.setAttribute("showGoodsAllList", showAllGoods);
			request.setAttribute("showGoodsList", showGoods);
			request.getSession().setAttribute("cate", cate);
			/* System.out.println(showGoods); */
			return "index";
		}

		return "error";
	}

	/* 搜索按钮 */

	/* 商品详情 */
	@RequestMapping(value = "/goodsDetails")
	public String goodsDetails(@RequestParam(value = "goodsId") Integer goodsId, HttpServletRequest request) {
		Goods goods = new Goods();
		goods = goodsService.findByGoodsId(goodsId);
		request.setAttribute("goods", goods);
		return "goods_details";
	}

	@RequestMapping("/jumpRelease")
	public String jumpRelease(Model model) {
		List<Categorysecond> cateSecond = goodsService.findAllCateSec();
		model.addAttribute("cateSecond", cateSecond);
		return "release_goods";

	}

	/* 发布商品 */
	@RequestMapping("/releaseGoods")
	public String releaseGoods(MultipartFile upload, Goods good) {

		if (!upload.isEmpty()) {
			String path = "C:\\Users\\Administrator\\git\\TeaEquStore\\TeaEquStore\\src\\main\\webapp\\resource\\images\\releasepic\\";
			// 新的图片名称,随机获取一个值并赋予.jpg的后缀
			String newFileName = UUID.randomUUID() + ".jpg";
			// Name:写进数据库中的image地址
			String dbName = "images/releasepic/" + newFileName;
			good.setEquPicture(dbName);
			// 新的图片
			File newFile = new File(path + newFileName);
			try {
				upload.transferTo(newFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "release_goods";
	}
	
	
	
	
	

}