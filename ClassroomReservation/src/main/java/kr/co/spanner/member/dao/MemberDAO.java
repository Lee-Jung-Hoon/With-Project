package kr.co.spanner.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.spanner.member.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired	
	private SqlSessionTemplate session;
	
	public MemberVO selectLogin(MemberVO member) {
		return session.selectOne("member.dao.LoginCheck", member);
	}
}
