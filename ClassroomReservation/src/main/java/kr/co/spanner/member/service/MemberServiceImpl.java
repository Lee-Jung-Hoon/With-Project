package kr.co.spanner.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.spanner.member.dao.MemberDAO;
import kr.co.spanner.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public MemberVO selectLogin(MemberVO member) throws Exception {
		return dao.selectLogin(member);
	}
}
