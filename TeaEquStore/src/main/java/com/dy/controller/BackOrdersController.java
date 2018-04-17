package com.dy.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dy.model.Orders;
import com.dy.model.OrdersSearch;
import com.dy.service.OrderService;
import com.dy.utils.JsonUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

@Controller
@RequestMapping(value = "/backorders")
public class BackOrdersController {

	@Resource
	private OrderService orderService;

	// 显示订单列表
	@RequestMapping("/ordersListController")
	@ResponseBody
	public void userListController(HttpServletResponse response, OrdersSearch oSearch, int pageNumber, int pageSize) throws IOException {
		/* mybaits的分页插件 */
		try{
			JSONObject result=new JSONObject();
		PageBounds pageBounds = new PageBounds(pageNumber / pageSize + 1, pageSize);

		PageList<Orders> orders = (PageList<Orders>) orderService.backShowOrderList(oSearch, pageBounds);
		/* 转换成json格式输出 */
		/*result.put("list", orders);
		result.put("totalResults", orders.size());
		result.put("totalPage", )*/
		JsonUtil.pageListToJSONMapNew(response, orders);
		}
		catch(Exception e){
			e.printStackTrace();
			JsonUtil.sendErrorJson(response, e.getMessage());
		}
	}

}
