package kr.co.with.studygroup.member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.with.studygroup.member.service.MemberService;
import kr.co.with.studygroup.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//회원가입를 위한 join.do
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
	
	// 로그인을 위한 서블릿
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
	
	//로그아웃을 위한 서블릿
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/main/main.do";
	}

	
	
	// Facebook 로그인시 MemberTable 회원등록 & 로그인 관련 method
	@ResponseBody
	@RequestMapping("/fbookLogin.do")
	public MemberVO fbookLogin(MemberVO member, HttpServletRequest req) throws Exception {
		int checkVO = service.checkMember(member);
		HttpSession session = req.getSession();
		
		
		System.out.println("회원체크 숫자 : "+checkVO);
		if(checkVO == 0){
			member.setMemberType("페북가입");
			session.setAttribute("id", member.getId());
			session.setAttribute("name", member.getMemberName());
			service.insertFbookMember(member);
			MemberVO joinVO = service.selectFbookMember(member);
			session.setAttribute("grade", joinVO.getMemberGrade());
			session.setAttribute("no", joinVO.getMemberNo());
			return joinVO;
		}
		else{
			MemberVO loginVO = service.selectFbookMember(member);
			session.setAttribute("id", loginVO.getId());
			session.setAttribute("grade", loginVO.getMemberGrade());
			session.setAttribute("name", loginVO.getMemberName());
			session.setAttribute("no", loginVO.getMemberNo());
			return loginVO;
		}
	}
		
	// 로그인한 회원이 가입한 그룹리스트를 가져오는 json
	@RequestMapping("/groupList.json")
	@ResponseBody
	public List<MemberVO> groupList(String memberNo, HttpServletRequest req) throws Exception {
		System.out.println("멤버번호:"+memberNo);
		return service.groupList(memberNo);
	}
	
	//해당 그룹에 가입한 맴버 LIST를 가져오는  json
	@RequestMapping("/memberList.json")
	@ResponseBody
	public List<MemberVO> memberList(String groupNo, HttpServletRequest req) throws Exception {
		System.out.println(groupNo);
		List<MemberVO> list = service.memberList(groupNo);
		System.out.println("asdasd"+list.size());
		return list;
	}
	
	// 해당 게시판등 게시물 등록시 나를 제외한 그룹맴버들 가져오는 json
	@RequestMapping("/nodeMemberList.json")
	@ResponseBody
	public List<MemberVO> nodeMemberList(int groupNo) throws Exception {
		
		return service.nodeMemberList(groupNo);
	}
	
	//쪽지 받을 멤버의 번호를 가져오는  json
	@RequestMapping("/selectMemberNo.json")
	@ResponseBody
	public int selectMemberNo(String memberName, HttpServletRequest req) throws Exception {
		System.out.println(memberName);
		return service.selectMemberNo(memberName);
	}
}
