package com.cristian.contador.Controllers;


import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

public class CounterCtrl {
    @RequestMapping("/")
	public String index(HttpSession session) {
		if (session.getAttribute("count") == null) {
			session.setAttribute("count", 0);
		}
        Integer count = (Integer) session.getAttribute("count");
		count += 1;
		session.setAttribute("count", count);
		return "/Counter/index.jsp";
	}
}
