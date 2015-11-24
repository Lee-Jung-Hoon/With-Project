package kr.co.with.studygroup.service;

import java.util.List;

import kr.co.with.studygroup.vo.MsgVO;

public interface MsgService {

	public void insertMsg(MsgVO msg) throws Exception;

	public List<MsgVO> selectList(String recvId) throws Exception;

	public void updateMsg(MsgVO msg)throws Exception;

	public MsgVO selectMsgInfo(int msgNo)throws Exception;
	
}
