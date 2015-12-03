package kr.co.with.studygroup.reference.service;

import java.util.List;
import java.util.Map;

import kr.co.with.studygroup.reference.vo.ReferenceVO;

public interface ReferenceRoomService {

	// 자료 등록 부분
	public void insertReference(ReferenceVO reference) throws Exception;

	// ajax로 출력하기위한 List 출력부분
	public List<ReferenceVO> selectReference(Map<String, Object> listMap) throws Exception;

	public List<ReferenceVO> selectAllReference(int groupNo) throws Exception;

	public ReferenceVO selectReferenceDetail(int referenceNo) throws Exception;

}
