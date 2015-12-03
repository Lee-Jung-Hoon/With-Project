package kr.co.with.studygroup.reference.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.studygroup.reference.dao.ReferenceDAO;
import kr.co.with.studygroup.reference.vo.ReferenceVO;

@Service
public class ReferenceRoomServiceImpl implements ReferenceRoomService {

	@Autowired
	private ReferenceDAO dao;
	
	@Override
	public void insertReference(ReferenceVO reference) throws Exception {
		dao.insertReference(reference);
	}

	@Override
	public List<ReferenceVO> selectReference(Map<String, Object> listMap) throws Exception {
		return dao.selectReference(listMap);
	}
	
	@Override
	public List<ReferenceVO> selectAllReference(int groupNo) throws Exception {
		return dao.selectReference(groupNo);
	}

	@Override
	public ReferenceVO selectReferenceDetail(int referenceNo) throws Exception {
		return dao.selectReferenceDetail(referenceNo);
	}
}
