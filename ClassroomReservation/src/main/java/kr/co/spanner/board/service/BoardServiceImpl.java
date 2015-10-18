package kr.co.spanner.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.spanner.board.dao.BoardDAO;
import kr.co.spanner.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	public List<BoardVO> selectBoardList() throws Exception {
		return dao.selectBoardList();
	}

}
