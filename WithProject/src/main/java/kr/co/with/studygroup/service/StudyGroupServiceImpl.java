package kr.co.with.studygroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.studygroup.dao.StudyGroupDAO;
import kr.co.with.studygroup.vo.StudyGroupVO;

@Service
public class StudyGroupServiceImpl implements StudyGroupService {
	
	@Autowired
	private StudyGroupDAO dao;
	
	public List<StudyGroupVO> selectNewList(String sort) throws Exception {
		return dao.selectNewList(sort);
	}

}
