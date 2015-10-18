package kr.co.spanner.admin.classmanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ClassManage")
public class ClassManageController {

	@RequestMapping("/redirectClassManage.do")
	public String ClassManage() throws Exception{
		return "admin/classManageMain";
	}
	
	@RequestMapping("/redirect.do")
	public String redirect() throws Exception{
		return "main";
	}
}
