package kr.co.with.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.test.dao.TestDAO;
import kr.co.with.test.vo.TestVO;

@Service
public class TestServiceImpl implements TestService {
	
	@Autowired
	private TestDAO dao;
	
	public void registSch(TestVO test) throws Exception {
		dao.registSch(test);
	}

	public List<TestVO> selectList() throws Exception {
		return dao.selectList();
	}

	public void updateSch(int no) throws Exception {
		dao.updateSch(no);
	}

	public void deleteSch(int no) throws Exception {
		dao.deleteSch(no);
	}
}
