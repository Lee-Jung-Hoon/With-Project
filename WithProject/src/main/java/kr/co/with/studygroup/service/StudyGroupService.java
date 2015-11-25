package kr.co.with.studygroup.service;

import java.util.List;

import kr.co.with.studygroup.vo.StudyGroupBookmarkVO;
import kr.co.with.studygroup.vo.StudyGroupCommentVO;
import kr.co.with.studygroup.vo.StudyGroupPagingVO;
import kr.co.with.studygroup.vo.StudyGroupTagVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

public interface StudyGroupService {

	public List<StudyGroupVO> selectNewList(StudyGroupPagingVO page) throws Exception;

	public int insertStudyGroup(StudyGroupVO studyGroup) throws Exception;

	public void insertStudygroupTag(String tagName) throws Exception;

	public StudyGroupVO selectGruopDetail(int no) throws Exception;

	public int selectOverlapBookmark(StudyGroupBookmarkVO bookmark) throws Exception;

	public void insertBookmark(StudyGroupBookmarkVO bookmark) throws Exception;

	public void insertGroupComment(StudyGroupCommentVO commentVO) throws Exception;

	public List<StudyGroupCommentVO> selectCommentList(int groupNo) throws Exception;
	
	 public List<StudyGroupVO> selectMarker() throws Exception;

	public int nameCheck(String tagName) throws Exception;

	public void updateTagCount(String tagName) throws Exception;

	public List<StudyGroupTagVO> selectTagList() throws Exception;
	
}
