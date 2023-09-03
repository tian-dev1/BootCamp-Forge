package com.cristian.contador.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class ResetCtrl {
    @RequestMapping("/reset")
	public String reset(HttpSession session) {
		session.removeAttribute("count");
		return "/Counter/index.jsp";
	}
}
