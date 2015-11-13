package kr.co.with.studygroup.service;

import java.util.List;

import kr.co.with.studygroup.vo.StudyGroupPagingVO;
import kr.co.with.studygroup.vo.StudyGroupTagVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

public interface StudyGroupService {

	public List<StudyGroupVO> selectNewList(StudyGroupPagingVO page) throws Exception;

	public int insertStudyGroup(StudyGroupVO studyGroup) throws Exception;

	public void insertStudygroupTag(StudyGroupTagVO tagVO) throws Exception;

	public StudyGroupVO selectGruopDetail(int no) throws Exception;
}
