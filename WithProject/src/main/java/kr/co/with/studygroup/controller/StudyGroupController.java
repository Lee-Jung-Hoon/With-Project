package kr.co.with.studygroup.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.with.studygroup.service.StudyGroupService;
import kr.co.with.studygroup.vo.StudyGroupVO;

@Controller
@RequestMapping("/studygroup")
public class StudyGroupController {
	
	@Autowired
	private StudyGroupService service;
	
	@RequestMapping("/groupList.json")
	@ResponseBody
	public List<StudyGroupVO> GroupList(@RequestParam(value="sort",required=false, defaultValue="new") String sort) throws Exception {
		return service.selectNewList(sort);
	}
}