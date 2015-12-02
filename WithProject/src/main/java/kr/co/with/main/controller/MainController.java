package kr.co.with.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/main")
public class MainController {
	
	// 메인으로 이동
	@RequestMapping("/main.do")
	public String Main() throws Exception {
		return "main";
	}
	
	// 테스트
	// 다중마커 맵 테스트
	@RequestMapping("/map.do")
	public String Map() throws Exception {
		return "map";
	}

	// 테스트
	// 맵 등록 테스트
	@RequestMapping("/mapTest.do")
	public String createStudy() throws Exception {
		return "mapTest";
	}

	// 테스트
	// 페이스북 연동 로그인 테스트
	@RequestMapping("/login.do")
	public String login() throws Exception {
		return "login";
	}
	
	// 테스트
	// D3.js 테스트
	@RequestMapping("/d3jsTest.do")
	public String d3jsTest() throws Exception {
		return "d3jsTest";
	}
	
	// 테스트
	// WebRTC 테스트
	@RequestMapping("/WebRTC.do")
	public String WebRTC() throws Exception {
		return "WebRTC";
	}
	
	@RequestMapping("/createExamForm.do")
	public String CreateExamForm() throws Exception {
		return "StudygroupExam/createExamForm";
	}
	
	// 스터디 그룹 개설
	@RequestMapping("/createGroup.do")
	public String CreateGroup() throws Exception {
		return "createGroup";
	}
	
	
	   // 테스트
	   // 자료실 테스트
	   @RequestMapping("/referenceRoomMain.do")
	   public String referenceRoom() throws Exception {
	      return "StudyGroupReferenceRoom/referenceRoomList";
	   }
	   
	   // 테스트
	   // 자료실등록 테스트
	   @RequestMapping("/referenceRegisteForm.do")
	   public String referenceRegiesteForm() throws Exception {
	      return "StudyGroupReferenceRoom/referenceRegiste";
	   }
	   
	
	// 테스트
	// 가계부 테스트
	@RequestMapping("/moneybookMain.do")
	public String MoneybookMain() throws Exception {
		return "StudyGroupMoneyBook/moneybookMain";
	}
	
}
