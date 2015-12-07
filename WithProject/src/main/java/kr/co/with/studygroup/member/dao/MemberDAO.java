package kr.co.with.studygroup.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.studygroup.member.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public void insertMember(MemberVO member) throws Exception{
		session.insert("member.dao.memberMapper.insertMember", member);
	}

	public MemberVO selectMember(MemberVO member) {
		return session.selectOne("member.dao.memberMapper.selectMember", member);
	}

	public int checkMember(MemberVO member) {
		return session.selectOne("member.dao.memberMapper.checkMember", member);
	}

	public List<MemberVO> groupList(String memberNo) {
		return session.selectList("member.dao.memberMapper.groupList", memberNo);
	}
	
	public List<MemberVO> memberList(String groupNo) {
		return session.selectList("member.dao.memberMapper.memberList", groupNo);
	}
	
	// Facebook 로그인시 회원등록
	public Object insertFbookMember(MemberVO member) {
		return session.insert("member.dao.memberMapper.insertFbookMember", member);
	}

	public MemberVO selectFbookMember(MemberVO member) {
		// TODO Auto-generated method stub
		return session.selectOne("member.dao.memberMapper.selectFbookMember", member);
	}

	public List<MemberVO> memberList2() {
		return session.selectList("member.dao.memberMapper.memberList2");
	}

	public int selectMemberNo(String memberName) {
		return session.selectOne("member.dao.memberMapper.selectMemberNo", memberName);
	}

	public List<MemberVO> nodeMemberList(int groupNo) {
		return session.selectList("member.dao.memberMapper.nodeMemberList", groupNo);
	}

	public int selectMobileLogin(MemberVO member) {
		return session.selectOne("member.dao.memberMapper.selectMemberNoMobile", member);
	}
}
