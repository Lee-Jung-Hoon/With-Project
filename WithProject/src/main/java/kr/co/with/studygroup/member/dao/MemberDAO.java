package kr.co.with.studygroup.member.dao;

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
}
