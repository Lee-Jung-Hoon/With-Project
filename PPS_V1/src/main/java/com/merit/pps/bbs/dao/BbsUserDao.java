package com.merit.pps.bbs.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.merit.pps.bbs.vo.BbsVo;

@Repository
public class BbsUserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<BbsVo> selectBoardList() {
		return sqlSession.selectList("bbs.selectBbsList");
	}
}
