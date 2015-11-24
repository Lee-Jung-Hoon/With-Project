package kr.co.with.studygroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.studygroup.dao.StudyGroupDAO;
import kr.co.with.studygroup.vo.StudyGroupBookmarkVO;
import kr.co.with.studygroup.vo.StudyGroupCommentVO;
import kr.co.with.studygroup.vo.StudyGroupPagingVO;
import kr.co.with.studygroup.vo.StudyGroupTagVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

@Service
public class StudyGroupServiceImpl implements StudyGroupService {
	
	@Autowired
	private StudyGroupDAO dao;

	// 메인 리스트를 출력하기 위한 Service
	public List<StudyGroupVO> selectNewList(StudyGroupPagingVO page) throws Exception {
		return dao.selectNewList(page);
	}

	// 스터디그룹 생성을 위한 service
	public int insertStudyGroup(StudyGroupVO studyGroup) throws Exception {
		return dao.insertStudyGroup(studyGroup);
	}

	// 스터디그룹 태그 생성을 위한 service
	public void insertStudygroupTag(StudyGroupTagVO tagVO) throws Exception {
		dao.insertStudygroupTag(tagVO);
	}

	// 스터디그룹 상세 정보 출력을 위한 service
	public StudyGroupVO selectGruopDetail(int no) throws Exception {
		return dao.selectGruopDetail(no);
	}

	// 스터디그룹 즐겨찾기 중복을 확인하기 위한 service
	public StudyGroupBookmarkVO selectOverlapBookmark(StudyGroupBookmarkVO bookmark) throws Exception {
		return dao.selectOverlapBookmark(bookmark);
	}

	// 스터디그룹 즐겨찾기 등록을 위한 service
	public void insertBookmark(StudyGroupBookmarkVO bookmark) throws Exception {
		dao.insertBookmark(bookmark);
	}

	// 스터디그룹 상세보기 댓글 등록을 위한 service
	public void insertGroupComment(StudyGroupCommentVO commentVO) throws Exception {
		dao.insertGroupComment(commentVO);
	}

	// 스터디그룹 상세 댓글 리스트 출력을 위한 service
	public List<StudyGroupCommentVO> selectCommentList(int groupNo) throws Exception {
		return dao.selectCommentList(groupNo);
	}
	
	public List<StudyGroupVO> selectMarker() throws Exception {
	      return dao.selectMaker();
	}
}
