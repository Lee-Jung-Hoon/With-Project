package kr.co.with.studygroup.reference.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		return "redirect:/referenceRoom/referenceList.do";
	}
	
	@RequestMapping("/referenceList.do")
	public ModelAndView referenceList(/*@RequestParam("groupNo") int groupNo */) throws Exception{
		
		ModelAndView mav = new ModelAndView("/StudyGroupReferenceRoom/referenceRoomList");
		int groupNo = 1; // groupNo 는 클라이언트에서 넘겨주는것으로 생각
		List<ReferenceVO>list = service.selectAllReference(groupNo);
		mav.addObject("list", list);
	return mav;
	}
	
	// ajax로 List를 출력하는 method (categori를 기준으로 List출력)
	@ResponseBody
	@RequestMapping("/referenceCategoriList.json")
	public List<ReferenceVO> referenceCategoriList(HttpSession session, @RequestParam("categori") String referenceCategori) throws Exception {
		int groupNo = 1; // groupNo 는 클라이언트에서 넘겨주는것으로 생각
		if(referenceCategori.equals("전체")) {
			return service.selectAllReference(groupNo);
		} else {
			Map<String, Object> listMap = new HashMap<>();
			listMap.put("referenceCategori", referenceCategori);
			listMap.put("groupNo", 1);
		return service.selectReference(listMap);
		}
	}
	
	@RequestMapping("/referenceDetail.do") 
	public ModelAndView refereceDatail(@RequestParam("referenceNo") int referenceNo) throws Exception{
		ModelAndView mav = new ModelAndView("/StudyGroupReferenceRoom/referenceDetail");
		ReferenceVO vo = service.selectReferenceDetail(referenceNo);
		mav.addObject("referenceVO", vo);
		return mav;
	}
}
