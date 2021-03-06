package kr.co.spanner.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.spanner.member.dao.MemberDAO;
import kr.co.spanner.member.vo.MemberVO;
import kr.co.spanner.user.reservation.vo.ReservationVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public MemberVO selectLogin(MemberVO member) throws Exception {
		return dao.selectLogin(member);
	}

	public MemberVO selectMember(String id) throws Exception {
		return dao.selectMember(id);
	}

	public void updateMember(MemberVO member) throws Exception {
		dao.updateMember(member);
	}

	public List<ReservationVO> selectRes(int memberNo) throws Exception {
		return dao.selectRes(memberNo);
	}

	public void cancelRes(int resNo) throws Exception {
		dao.updateRes(resNo);
	}

	public void insertMember(MemberVO member) throws Exception {
		dao.insertMember(member);
	}
}


