package kr.co.spanner.admin.classmanage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.spanner.admin.classmanage.vo.ClassManageVO;
@Repository
public class ClassManageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 층수별 강의실 정보 출력
	public List<ClassManageVO> selectClassInfo(int floor) {
		return sqlSession.selectList("admin.classmanage.dao.selectClassInfo", floor);
	}

	// 강의실의 위치를 옮길 경우 위치 수정
	public void updateClassLocation(ClassManageVO classVO) {
		sqlSession.update("admin.classmanage.dao.updateClassLocation", classVO);
	}

	// 강의실 생성
	public void insertClass(ClassManageVO classVO) {
		sqlSession.insert("admin.classmanage.dao.insertClass", classVO);
	}

	// 강의실 삭제
	public void deleteClass(int classNo) {
		sqlSession.delete("admin.classmanage.dao.deleteClass", classNo);
	}
	
}
