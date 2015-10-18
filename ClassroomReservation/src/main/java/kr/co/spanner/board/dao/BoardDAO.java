package kr.co.spanner.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.spanner.board.vo.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<BoardVO> selectBoardList() {
		return sqlSession.selectList("board.dao.selectBoardList");
	}
}
