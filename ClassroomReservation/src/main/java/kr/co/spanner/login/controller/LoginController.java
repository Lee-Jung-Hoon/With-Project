package kr.co.spanner.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/LoginController")
public class LoginController {

	// 로그인으로 이동
	@RequestMapping("/redirectLogin.do")
	public String RedirectLogin() throws Exception{
		return "main";
	}
}
