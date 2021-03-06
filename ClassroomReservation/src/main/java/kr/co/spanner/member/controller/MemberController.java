package kr.co.spanner.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import kr.co.spanner.member.service.MemberService;
import kr.co.spanner.member.vo.MemberVO;
import kr.co.spanner.user.reservation.vo.ReservationVO;

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
			session.setAttribute("userNo", memberVO.getMemberNo());
			session.setAttribute("grade", memberVO.getGrade());
			System.out.println(memberVO.getGrade());
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
	
	@RequestMapping("/mypage.do")
	public ModelAndView mypage() throws Exception {
		String id = (String)session.getAttribute("userInfo");
		MemberVO member = service.selectMember(id);
		ModelAndView mav = new ModelAndView("login/mypage");
		mav.addObject("member",member);
		return mav;
	}
	
	@RequestMapping("/modify.do")
	public ModelAndView modify(MemberVO member) throws Exception {
		service.updateMember(member);
		ModelAndView mav = new ModelAndView("redirect:/login/mypage.do");
		return mav;
	}
	
	@RequestMapping("/modifyForm.do")
	public ModelAndView modifyForm() throws Exception {
		String id = (String)session.getAttribute("userInfo");
		MemberVO member = service.selectMember(id);
		ModelAndView mav = new ModelAndView("/login/modifyForm");
		mav.addObject("member",member);
		return mav;
	}
	
	@RequestMapping("/reserve.do")
	public ModelAndView reserve(@RequestParam(value="memberNo", required=false) int memberNo) throws Exception {
		List<ReservationVO> res = service.selectRes(memberNo);
		ModelAndView mav = new ModelAndView("/login/resList");
		mav.addObject("res",res);
		return mav;
	}
	
	@RequestMapping("/resCancel.json")
	@ResponseBody
	public void resCancel(@RequestParam(value="resNo",required=false) int resNo) throws Exception {
		service.cancelRes(resNo);
	}
	
	@RequestMapping("/memberJoin.do")
	public String MemberJoin(MemberVO member) throws Exception {
		service.insertMember(member);
		return "main";
	}
}
