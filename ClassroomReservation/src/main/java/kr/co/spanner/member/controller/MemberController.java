package kr.co.spanner.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import kr.co.spanner.member.service.MemberService;
import kr.co.spanner.member.vo.MemberVO;

@Controller
@RequestMapping("/login")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("/login.do")
	public ModelAndView loginCheck(MemberVO member, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = service.selectLogin(member);
		HttpSession session = req.getSession();
		if (memberVO.getId() != null && memberVO.getGrade() == 1) {
			session.setAttribute("admin", memberVO.getId());
			System.out.println("관리자 로그인");
		} else if (memberVO.getId() != null && memberVO.getGrade() == 0) {
			session.setAttribute("user", memberVO.getId());
			System.out.println("유저 로그인");
		} else {
			mav.addObject("msg", "아이디 혹은 비밀번호를 다시 확인해 주세요");
		}
		return mav;
	}
}
