package kr.co.spanner.admin.classmanage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.spanner.admin.classmanage.service.ClassManageService;
import kr.co.spanner.admin.classmanage.vo.ClassManageVO;

@Controller
@RequestMapping("/ClassManage")
public class ClassManageController {
	 
	@Autowired
	private ClassManageService service;

	// 강의실 관리 메인으로 이동
	@RequestMapping("ClassManage.do")
	public ModelAndView ClassManage(@RequestParam(required=false, defaultValue="1")int floor) throws Exception {
		ModelAndView mav = new ModelAndView("admin/classManageMain");
		mav.addObject("floor", floor);
		return mav;
	}
	
	// 강의실 생성 입력 폼으로 이동
	@RequestMapping("/classInsertForm.do")
	public ModelAndView ClassInsertForm(int floor) throws Exception {
		ModelAndView mav = new ModelAndView("admin/insertClass");
		mav.addObject("floor", floor);
		return mav;
	}
	
	// 강의실 리스트를 출력
	@RequestMapping("/classList.json")
	@ResponseBody
	public List<ClassManageVO> classList(int floor) throws Exception {
		return service.selectClassInfo(floor);
	}

	// 강의실 위치 변경시 저장
	@RequestMapping("/classSave.json")
	@ResponseBody
	public String classSave(String array) throws Exception {
		array = array.replace("px", "");
		ClassManageVO classVO = new ClassManageVO();
		classVO.setClassLeft(Integer.parseInt(array.split(",")[0]));
		classVO.setClassTop(Integer.parseInt(array.split(",")[1]));
		classVO.setClassNo(Integer.parseInt(array.split(",")[2]));
		
		service.updateClassLocation(classVO);
		return "성공";
	}
	
	// 강의실 생성
	@RequestMapping("/classReg.json")
	@ResponseBody
	public String classReg(ClassManageVO classVO) throws Exception {
		System.out.println(classVO.toString());
		service.inserClass(classVO);
		return "성공";
	}
	
	// 강의실 생성
	@RequestMapping("/classDel.json")
	@ResponseBody
	public String classDel(int classNo) throws Exception {
		service.deleteClass(classNo);
		return "성공";
	}
}
