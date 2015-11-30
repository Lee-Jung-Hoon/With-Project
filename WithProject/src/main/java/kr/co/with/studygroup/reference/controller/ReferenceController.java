package kr.co.with.studygroup.reference.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.with.studygroup.reference.service.ReferenceRoomService;
import kr.co.with.studygroup.reference.vo.ReferenceVO;

@Controller
@RequestMapping("/referenceRoom")
public class ReferenceController {
	
	@Autowired
	private ReferenceRoomService service;
	
	// 등록 폼으로 이동하는 method
	@RequestMapping("/referenceRegisteForm.do")
	public String referenceRoomForm() throws Exception {
		return "StudyGroupReferenceRoom/referenceRegiste";
	}
	
	// 자료 등록 method
	@RequestMapping("/referenceRegiste.do")
	public String referenceRegiste(ReferenceVO reference) throws Exception {

		// 현재 고정값으로 groupNo와 memberNo 고정 설정
		reference.setGroupNo(1);
		reference.setMemberNo(1);
		service.insertReference(reference);
		System.out.println(reference.toString());
		return "StudyGroupReferenceRoom/referenceRoomList";
	}
	
	/*// ajax로 List를 하는 method
	@ResponseBody
	@RequestMapping("/referenceList.json")
	public List<ReferenceVO> referenceList(@RequestParam("groupNo") int groupNumber) throws Exception {
		return service.selectReference(groupNumber);
	}*/
}
