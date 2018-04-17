package com.dy.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;
import com.dy.model.Goods;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.github.miemiedev.mybatis.paginator.domain.Paginator;

public class JsonUtil {

	public static final Logger logger = LoggerFactory.getLogger(JsonUtil.class);

	/**
	 * 发送json格式数据
	 * 
	 * @throws IOException
	 */
	public static void sendText(HttpServletResponse response, String data) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		writer.write(data);
		writer.flush();
		writer.close();
	}

	/**
	 * 发送json格式数据
	 * 
	 * @throws IOException
	 */
	public static void sendJson(HttpServletResponse response, String data) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter writer = response.getWriter();
		writer.write(data);
		writer.flush();
		writer.close();
	}

	/**
	 * 只发送success标志位
	 * 
	 * @author felix @date 2013-5-19 上午9:58:48
	 * @param response
	 * @throws IOException
	 */
	public static void sendSuccessJson(HttpServletResponse response) throws IOException {
		JSONObject result = new JSONObject();
		result.put("success", true);
		sendJson(response, result.toString());
	}

	/**
	 * 在传入参数内，加入成功标志符
	 * 
	 * @author felix @date 2013-5-19 上午9:58:48
	 * @param response
	 * @throws IOException
	 */
	public static void sendSuccessJson(HttpServletResponse response, JSONObject result) throws IOException {
		result.put("success", true);
		sendJson(response, result.toString());
	}
	
	public static void sendListJson(HttpServletResponse response,List<Goods> list) throws IOException {
		JSONObject result = new JSONObject();
		result.put("list", list);
		sendJson(response, result.toString());
	}

	/* 订单 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void pageListToJSONMapNew(HttpServletResponse response, PageList list) throws IOException {
		JSONObject result = new JSONObject();
		if (list != null) {
			Paginator paginator = list.getPaginator();
			result.put("list", list);
			result.put("totalPage", paginator.getTotalPages());
			result.put("totalResults",paginator.getTotalCount());
			result.put("success", true);
		}
		sendJson(response, result.toString());
	}
	
	/* bootstrap */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Object pagelistToJSONMapNew(PageList list) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (list != null) {
			Paginator paginator = list.getPaginator();
			map.put("total", paginator.getTotalCount());
			map.put("rows", new ArrayList(list));
		}
		return map;
	}

	/**
	 * 在传入参数内，加入成功标志符
	 * 
	 * @author felix @date 2013-5-19 上午9:58:48
	 * @param response
	 * @throws IOException
	 */
	/*
	 * public static void sendSuccessJson(HttpServletResponse
	 * response,net.sf.json.JSONObject result) throws IOException {
	 * result.put("success", true); sendJson(response, result.toString()); }
	 */

	/**
	 * 发送json格式数据
	 * 
	 * @throws IOException
	 */
	public static void sendErrorJson(HttpServletResponse response, String msg) throws IOException {
		sendErrorJson(response, msg, null);
	}

	public static void sendErrorJson(HttpServletResponse response, String msg, Exception e) throws IOException {
		JSONObject result = new JSONObject();
		if (e == null) {
			logger.error(msg);
		} else {
			logger.error(msg, e);
		}
		result.put("success", false);
		result.put("info", msg);
		sendJson(response, result.toString());
	}

	/**
	 * 发送json格式数据
	 * 
	 * @throws IOException
	 */
	/*
	 * public static void sendErrorJson(HttpServletResponse response, String
	 * msg, Exception e) throws IOException { JSONObject result = new
	 * JSONObject(); if (e == null) { logger.error(msg); } else {
	 * logger.error(msg, e); } //输出错误参数的原因 if( e != null && e instanceof
	 * Assert.ParamException){ msg += "\t" + e.getMessage(); }
	 * result.put("success", false); result.put("info", msg);
	 * if(msg.contains("该用户已在其它设备登录")){ result.put("isLoginOther", 1);
	 * result.put("info", "该用户已在其它设备登录"); } sendJson(response,
	 * result.toString()); }
	 */

	/**
	 * 跳转错误页面
	 * 
	 * @author felix @date 2013-7-29 下午8:51:47
	 * @param model
	 * @param msg
	 * @return
	 */
	/*
	 * public static String goErrorPage(Model model,String msg){ return
	 * goErrorPage(model, msg,null); }
	 */

	/**
	 * 跳转错误页面
	 * 
	 * @author felix @date 2013-7-29 下午8:51:47
	 * @param model
	 * @param msg
	 * @return
	 */
	/*
	 * public static String goErrorPage(Model model,Exception e){ return
	 * goErrorPage(model,"",e); }
	 */

	/**
	 * 跳转错误页面
	 * 
	 * @author felix 2017年9月21日 下午4:14:11
	 * @param model
	 * @param msg
	 * @param e
	 * @return
	 */
	/*
	 * public static String goErrorPage(Model model,String msg,Exception e){ if
	 * (e != null) { logger.error(msg,e); }
	 * 
	 * //输出错误参数的原因 if( e != null && e instanceof Assert.ParamException){ msg +=
	 * "\t" + e.getMessage(); }
	 * 
	 * model.addAttribute("errorMsg", msg); return "/error/500"; }
	 */

	/**
	 * 获得url前缀全路径
	 * 
	 * @author felix @date 2013-7-30 上午12:42:31
	 * @param request
	 * @return
	 */
	public static String getAllPath(HttpServletRequest request) {
		return request.getScheme() + "://" + request.getServerName() + request.getContextPath();
	}

	/**
	 * 获得客户端ip
	 * 
	 * @author felix @date 2013-8-14 下午8:00:59
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Real-IP");
		if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
			return ip;
		}
		ip = request.getHeader("X-Forwarded-For");
		if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
			// 多次反向代理后会有多个IP值，第一个为真实IP。
			int index = ip.indexOf(',');
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		} else {
			return request.getRemoteAddr();
		}
	}

	/**
	 * 是否为ajax请求
	 * 
	 * @author felix @date 2014-9-16 下午3:38:24
	 * @param request
	 * @return
	 */
	public static boolean isAjax(HttpServletRequest request) {
		String header = request.getHeader("X-Requested-With");
		return "XMLHttpRequest".equals(header);
	}

	/**
	 * 填充数据
	 * 
	 * @author felix 2017年10月9日 下午7:31:23
	 * @param name
	 * @param obj
	 * @return
	 */
	public static JSONObject putData(String name, Object obj) {
		JSONObject result = new JSONObject();
		result.put(name, obj);
		return result;
	}

	/**
	 * 将数据封装成datatable需要的格式
	 * 
	 * @author felix 2017年9月22日 上午10:27:47
	 * @param page
	 */
	/*
	 * public static JSONObject putData(Page page){ JSONObject result = new
	 * JSONObject(); putData(result,page); return result; }
	 */

	/**
	 * 将数据封装成datatable需要的格式
	 * 
	 * @author felix 2017年9月22日 上午10:27:47
	 * @param result
	 * @param page
	 */
	/*
	 * public static void putData(JSONObject result, Page page){
	 * result.put("data", page.getList()); result.put("recordsTotal",
	 * page.getTotal()); result.put("recordsFiltered", page.getTotal()); }
	 */

	/**
	 * 获得参数中的filters
	 * 
	 * @author felix
	 * @date 2014-3-18 下午3:25:30
	 * @param request
	 * @return
	 */
	/*
	 * public static List<PropertyFilter> getFilters(HttpServletRequest
	 * request){ List<PropertyFilter> filters = new ArrayList<PropertyFilter>();
	 * Set<Map.Entry<String, String[]>> set =
	 * request.getParameterMap().entrySet(); for(Entry<String, String[]> entry:
	 * set){ String name = entry.getKey();
	 * if(name.toUpperCase().startsWith("FILTER_") &&
	 * StringUtils.isNotEmpty(entry.getValue()[0])){ name =
	 * StringUtils.substringAfter(name, "_"); filters.add(new
	 * PropertyFilter(name,entry.getValue()[0])); } } return filters; }
	 */

}
