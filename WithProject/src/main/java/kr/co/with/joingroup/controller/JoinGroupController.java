package kr.co.with.joingroup.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.with.joingroup.service.JoinGroupService;
import kr.co.with.joingroup.vo.JoinGroupVO;
import kr.co.with.studygroup.member.vo.MemberVO;
import kr.co.with.studygroup.vo.StudyGroupVO;
import kr.co.with.util.MailUtil;

@Controller
@RequestMapping("/joinGroup")
public class JoinGroupController {
	
	@Autowired
	private JoinGroupService service;
	
	// 스터디그룹 가입 여부 확인
	@RequestMapping("/selectJoinGroup.json")
	@ResponseBody
	public int SelectJoinGroup(HttpServletRequest req, int groupNo) throws Exception {
		HttpSession session = req.getSession();
		int memberNo = (int)session.getAttribute("no");

		JoinGroupVO joinGroup = new JoinGroupVO();
		joinGroup.setGroupNo(groupNo);
		joinGroup.setMemberNo(memberNo);
		
		return service.SelectJoinGroup(joinGroup);
	}
	
	// 스터디그룹 가입 폼으로 이동
	@RequestMapping("/redirectJoinForm.do")
	public ModelAndView RedirectJoinForm(int groupNo, String joinType, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("StudyGroupJoinForm/StudyGroupJoinForm");
		
		HttpSession session = req.getSession();
		int memberNo = (int)session.getAttribute("no");

		MemberVO member = service.selectMemberInfo(memberNo);
		mav.addObject("member", member);
		StudyGroupVO group = service.selectStudygroupInfo(groupNo);
		mav.addObject("group", group);
		mav.addObject("joinType", joinType);
		return mav;
	}
	
	// 그룹 가입 신청과 관련된 메소드
	@RequestMapping("/joinGroup.do")
	public ModelAndView JoinGroup(int groupNo, int memberNo, String joinType, 
			String telFirst, int telSecond, int telThird, String comment, String id) throws Exception {
		
		ModelAndView mav = new ModelAndView("redirect:/main/main.do");
		
		JoinGroupVO join = new JoinGroupVO();
		join.setGroupNo(groupNo);
		join.setGroupComment(comment);
		join.setMemberTel(telFirst+"-"+telSecond+"-"+telThird);
		join.setMemberNo(memberNo);
		join.setId(id);
		
		if(joinType.equals("선착순")) {
			join.setMemberStatus("회원");
			mav.addObject("msg", "그룹에 가입한 것을 축하합니다.");
		}
		else {
			join.setMemberStatus("가입신청");
			mav.addObject("msg", "그룹 참가 신청이 완료되었습니다.");
		}
		service.insertJoinGroupInfo(join);

		
		MemberVO member = service.selectMemberInfo(memberNo);
		StudyGroupVO group = service.selectStudygroupInfo(groupNo);
		MailUtil sendMail = new MailUtil();
	    sendMail.SendMailForReserve(member, group, join, joinType);	
		return mav;
	}
	
}
