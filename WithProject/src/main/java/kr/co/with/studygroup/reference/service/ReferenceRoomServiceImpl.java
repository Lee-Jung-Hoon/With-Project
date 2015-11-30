package kr.co.with.studygroup.reference.service;

import java.util.List;

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

/*	@Override
	public List<ReferenceVO> selectReference(int groupNumber) throws Exception {
		return dao.selectReference(groupNumber);
	}*/
	
}
