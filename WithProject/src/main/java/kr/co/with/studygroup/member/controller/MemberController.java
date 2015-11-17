package kr.co.with.studygroup.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

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
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ("yyyy");
		int mTime = Integer.parseInt(mSimpleDateFormat.format (new Date()));
		member.setMemberType("일반가입");
		int age = Integer.parseInt(member.getMemberAge());
		String memberAge= ""+(mTime-age+1);
		member.setMemberAge(memberAge);
		System.out.println("내나이"+ memberAge);
		
		service.insertMember(member);
		
		
		return "redirect:/main/main.do";
	}
	
	@RequestMapping("/login.do")
	public ModelAndView login(MemberVO member, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("main");
		System.out.println(member.getId());
		System.out.println(member.getPassword());
		int checkVO = service.checkMember(member);
		
		
		HttpSession session = req.getSession();
		if(checkVO == 0){
			mav.addObject("msg", "아이디나 비밀번호를 다시 입력하세요.");
		
		}
		else{
			MemberVO loginVO = service.selectMember(member);
			session.setAttribute("id", loginVO.getId());
			session.setAttribute("grade", loginVO.getMemberGrade());
			session.setAttribute("name", loginVO.getMemberName());
			session.setAttribute("no", loginVO.getMemberNo());
		}
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		session.removeAttribute("id");
		session.removeAttribute("grade");
		session.removeAttribute("name");
		return "redirect:/main/main.do";
	}
}
