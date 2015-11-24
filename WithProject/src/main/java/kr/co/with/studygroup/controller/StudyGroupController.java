package kr.co.with.studygroup.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.with.studygroup.service.StudyGroupService;
import kr.co.with.studygroup.vo.StudyGroupBookmarkVO;
import kr.co.with.studygroup.vo.StudyGroupCommentVO;
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
	public List<StudyGroupVO> GroupList(
			@RequestParam(value = "sort", required = false, defaultValue = "new") String sort,
			@RequestParam(value = "startPage") int startPage, @RequestParam(value = "endPage") int endPage,
			@RequestParam(value="search", required=false, defaultValue="") String search)
					throws Exception {
		StudyGroupPagingVO page = new StudyGroupPagingVO();
		page.setSearch(search);
		page.setStartPage(startPage);
		page.setEndPage(endPage);
		return service.selectNewList(page);
	}

	// 스터디그룹 생성을 위한 Method
	@RequestMapping("/saveGroup.do")
	public ModelAndView SaveGroup(StudyGroupVO studyGroup, String tag,
			@RequestParam("image") MultipartFile image,
			HttpServletRequest req
//			@RequestParam("photo") ArrayList<MultipartFile> files
			) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/main/main.do");
		Calendar cal = Calendar.getInstance(); // 날짜 객체를 불러옴
		String yStr = "" + (cal.get(Calendar.YEAR)); // 년도
		String mStr = "" + (cal.get(Calendar.MONTH) + 1); // 월
		String dStr = "" + (cal.get(Calendar.DAY_OF_MONTH)); // 일
//		String uploadPath = req.getServletContext().getRealPath("/image") + "/" + yStr + "/" + mStr + "/" + dStr;

		String uploadPath = "C:\\java73\\tomcat-work\\wtpwebapps\\WithProject\\images";
		
		File dir = new File(uploadPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		// UUID를 통해 파일명의 중복을 방지
		String fileName = UUID.randomUUID().toString() + ".jpg";
		// 파일 업로드 위치를 지정

		// 파일을 업로드 폴더에 업로드
		FileCopyUtils.copy(image.getInputStream(), new FileOutputStream(uploadPath + "/" + fileName));

		// 업로드한 파일명을 DB에 저장하기 위한 구문
		studyGroup.setGroupRepImagePath(fileName);

		// 그룹 정보를 DB에 저장한 후 태그 저장을 위해 auto_increment 값을 가지고옴
		int groupNo = service.insertStudyGroup(studyGroup);
		
		// 다중 파일 저장
//		for(int i=0; i<files.size(); i++) {
//			String fName = UUID.randomUUID().toString() + ".jpg";
//			MultipartFile file = files.get(i);
//			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(uploadPath + "/" + fName));
//		}
		
		// 한 줄로 입력 받은 태그를 따로따로 구분함
//		String tags[] = tag.split(",");
//		StudyGroupTagVO tagVO = new StudyGroupTagVO();
//		tagVO.setGroupNo(groupNo);
//		for (int i = 0; i < tags.length; i++) {
//			tagVO.setTagName(tags[i]);
			// 태그를 DB에 저장
//			service.insertStudygroupTag(tagVO);
//		}
		return mav;
	}

	// 그룹 상세 정보 출력을 위한 JSON
	@RequestMapping("/groupDetail.json")
	@ResponseBody
	public StudyGroupVO GroupDetail(int groupNo) throws Exception {
		return service.selectGruopDetail(groupNo);
	}
	
	// 그룹 상세 정보 내 댓글 작성을 위한 JSON
	@RequestMapping("/regComment.json")
	@ResponseBody
	public void RegComment(int no, String comment, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		
		// 멤버 번호 받을 예정
		int memberNo = (Integer) session.getAttribute("no");
		
		
		StudyGroupCommentVO commentVO = new StudyGroupCommentVO();
		commentVO.setCommentContent(comment);
		commentVO.setGroupNo(no);
		commentVO.setMemberNo(memberNo);
		service.insertGroupComment(commentVO);
	}
	
	// 그룹 상세 댓글 리스트 출력을 위한 JSON
	@RequestMapping("/commentList.json")
	@ResponseBody
	public List<StudyGroupCommentVO> CommentList(int groupNo) throws Exception {
		return service.selectCommentList(groupNo);
	}

	// 그룹 즐겨찾기 등록을 위한 JSON
	@RequestMapping("/groupBookmark.json")
	@ResponseBody
	public String GroupBookmark(int groupNo) throws Exception {
		int memberNo = 1;
		String msg = "";

		StudyGroupBookmarkVO bookmark = new StudyGroupBookmarkVO();
		bookmark.setGroupNo(groupNo);
		bookmark.setMemberNo(memberNo);
		// 즐겨찾기 중복 확인
		// bookmark = service.selectOverlapBookmark(bookmark);

		// if(overlapNo==0) {
		// bookmark.setGroupNo(groupNo);
		// bookmark.setMemberNo(memberNo);
		service.insertBookmark(bookmark);
		msg = "등록 성공";
		// }
		// else {
		// msg = "이미 즐겨찾기에 등록된 스터디그룹입니다.";
		// }
		return msg;
	}
	
	// 자기자신 반경안 스터디그룹 Map과 Marker생성 Method
	   @RequestMapping("/mapList.json")
	   @ResponseBody
	   public List<StudyGroupVO> markerList() throws Exception {
	      return service.selectMarker();
	   }
}
