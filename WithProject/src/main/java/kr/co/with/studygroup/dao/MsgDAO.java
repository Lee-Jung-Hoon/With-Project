package kr.co.with.studygroup.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.studygroup.vo.MsgVO;

@Repository
public class MsgDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	public void insertMsg(MsgVO msg) {
		session.insert("with.msg.dao.insertMsg", msg);
	}

	public List<MsgVO> selectList(String recvId) {
		return session.selectList("with.msg.dao.selectList", recvId);
	}

	public void updateMsg(MsgVO msg) {
		session.update("with.msg.dao.updateMsg", msg);
	}

	public MsgVO selectMsgInfo(int msgNo) {
		return session.selectOne("with.msg.dao.selectMsgInfo", msgNo);
	}

}
