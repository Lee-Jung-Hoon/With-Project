package kr.co.with.studygroup.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.studygroup.exam.dao.StudyGroupExamDAO;
import kr.co.with.studygroup.exam.vo.StudyGroupExamResultVO;
import kr.co.with.studygroup.exam.vo.StudyGroupExamVO;
import kr.co.with.studygroup.exam.vo.StudyGroupExampleItemVO;
import kr.co.with.studygroup.exam.vo.StudyGroupExampleVO;

@Service
public class StudyGroupExamServiceImpl implements StudyGroupExamService {

	@Autowired
	private StudyGroupExamDAO dao;
	
	// 시험 제목 및 정보 DB 입력
	public int insertExamInfo(StudyGroupExamVO exam) throws Exception {
		return dao.insertExamInfo(exam);
	}

	// 시험 문제 등록
	public int insertExample(StudyGroupExampleVO example) throws Exception {
		return dao.insertExample(example);
	}

	// 시험 문제 보기 등록
	public void insertExmpleItem(StudyGroupExampleItemVO item) throws Exception {
		dao.insertExmpleItem(item);
	}

	// 시험 정보 출력
	public List<StudyGroupExamVO> selectExamList(int i) throws Exception {
		return dao.selectExamList(i);
	}

	// 시험 문제 출력
	public List<StudyGroupExampleVO> selectExampleList(int no) throws Exception {
		return dao.selectExampleList(no);
	}

	public List<StudyGroupExampleItemVO> selectExampleItemList(int exampleNo) throws Exception {
		return dao.selectExampleItemList(exampleNo);
	}

	public void insertExamResult(StudyGroupExamResultVO result) throws Exception {
		dao.inserExamResult(result);
	}

}
