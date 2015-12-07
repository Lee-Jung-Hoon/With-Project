package kr.co.with.studygroup.attend.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.studygroup.attend.vo.AttendVO;
import kr.co.with.studygroup.member.vo.MemberVO;

@Repository
public class AttendDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	// 출석 체크
	public void insertAttend(AttendVO attend) {
		session.insert("with.studygroupAttend.dao.insertAttend", attend);
	}

	public List<MemberVO> selectMemberList(int groupNo) {
		return session.selectList("with.studygroupAttend.dao.selectMemberList", groupNo);
	}

	public List<AttendVO> selectAttendList(AttendVO attend) {
		return session.selectList("with.studygroupAttend.dao.selectAttendList", attend);
	}

}
