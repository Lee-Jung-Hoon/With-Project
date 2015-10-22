package kr.co.spanner.member.service;
import java.util.List;

import kr.co.spanner.member.vo.MemberVO;
import kr.co.spanner.user.reservation.vo.ReservationVO;

public interface MemberService {

	public MemberVO selectLogin(MemberVO member) throws Exception;

	public MemberVO selectMember(String id) throws Exception;
	
	public void updateMember(MemberVO member) throws Exception;

	public List<ReservationVO> selectRes(int memberNo) throws Exception;

	public void cancelRes(int resNo) throws Exception;
}
