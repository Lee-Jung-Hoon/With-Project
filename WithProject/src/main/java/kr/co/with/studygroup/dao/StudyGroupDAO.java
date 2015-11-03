package kr.co.with.studygroup.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.studygroup.vo.StudyGroupVO;

@Repository
public class StudyGroupDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public List<StudyGroupVO> selectNewList(String sort) {
		return session.selectList("with.studygroup.dao.studyList", sort);
	}

}
