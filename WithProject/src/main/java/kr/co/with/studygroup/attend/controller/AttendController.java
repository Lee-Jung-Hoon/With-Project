package kr.co.with.studygroup.attend.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.with.studygroup.attend.service.AttendService;
import kr.co.with.studygroup.attend.vo.AttendVO;
import kr.co.with.studygroup.member.vo.MemberVO;

@Controller
@RequestMapping("/attend")
public class AttendController {

	@Autowired
	private AttendService service;
	
	// 출석 메인으로 이동
	@RequestMapping("/attendMain.do")
	public ModelAndView AttendMain(int groupNo) throws Exception {
		ModelAndView mav = new ModelAndView("StudygroupAttend/attendMain");
		mav.addObject("groupNo", groupNo);
		List<MemberVO> list = service.selectMemberList(groupNo);
		mav.addObject("list", list);
		List<AttendVO> dateList = service.selectAttendDateList(groupNo);
		mav.addObject("dateList", dateList);
		return mav;
	}
	
	// 출석체크 버튼 클릭시 모든 멤버 설정
	@RequestMapping("/attendMapping.json")
	@ResponseBody
	public void AttendMapping(int groupNo) throws Exception {
		service.attendMapping(groupNo);
	}
	
	// 출석 체크!
	@RequestMapping("/attendCheck.json")
	@ResponseBody
	public String AttendCheck(int groupNo, int memberNo) throws Exception {
		Date myDate = new Date();
		String date = new SimpleDateFormat("yyyy-MM-dd").format(myDate);
		
		AttendVO attend = new AttendVO();
		attend.setRegDate(date);
		attend.setGroupNo(groupNo);
		attend.setMemberNo(memberNo);
		service.insertAttend(attend);
		return "출석 성공적";
	}
	
	@RequestMapping("/attendList.json")
	@ResponseBody
	public List<AttendVO> AttendList(int memberNo, int groupNo) throws Exception {
		AttendVO attend = new AttendVO();
		attend.setGroupNo(groupNo);
		attend.setMemberNo(memberNo);
		return service.selectAttendList(attend);
	}
}
