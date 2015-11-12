package kr.co.with.test.service;

import java.util.List;

import kr.co.with.test.vo.TestVO;

public interface TestService {

	public void registSch(TestVO test) throws Exception;

	public List<TestVO> selectList() throws Exception;

	public void updateSch(TestVO test) throws Exception;

	public void deleteSch(int no) throws Exception; 
}
