package kr.co.with.joingroup.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.joingroup.vo.JoinGroupVO;
import kr.co.with.studygroup.member.vo.MemberVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

@Repository
public class JoinGroupDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	// 스터디그룹 가입 여부 확인
	public int SelectJoinGroup(JoinGroupVO joinGroup) {
		return session.selectOne("with.studygroupJoin.dao.SelectJoinGroup", joinGroup);
	}

	// 스터디그룹 가입 폼에 가입자 정보 출력
	public MemberVO selectMemberInfo(int memberNo) {
		return session.selectOne("with.studygroupJoin.dao.selectMemberInfo", memberNo);
	}

	// 스터디그룹 가입 폼에 출력할 그룹 정보 출력
	public StudyGroupVO selectStudygroupInfo(int groupNo) {
		return session.selectOne("with.studygroupJoin.dao.selectStudygroupInfo", groupNo);
	}

	// 스터디그룹 가입 신청
	public void insertJoinGroupInfo(JoinGroupVO join) {
		if(join.getMemberStatus().equals("회원")) {
			session.update("with.studygroupJoin.dao.upJoinGroupPerson", join);
		}
		session.insert("with.studygroupJoin.dao.insertJoinGroupInfo", join);
	}
}
