package com.dy.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.dy.model.Categorysecond;
import com.dy.model.Goods;
import com.dy.model.User;
import com.dy.service.GoodsService;
import com.dy.utils.JsonUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

@Controller
@RequestMapping(value = "/backgoods")
public class BackGoodsController {

	@Resource
	private GoodsService goodsService;

	// 显示商品列表
	@RequestMapping("/goodsListController")
	@ResponseBody
	public String userListController(HttpServletResponse response, int currentPage, int pageSize, String keyWord) throws IOException {
		/* mybaits的分页插件 */
		PageBounds pageBounds = new PageBounds(currentPage / pageSize + 1, pageSize);
		List<Goods> goods = goodsService.backSelectAllGoods(keyWord, pageBounds);

		/* 转换成json格式输出 */
		@SuppressWarnings("unchecked")
		Map<String, Object> retMap = (Map<String, Object>) JsonUtil.pagelistToJSONMapNew((PageList<Goods>) goods);
		return JSON.toJSONString(retMap);
	}

	// 审核商品
	@RequestMapping("/updateGoodsStatus")
	public void updateStatus(HttpServletResponse response, String id, int status) throws IOException {
		goodsService.updateStatus(id, status);
		JsonUtil.sendSuccessJson(response);
	}

	// 批量审核商品
	@RequestMapping("/updateMoreGoods")
	public void updateMoreGoods(HttpServletResponse response, String id, int status) throws IOException {
		goodsService.updateMoreGoods(id, status);
		JsonUtil.sendSuccessJson(response);
	}

	/* 跳转到发布页面,并获取二级分类的值 */
	@RequestMapping("/backJumpRelease")
	public String backJumpRelease(Model model) {
		List<Categorysecond> cateSecond = goodsService.findAllCateSec();
		model.addAttribute("cateSecond", cateSecond);
		return "backstage/backrelease_goods";

	}

	/* 发布商品 */
	@RequestMapping("/releaseGoods")
	public String releaseGoods(MultipartFile upload, Goods goods, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		goods.setUid(user.getU_id());
		goods.setStatus(1);
		goods.setReleaseTime(new Date());
		if (!upload.isEmpty()) {
			String path = "C:\\Users\\Administrator\\git\\TeaEquStore\\TeaEquStore\\src\\main\\webapp\\resource\\images\\backreleasepic\\";
			// 新的图片名称,随机获取一个值并赋予.jpg的后缀
			String newFileName = UUID.randomUUID() + ".jpg";
			// Name:写进数据库中的image地址
			String dbName = "images/backreleasepic/" + newFileName;
			goods.setEquPicture(dbName);
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
			goodsService.insertGoods(goods);
		}
		return "backstage/backrelease_goods";
	}

	// 批量删除用户
	@RequestMapping("/deleteMoreGoods")
	public void deleteMoreGoods(HttpServletResponse response, String id) throws IOException {
		goodsService.deleteMoreGoods(id);
		JsonUtil.sendSuccessJson(response);
	}
	//
	// // 修改用户或增加用户
	// @RequestMapping("/updateAccount")
	// public void updateAccount(HttpServletResponse response, User user) throws
	// IOException {
	// if (user.getU_id() != null) {
	// userService.updateAccount(user);
	// } else
	// userService.addAccount(user);
	// JsonUtil.sendSuccessJson(response);
	// }

}
