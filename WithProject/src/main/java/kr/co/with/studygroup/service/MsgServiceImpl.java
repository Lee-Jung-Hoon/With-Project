package kr.co.with.studygroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.studygroup.dao.MsgDAO;
import kr.co.with.studygroup.vo.MsgVO;



@Service
public class MsgServiceImpl implements MsgService{
	
	@Autowired
	private MsgDAO dao;

	public void insertMsg(MsgVO msg) throws Exception {
		dao.insertMsg(msg);
	}

	public List<MsgVO> selectList(String recvId) throws Exception {
		
		return dao.selectList(recvId);
		
	}

	public void updateMsg(MsgVO msg) throws Exception {
		dao.updateMsg(msg);
	}

}
