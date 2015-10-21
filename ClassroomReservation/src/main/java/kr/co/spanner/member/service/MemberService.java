package kr.co.spanner.member.service;
import kr.co.spanner.member.vo.MemberVO;

public interface MemberService {

	public MemberVO selectLogin(MemberVO member) throws Exception;

	public MemberVO selectMember(String id) throws Exception;
	
	public void updateMember(MemberVO member) throws Exception;
}
