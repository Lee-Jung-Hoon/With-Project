package kr.co.spanner.user.reservation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.spanner.user.reservation.vo.ReservationVO;

@Repository
public class ReservationDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	public void insertRes(ReservationVO reservation) {
		session.insert("reservation.dao.insertRes", reservation);
	}

	public List<ReservationVO> selectResertion(ReservationVO resv) {
		return session.selectList("reservation.dao.selectReservation", resv);
	}

	public List<ReservationVO> reservationCheck(ReservationVO reservation) {
		return session.selectList("reservation.dao.reservationCheck", reservation);
	}

	public ReservationVO selectModifyResv(int resNo) {
		return session.selectOne("reservation.dao.selectModifyResv", resNo);
	}

	public void updateReservation(ReservationVO reservation) {
		session.update("reservation.dao.updateReservation", reservation);
	}

	public void CancleResv(int resNo) {
		session.update("reservation.dao.cancleResv", resNo);
	}
}