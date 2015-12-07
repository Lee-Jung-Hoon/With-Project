package kr.co.with.studygroup.attend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//import kr.co.with.studygroup.attend.service.AttendService;

@Controller
@RequestMapping("/attend")
public class AttendController {

//	@Autowired
//	private AttendService service;
	
	@RequestMapping("/attendMain.do")
	public ModelAndView AttendMain(int groupNo) throws Exception {
		ModelAndView mav = new ModelAndView("StudygroupAttend/attendMain");
		return mav;
	}
}
