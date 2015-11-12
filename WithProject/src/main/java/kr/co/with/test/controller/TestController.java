package kr.co.with.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.with.test.vo.TestVO;


@Controller
@RequestMapping("/test")

public class TestController {
	
	@Autowired
	private kr.co.with.test.service.TestService service;
	
	@RequestMapping("/schedule.do")
	public String schedule() throws Exception {
		return "schedule";
	}
	
	
	@RequestMapping("/regist_sch.json")
	@ResponseBody
	public List<TestVO> registSch(TestVO test) throws Exception {
		service.registSch(test);
		return service.selectList();
	}
	
	@RequestMapping("/select_sch.json")
	@ResponseBody
	public List<TestVO> selectList() throws Exception {
		return service.selectList();
	}
	
	@RequestMapping("/update_sch.json")
	@ResponseBody
	public List<TestVO> updateSch(int no) throws Exception {
		service.updateSch(no);
		return service.selectList();
	}
	@RequestMapping("/delete_sch.json")
	@ResponseBody
	public List<TestVO> deleteSch(int no) throws Exception {
		service.deleteSch(no);
		return service.selectList();
	}
}
