package kr.co.with.studygroup.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.studygroup.vo.StudyGroupPagingVO;
import kr.co.with.studygroup.vo.StudyGroupTagVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

@Repository
public class StudyGroupDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	// 메인 리스트를 출력하기 위한 DAO
	public List<StudyGroupVO> selectNewList(StudyGroupPagingVO page) {
		return session.selectList("with.studygroup.dao.studyList", page);
	}

	// 스터디 그룹 생성을 위한 DAO
	public int insertStudyGroup(StudyGroupVO studyGroup) {
		session.insert("with.studygroup.dao.insertStudyGroup", studyGroup);
		return session.selectOne("with.studygroup.dao.selectAutoIncrement");
	}

	// 스터디 그룹 태그 생성을 위한 DAO
	public void insertStudygroupTag(StudyGroupTagVO tagVO) {
		String StudyName = session.selectOne("with.studygroup.dao.studyName", tagVO.getGroupNo());
		tagVO.setGroupName(StudyName);
		session.insert("with.studygroup.dao.insertStudyGroupTag", tagVO);
	}
}
