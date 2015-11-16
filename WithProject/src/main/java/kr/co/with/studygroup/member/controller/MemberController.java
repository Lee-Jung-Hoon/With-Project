package kr.co.with.studygroup.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.with.studygroup.member.service.MemberService;
import kr.co.with.studygroup.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/join.do")
	public String join(MemberVO member) throws Exception {
		service.insertMember(member);
		return "redirect:/member/login.do?id="+member.getId();
	}
	
	@RequestMapping("/login.do")
	public ModelAndView login(@RequestParam("id") String id, MemberVO member, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		int grade = member.getMemberGrade();
		switch(grade) {
		case 0 :  
			session.setAttribute("id", id);
			session.setAttribute("grade", grade);
			return new ModelAndView("");
		case 1 :
			session.setAttribute("id", id);
			session.setAttribute("grade", grade);
			return new ModelAndView("");
		default :
			return new ModelAndView("");
			}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req) throws Exception {
		req.getSession().invalidate();
		return "redirect:/main/main.do";
	}
}
