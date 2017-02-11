package com.merit.pps.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merit.pps.bbs.dao.BbsUserDao;
import com.merit.pps.bbs.vo.BbsVo;

@Service("bbsUserService")
public class BbsUserServiceImpl implements BbsUserService {

	@Autowired
	private BbsUserDao bbsUserMapper;

	@Override
	@Transactional
	public List<BbsVo> selectBbsUserList() throws Exception {
		return bbsUserMapper.selectBoardList();
	}
}
