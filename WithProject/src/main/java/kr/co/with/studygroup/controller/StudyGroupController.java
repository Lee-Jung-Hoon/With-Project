package kr.co.with.studygroup.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.with.joingroup.vo.JoinGroupVO;
import kr.co.with.studygroup.member.vo.MemberVO;
import kr.co.with.studygroup.moneybook.vo.MoneyBookVO;
import kr.co.with.studygroup.service.StudyGroupService;
import kr.co.with.studygroup.vo.StudyGroupBookmarkVO;
import kr.co.with.studygroup.vo.StudyGroupCommentVO;
import kr.co.with.studygroup.vo.StudyGroupPagingVO;
import kr.co.with.studygroup.vo.StudyGroupTagVO;
import kr.co.with.studygroup.vo.StudyGroupVO;
import kr.co.with.studygroup.vo.StudygroupWorkInfoVO;
import kr.co.with.util.WithUtil;

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
		
		HttpSession session = req.getSession();
		studyGroup.setMemberNo((int)session.getAttribute("no"));

		// 그룹 정보를 DB에 저장한 후 태그 저장을 위해 auto_increment 값을 가지고옴
		studyGroup.setGroupTag(tag);
		service.insertStudyGroup(studyGroup);
		
		// 다중 파일 저장
//		for(int i=0; i<files.size(); i++) {
//			String fName = UUID.randomUUID().toString() + ".jpg";
//			MultipartFile file = files.get(i);
//			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(uploadPath + "/" + fName));
//		}
		
		// 한 줄로 입력 받은 태그를 따로따로 구분함
		String tags[] = tag.split(",");
		StudyGroupTagVO tagVO = new StudyGroupTagVO();
		
		for (int i = 0; i < tags.length; i++) {
			tagVO.setTagName(tags[i]);
			// 태그를 DB에 저장
			String tagName = tags[i];
			int cnt = service.nameCheck(tagName);
			if(cnt != 0){
				service.updateTagCount(tagName);
			}else{
			service.insertStudygroupTag(tagName);
			}
		}
		
		service.insertJoinGroupInfo(studyGroup);
		return mav;
	}

	//메인 태그 클라우드 출력을 위한 JSON
	@RequestMapping("/tagList.json")
	@ResponseBody
	public List<StudyGroupTagVO> tagList() throws Exception {
		List<StudyGroupTagVO> list = service.selectTagList();
		Collections.shuffle(list);
		return list;
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
	public String GroupBookmark(@RequestParam("groupNo") int groupNo, HttpServletRequest req) throws Exception {
	   String msg = "";
	   HttpSession session = req.getSession();
	   System.out.println("스터디그룹 번호"+groupNo);
	   System.out.println("회원 번호"+session.getAttribute("no"));
	   StudyGroupBookmarkVO bookmark = new StudyGroupBookmarkVO();
	   bookmark.setGroupNo(groupNo);
	   bookmark.setMemberNo((Integer)session.getAttribute("no"));
	   int count = service.selectOverlapBookmark(bookmark);
	   if(count == 0) {
	      service.insertBookmark(bookmark);
	      msg = "등록 성공";
	   } else {
	      msg = "이미 즐겨찾기에 등록된 스터디그룹입니다.";
	   }
	   return msg;
	}
	
	// 자기자신 반경안 스터디그룹 Map과 Marker생성 Method
	@RequestMapping("/mapList.json")
	@ResponseBody
	public List<StudyGroupVO> markerList() throws Exception {
		return service.selectMarker();
	}	

	// 스터디그룹 즐겨찾기 리스트 출력을 위한 json
	@RequestMapping("/groupBookmarkList.json")
	@ResponseBody
	public List<StudyGroupVO> GroupBookmarkList(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		int memberNo = (int) session.getAttribute("no");
		return service.selectGroupBookmarkList(memberNo);
	}
	
	// 마이 스터디내 본인이 개설한 스터디그룹 리스트를 출력하기 위한 json
	@RequestMapping("/myCreateGroup.json")
	@ResponseBody
	public List<StudyGroupVO> MyCreateGroup(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		int memberNo = (int) session.getAttribute("no");
		return service.selectMyCreateGroup(memberNo);
	}
	
	// 마이 스터디내 본인이 가입한 스터디그룹 리스트를 출력하기 위한 json
	@RequestMapping("/myJoinGroup.json")
	@ResponseBody
	public List<StudyGroupVO> MyJoinGroup(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		int memberNo = (int) session.getAttribute("no");
//		System.out.println(memberNo);
		return service.selectMyJoinGroup(memberNo);
	}
	
	@RequestMapping("/myWatingGroupList.json")
	@ResponseBody
	public List<StudyGroupVO> MyWatingGroupList(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		int memberNo = (int) session.getAttribute("no");
//		System.out.println(memberNo);
		return service.selectMyWatingGroupList(memberNo);
	}
	
	// 스터디그룹 메인으로 이동
	@RequestMapping("/StudygroupMain.do")
	public ModelAndView StudygroupMain(int groupNo, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView("StudygroupMain/StudygroupMain");
		mav.addObject("groupNo", groupNo);
		// 스터디그룹 상세 정보 출력
		StudyGroupVO studyGroup = service.SelectStudygroupMain(groupNo);
		mav.addObject("studyGroup", studyGroup);
		
		// 스터디그룹 멤버 정보 출력
		List<MemberVO> member = service.SelectStudygroupMemeber(groupNo);
		mav.addObject("member", member);
		
		int totalMoney = 0;
		// 스터디그룹 가계부 관련 정보 출력
		List<MoneyBookVO> moneybook = service.SelectStudyGroupMoneyBook(groupNo);
		for(int i=0; i<moneybook.size(); i++) {
			if(moneybook.get(i).getmType() == 1){
				totalMoney -= moneybook.get(i).getmMoney();
			}
			else if(moneybook.get(i).getmType() == 2){
				totalMoney += moneybook.get(i).getmMoney();
			}
		}
		mav.addObject("money", totalMoney);
		
		
		List<StudygroupWorkInfoVO> list = new ArrayList<>();
			String calUrl = "http://api.saramin.co.kr/job-search?keywords="+studyGroup.getGroupTag().split(",")[0]+"&sort=pd&loc_cd=101000&count=10&output=xml";
			URL url = new URL(calUrl);
			InputStream in = url.openStream();

			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(in);

			NodeList workInfoList = doc.getElementsByTagName("job");
			int childLen = workInfoList.getLength();

			for (int index = 0; index < childLen; index++) {
			StudygroupWorkInfoVO workInfo = new StudygroupWorkInfoVO();

			Node node = workInfoList.item(index);
			NodeList childList = node.getChildNodes();

			for (int j = 0; j < childList.getLength(); j++) {

				Node cNode = childList.item(j);
				String cName = cNode.getNodeName();
				String cValue = cNode.getTextContent();
				WithUtil util = new WithUtil();
				if ("#text".equals(cName))
					continue;

				if ("id".equals(cName)) {
					workInfo.setId(cValue);
				} else if ("url".equals(cName)) {
					workInfo.setUrl(cValue);
				} else if ("active".equals(cName)) {
					workInfo.setActive(cValue);
				} else if ("posting-timestamp".equals(cName)) {
					workInfo.setPostingTimeStamp(util.timeStamp(cValue));
				} else if ("opening-timestamp".equals(cName)) {
					workInfo.setOpeningTimeStamp(util.timeStamp(cValue));
				} else if ("expiration-timestamp".equals(cName)) {
					workInfo.setExpirationTimeStamp(util.timeStamp(cValue));
				} else if ("company".equals(cName)) {
					NodeList workInfoSecList = cNode.getChildNodes();

					for (int secIndex = 0; secIndex < workInfoSecList.getLength(); secIndex++) {
						Node comNode = workInfoSecList.item(secIndex);
						String comName = comNode.getNodeName();
						String comValue = comNode.getTextContent();
						if ("name".equals(comName)) {
							workInfo.setCompany(comValue);
						}
					}
					
				} else if ("position".equals(cName)) {
					NodeList workInfoThirdList = cNode.getChildNodes();
					for (int thirdIndex = 0; thirdIndex < workInfoThirdList.getLength(); thirdIndex++) {
						Node sNode = workInfoThirdList.item(thirdIndex);
						String sName = sNode.getNodeName();
						String sValue = sNode.getTextContent();
						if ("title".equals(sName)) {
							workInfo.setTitle(sValue);
						} else if ("job-type".equals(sName)) {
							workInfo.setJobType(sValue);
						} else if ("job-category".equals(sName)) {
							workInfo.setJobCategory(sValue);
						} else if ("open-quantity".equals(sName)) {
							workInfo.setOpenQuantity(sValue);
						} else if ("experience-level".equals(sName)) {
							workInfo.setExperienceLevel(sValue);
						}
					}
				} else if ("salary".equals(cName)) {
					workInfo.setSalary(cValue);
				}
			}
			list.add(workInfo);
		}
		mav.addObject("workInfo", list);
		return mav;
	}
	
	// 스터디그룹 관리자 페이지로 이동
	@RequestMapping("/StudygroupAdminMain.do")
	public ModelAndView StudygroupAdminMain(int groupNo) throws Exception {
		ModelAndView mav = new ModelAndView("StudygroupAdminMain/StudygroupAdminMain");
		mav.addObject("groupNo", groupNo);
		List<JoinGroupVO> member = service.selectJoinWatingMember(groupNo);
		mav.addObject("member", member);
		mav.addObject("memberLength", member.size());
		return mav;
	}
//	
	// 스터디그룹 대쉬 그래프를 위한 메소드
	@RequestMapping("/groupMemberList.json")
	@ResponseBody
	public List<MemberVO> groupMemberList(int groupNo) throws Exception {
		return service.GroupMemberList(groupNo);
	}
}
