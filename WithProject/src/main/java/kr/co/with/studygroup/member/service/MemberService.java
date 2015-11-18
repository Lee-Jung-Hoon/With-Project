package kr.co.with.studygroup.member.service;

import java.util.List;

import kr.co.with.studygroup.member.vo.MemberVO;

public interface MemberService {

	public void insertMember(MemberVO member) throws Exception;

	public MemberVO selectMember(MemberVO member) throws Exception;

	public int checkMember(MemberVO member) throws Exception;

	public List<MemberVO> groupList(String memberNo) throws Exception;
	
	public List<MemberVO> memberList(String groupNo) throws Exception;

}
