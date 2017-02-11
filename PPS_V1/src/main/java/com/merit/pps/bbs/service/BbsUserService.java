package com.merit.pps.bbs.service;

import java.util.List;

import com.merit.pps.bbs.vo.BbsVo;

public interface BbsUserService {
	List<BbsVo> selectBbsUserList() throws Exception;
}
