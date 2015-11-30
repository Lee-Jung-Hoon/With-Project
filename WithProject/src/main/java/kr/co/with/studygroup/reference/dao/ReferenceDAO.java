package kr.co.with.studygroup.reference.dao;

import java.util.List;

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

	/*public List<ReferenceVO> selectReference(int groupNumber) {
		return session.selectList("reference.dao.referenceMapper.selectReference", groupNumber);
	}*/

}
