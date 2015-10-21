package kr.co.spanner.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import kr.co.spanner.member.service.MemberService;
import kr.co.spanner.member.vo.MemberVO;

@Controller
@RequestMapping("/login")
public class MemberController {
	@Autowired
	private MemberService service;
	private HttpSession session;
	
	@RequestMapping("/RedirectLogin.do")
	public String RedirectLogin() throws Exception {
		return "login/login";
	}
	
	@RequestMapping("/login.do")
	public ModelAndView loginCheck(MemberVO member, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = service.selectLogin(member);
		session = req.getSession();
		if (memberVO.getId() != null ) {
			session.setAttribute("userInfo", memberVO.getId());
			session.setAttribute("userInfo", memberVO.getMemberNo());
			mav.setViewName("main");
		} else {
			mav.addObject("msg", "아이디 혹은 비밀번호를 다시 확인해 주세요");
			mav.setViewName("/RedirectLogin.do");
	
		}
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public String logout() throws Exception {
		session.invalidate();
		return "main";
	}
}