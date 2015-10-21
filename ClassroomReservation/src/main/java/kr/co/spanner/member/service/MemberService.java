package kr.co.spanner.member.service;
import kr.co.spanner.member.vo.MemberVO;

public interface MemberService {

	public MemberVO selectLogin(MemberVO member) throws Exception;
}
