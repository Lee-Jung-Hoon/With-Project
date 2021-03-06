package kr.co.with.studygroup.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.studygroup.member.dao.MemberDAO;
import kr.co.with.studygroup.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	
	public void insertMember(MemberVO member) throws Exception {
		dao.insertMember(member);
	}


	public MemberVO selectMember(MemberVO member) throws Exception {
		return dao.selectMember(member);
	}


	public int checkMember(MemberVO member) throws Exception {
		return dao.checkMember(member);
	}


	public List<MemberVO> groupList(String memberNo) throws Exception {
		return dao.groupList(memberNo);
	}
	
	public List<MemberVO> memberList(String groupNo) throws Exception {
		return dao.memberList(groupNo);
	}

	// Facebook 로그인시 member등록 
	public void insertFbookMember(MemberVO member) throws Exception {
		dao.insertFbookMember(member);
	}

	// Facebook 로그인시 회원정보 불러오기
	public MemberVO selectFbookMember(MemberVO member) {
		return dao.selectFbookMember(member);
	}

	public int selectMemberNo(String memberName) throws Exception {
		return dao.selectMemberNo(memberName);
	}

	@Override
	public List<MemberVO> nodeMemberList(int groupNo) throws Exception {
		return dao.nodeMemberList(groupNo);
	}

	@Override
	public int selectMobileLogin(MemberVO member) throws Exception {
		return dao.selectMobileLogin(member);
	}


	@Override
	public String selectGroupMember(int groupNo) throws Exception {
		return dao.selectGroupMember(groupNo);
	}
}
