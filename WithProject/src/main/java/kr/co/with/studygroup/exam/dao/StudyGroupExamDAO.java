package kr.co.with.studygroup.exam.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.studygroup.exam.vo.StudyGroupExamVO;
import kr.co.with.studygroup.exam.vo.StudyGroupExampleItemVO;
import kr.co.with.studygroup.exam.vo.StudyGroupExampleVO;

@Repository
public class StudyGroupExamDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	// 시험 정보 및 제목을 DB에 입력
	public int insertExamInfo(StudyGroupExamVO exam) {
		session.insert("with.studygroup.exam.dao.insertExamInfo", exam);
		return session.selectOne("with.studygroup.exam.dao.selectExamNo");
	}

	// 시험 문제를 DB에 입력
	public int insertExample(StudyGroupExampleVO example) {
		session.insert("with.studygroup.exam.dao.insertExample", example);
		return session.selectOne("with.studygroup.exam.dao.selectExampleNo");
	}

	// 시험 문제 보기를 DB에 입력
	public void insertExmpleItem(StudyGroupExampleItemVO item) {
		session.insert("with.studygroup.exam.dao.insertExmpleItem", item);
	}

	public List<StudyGroupExamVO> selectExamList(int i) {
		return session.selectList("with.studygroup.exam.dao.selectExamList", i);
	}

	public List<StudyGroupExampleVO> selectExampleList(int no) {
		return session.selectList("with.studygroup.exam.dao.selectExampleList", no);
	}

	public List<StudyGroupExampleItemVO> selectExampleItemList(int exampleNo) {
		return session.selectList("with.studygroup.exam.dao.selectExampleItemList", exampleNo);
	}
}
