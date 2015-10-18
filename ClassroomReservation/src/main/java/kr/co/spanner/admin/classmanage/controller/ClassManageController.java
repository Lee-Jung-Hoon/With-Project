package kr.co.spanner.admin.classmanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/ClassManage")
public class ClassManageController {

	@RequestMapping("/redirectClassManage.do")
	public String ClassManage() throws Exception{
		return "admin/classManageMain";
	}
	
	@RequestMapping("/classInsert.json")
	@ResponseBody
	public String ClassInsert() throws Exception{
		return "main";
	}
	
	@RequestMapping("/redirectClassInset.do")
	public String RedirectClassInsert() throws Exception {
		return "admin/insertManage";
	}
}
