package kr.co.spanner.user.reservation.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
	
}