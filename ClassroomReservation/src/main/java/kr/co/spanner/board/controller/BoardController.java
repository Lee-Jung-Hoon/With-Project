package kr.co.spanner.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.spanner.board.service.BoardService;
import kr.co.spanner.board.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/list.do")
	public ModelAndView BoardList() throws Exception {
		ModelAndView mav = new ModelAndView("main");
		List<BoardVO> list = service.selectBoardList();
		mav.addObject("list", list);
		return mav;
	}
	
	
}
