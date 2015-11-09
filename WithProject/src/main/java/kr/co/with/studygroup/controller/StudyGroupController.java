package kr.co.with.studygroup.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.with.studygroup.service.StudyGroupService;
import kr.co.with.studygroup.vo.StudyGroupPagingVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

@Controller
@RequestMapping("/studygroup")
public class StudyGroupController {
	
	@Autowired
	private StudyGroupService service;

	// 메인 리스트를 출력하기 위한 JSON Method
	@RequestMapping("/groupList.json")
	@ResponseBody
	public List<StudyGroupVO> GroupList(@RequestParam(value="sort",required=false, defaultValue="new") String sort,
			@RequestParam(value="startPage")int startPage, 
			@RequestParam(value="endPage")int endPage) throws Exception {
		StudyGroupPagingVO page = new StudyGroupPagingVO();
		page.setStartPage(startPage);
		page.setEndPage(endPage);
		return service.selectNewList(page);
	}
	
	// 스터디그룹 생성을 위한 Method
	@RequestMapping("/saveGroup.do")
	public ModelAndView SaveGroup(StudyGroupVO studyGroup) throws Exception {
		System.out.println(studyGroup.toString());
		ModelAndView mav = new ModelAndView("main");
		int groupNo = service.insertStudyGroup(studyGroup);
		mav.addObject("등록 완료");
		return mav;
	}
}
