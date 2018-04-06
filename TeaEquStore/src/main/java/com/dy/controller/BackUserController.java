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
import com.dy.model.User;
import com.dy.service.UserService;
import com.dy.utils.JsonUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

@Controller
public class BackUserController {

	@Resource
	private UserService userService;

	//显示用户列表
	@RequestMapping("/userListController")
	@ResponseBody
	public String userListController(HttpServletResponse response, int currentPage,int pageSize,String keyWord) throws IOException {
		/*mybaits的分页插件*/
		PageBounds pageBounds = new PageBounds(currentPage / pageSize + 1, pageSize);
		System.out.println(keyWord);
		List<User> user = userService.selectAllUser(keyWord,pageBounds);
		/*转换成json格式输出*/
		@SuppressWarnings("unchecked")
		Map<String, Object> retMap = (Map<String, Object>) JsonUtil.pagelistToJSONMapNew((PageList<User>) user);
		return JSON.toJSONString(retMap);

	}
	
	//更改用户的状态
	@RequestMapping("/updateStatus")
	public void updateStatus(HttpServletResponse response,int id,int status) throws IOException{
		userService.updateStatus(id, status);
		JsonUtil.sendSuccessJson(response);	
	}
	
	//删除用户
	@RequestMapping("/deleteAccount")
	public void deleteAccount(HttpServletResponse response,int id) throws IOException{
		
		userService.deleteAccount(id);
		JsonUtil.sendSuccessJson(response);
	}
	

}
