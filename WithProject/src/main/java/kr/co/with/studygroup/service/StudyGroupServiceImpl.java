package kr.co.with.studygroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.studygroup.dao.StudyGroupDAO;
import kr.co.with.studygroup.vo.StudyGroupPagingVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

@Service
public class StudyGroupServiceImpl implements StudyGroupService {
	
	@Autowired
	private StudyGroupDAO dao;

	// 메인 리스트를 출력하기 위한 Service
	public List<StudyGroupVO> selectNewList(StudyGroupPagingVO page) throws Exception {
		return dao.selectNewList(page);
	}
}
