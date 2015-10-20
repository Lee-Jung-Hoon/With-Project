package kr.co.spanner.admin.classmanage.service;

import java.util.List;

import kr.co.spanner.admin.classmanage.vo.ClassManageVO;

public interface ClassManageService {
	// 층수별 강의실 정보 출력
	public List<ClassManageVO> selectClassInfo(int floor) throws Exception;

	// 강의실의 위치를 옮길 경우 위치 수정
	public void updateClassLocation(ClassManageVO classVO) throws Exception;

	// 강의실 생성
	public void inserClass(ClassManageVO classVO) throws Exception;

	// 강의실 삭제
	public void deleteClass(int classNo) throws Exception;
}
