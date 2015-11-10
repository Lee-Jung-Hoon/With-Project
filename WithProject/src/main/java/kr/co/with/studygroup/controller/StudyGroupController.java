package kr.co.with.studygroup.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.with.studygroup.service.StudyGroupService;
import kr.co.with.studygroup.vo.StudyGroupPagingVO;
import kr.co.with.studygroup.vo.StudyGroupTagVO;
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
	public ModelAndView SaveGroup(StudyGroupVO studyGroup, String tag, @RequestParam("image") MultipartFile image) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/main/main.do");
		// UUID를 통해 파일명의 중복을 방지
		String fileName = UUID.randomUUID().toString()+".jpg";
		// 파일 업로드 위치를 지정
		String uploadPath = "C:\\java73\\web-workspace\\WithProject\\src\\main\\webapp\\images";
        System.out.println("UPLOAD_PATH : "+uploadPath);

        // 파일을 업로드 폴더에 업로드
        FileCopyUtils.copy(image.getInputStream(), new FileOutputStream(uploadPath+"/"+fileName));
        
        // 업로드한 파일명을 DB에 저장하기 위한 구문
        studyGroup.setGroupRepImagePath(fileName);

        // 그룹 정보를 DB에 저장한 후 태그 저장을 위해 auto_increment 값을 가지고옴
        int groupNo = service.insertStudyGroup(studyGroup);
        
        // 한 줄로 입력 받은 태그를 따로따로 구분함
        String tags[] = tag.split(",");
		StudyGroupTagVO tagVO = new StudyGroupTagVO();
		tagVO.setGroupNo(groupNo);
		for(int i=0; i<tags.length; i++) {
			tagVO.setTagName(tags[i]);
			// 태그를 DB에 저장
			service.insertStudygroupTag(tagVO);
		}
		return mav;
	}
}
