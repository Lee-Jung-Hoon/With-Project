package kr.co.with.studygroup.reference.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.studygroup.reference.vo.ReferenceVO;

@Repository
public class ReferenceDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public void insertReference(ReferenceVO reference) {
		session.insert("reference.dao.referenceMapper.insertReference", reference);
	}

	public List<ReferenceVO> selectReference(Map<String, Object> listMap) {
		return session.selectList("reference.dao.referenceMapper.selectReference", listMap);
	}

	public List<ReferenceVO> selectReference(int groupNo) {
		return session.selectList("reference.dao.referenceMapper.selectAllReference", groupNo);
	}

	public ReferenceVO selectReferenceDetail(int referenceNo) {
		return session.selectOne("reference.dao.referenceMapper.selectRefereneceDetail", referenceNo);
	}

}
