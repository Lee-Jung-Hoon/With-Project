package kr.co.with.studygroup.service;

import java.util.List;

import kr.co.with.studygroup.vo.StudyGroupVO;

public interface StudyGroupService {

	public List<StudyGroupVO> selectNewList(String sort) throws Exception;
}