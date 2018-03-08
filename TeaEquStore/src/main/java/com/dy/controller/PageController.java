package com.dy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/page")
public class PageController {

	/*
	 * private HttpServletRequest request; private HttpServletResponse reponse;
	 * private HttpSession session;
	 */

	@RequestMapping(value = "/jumpLogin")
	public String jumpLogin() {
		return "login";
	}

	@RequestMapping(value = "/jumpRegist")
	public String JumpRegist() {
		return "register";
	}
	
}
