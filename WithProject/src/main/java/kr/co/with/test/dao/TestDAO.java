package kr.co.with.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.test.vo.TestVO;

@Repository
public class TestDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public void registSch(TestVO test) {
		session.insert("with.test.dao.registSch", test);
	}

	public List<TestVO> selectList() {
		return session.selectList("with.test.dao.selectSch");
	}

	public void updateSch(TestVO test) {
		session.update("with.test.dao.updateSch",test);
	}

	public void deleteSch(int no) {
		session.delete("with.test.dao.deleteSch", no);
	}

}
