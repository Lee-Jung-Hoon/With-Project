package kr.co.spanner.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.spanner.member.vo.MemberVO;
import kr.co.spanner.user.reservation.vo.ReservationVO;

@Repository
public class MemberDAO {

	@Autowired	
	private SqlSessionTemplate session;
	
	public MemberVO selectLogin(MemberVO member) {
		return session.selectOne("member.dao.LoginCheck", member);
	}

	public MemberVO selectMember(String id) {
		return session.selectOne("member.dao.detailMember",id);
	}

	public void updateMember(MemberVO member) {
		session.update("member.dao.updateMember", member);
	}

	public List<ReservationVO> selectRes(int memberNo) {
		return session.selectList("reservation.dao.selectRes",memberNo);
	}

	public void updateRes(int resNo) {
		session.update("reservation.dao.cancelRes", resNo);
	}
}
