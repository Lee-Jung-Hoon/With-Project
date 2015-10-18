package kr.co.spanner.board.service;

import java.util.List;

import kr.co.spanner.board.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> selectBoardList() throws Exception;

}
