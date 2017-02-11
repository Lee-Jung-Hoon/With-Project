package com.merit.pps.bbs.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merit.pps.bbs.service.BbsUserService;
import com.merit.pps.bbs.vo.BbsVo;

@Controller
@RequestMapping(value = "/bbs")
public class BbsUserController {
	@Resource(name = "bbsUserService")
	private BbsUserService bbsUserService;

	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String bbsUserList(Model model) throws Exception {
		System.out.println("옵니까?");
	    List<BbsVo> list = bbsUserService.selectBbsUserList();
	    model.addAttribute("list", list);
	    return "bbs/usr.list";
	}
}
