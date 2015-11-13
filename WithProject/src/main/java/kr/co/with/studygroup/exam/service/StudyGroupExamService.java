package kr.co.with.studygroup.exam.service;

import java.util.List;

import kr.co.with.studygroup.exam.vo.StudyGroupExamVO;
import kr.co.with.studygroup.exam.vo.StudyGroupExampleItemVO;
import kr.co.with.studygroup.exam.vo.StudyGroupExampleVO;

public interface StudyGroupExamService {

	public int insertExamInfo(StudyGroupExamVO exam) throws Exception;

	public int insertExample(StudyGroupExampleVO example) throws Exception;

	public void insertExmpleItem(StudyGroupExampleItemVO item) throws Exception;

	public List<StudyGroupExamVO> selectExamList(int i) throws Exception;

	public List<StudyGroupExampleVO> selectExampleList(int no) throws Exception;

	public List<StudyGroupExampleItemVO> selectExampleItemList(int exampleNo) throws Exception;

}
