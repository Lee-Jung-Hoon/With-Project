package kr.co.with.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	
	// 테스트
	// 메인 테스트
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
	
	@RequestMapping("/d3jsTest.do")
	public String d3jsTest() throws Exception {
		return "d3jsTest";
	}
	
	@RequestMapping("/WebRTC.do")
	public String WebRTC() throws Exception {
		return "WebRTC";
	}
}