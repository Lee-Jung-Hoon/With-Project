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

	public List<ReservationVO> selectResertion(String searchDay) {
		return session.selectList("reservation.dao.selectReservation", searchDay);
	}
	
}