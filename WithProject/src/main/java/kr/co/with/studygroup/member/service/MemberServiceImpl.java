package kr.co.with.studygroup.member.service;

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
}
