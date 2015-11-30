package kr.co.with.studygroup.reference.service;

import java.util.List;

import kr.co.with.studygroup.reference.vo.ReferenceVO;

public interface ReferenceRoomService {

	// 자료 등록 부분
	public void insertReference(ReferenceVO reference) throws Exception;

	// ajax로 출력하기위한 List 출력부분
	//public List<ReferenceVO> selectReference(int groupNumber) throws Exception;

}
